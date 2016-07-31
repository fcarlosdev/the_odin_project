require 'csv'
require 'sunlight/congress'
require 'erb'
require 'date'

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4]
end

def legislators_by_zipcode(zipcode)
  Sunlight::Congress::Legislator.by_zipcode(zipcode)
end

def save_thank_you_letters(id,form_letter)
  Dir.mkdir("output") unless Dir.exists?("output")

  filename = "output/thanks_#{id}.html"

  File.open(filename,'w') do |file|
    file.puts form_letter
  end
end

def clean_phone(phone)
  phone = phone.gsub(/[^\d]/, '')
  phone = "0000000000" if phone.length < 10 || phone.length > 11 || (phone.length == 11 && phone[0] != 1)
  phone = phone[1..-1] if phone.length == 11 && phone[0] == 1
  return phone = phone[0..2].concat(" ").concat(phone[3..5]).concat("-").concat(phone[6..-1])
end

def peak_hours(hours_reg)
  max_value = hours_reg.values.max
  hours_of_peak = hours_reg.select{|k, v| v == max_value}.keys
  return hours_of_peak
end

def peak_days_week(days_hash)
  week_days = %w{ Sunday Monday Tuesday Wednesday Thursday Friday Saturday }
  peak_days = []
  days_hash.each do |key, value|
    peak_days.push(week_days[key]) if value == days_hash.values.max
  end
  return peak_days
end

puts "EventManager initialized."

contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol

template_letter = File.read "form_letter.erb"
erb_template = ERB.new template_letter

hours_hash = Hash.new(0)
days_hash = Hash.new(0)

contents.each do |row|
  id = row[0]
  name = row[:first_name]
  phone = clean_phone(row[:homephone])

  zipcode = clean_zipcode(row[:zipcode])
  legislators = legislators_by_zipcode(zipcode)
  form_letter = erb_template.result(binding)
  save_thank_you_letters(id,form_letter)

  datetime = DateTime.strptime(row[:regdate], '%m/%d/%y %k:%M')
  hours_hash[datetime.hour] += 1
  days_hash[datetime.wday] =+ 1

end

puts "Hours of peak: " + peak_hours(hours_hash).inspect
puts "Peak days: " + peak_days_week(days_hash).inspect
# puts "Days of week: " + days_hash.inspect
