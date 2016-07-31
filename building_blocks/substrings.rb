def substrings(word, dictionary)
  ocorrences = Hash.new
  word.split.each do |a|
    dictionary.each do |w|
      if (a.downcase.include?(w))
        ocorrences[w] = (ocorrences[w] != nil ? ocorrences[w] + 1 : 1)
      end
    end
  end
  return ocorrences
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("below", dictionary).inspect
puts substrings("Howdy partner, sit down! How's it going?", dictionary).inspect
