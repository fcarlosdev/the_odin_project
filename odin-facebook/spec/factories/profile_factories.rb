FactoryBot.define do
  factory :profile do
    user
    birthday Date.new(1981,5, 12)
    country "World"
    education "Pos Graduate"
    profession "Web Developer"
    about_me "Like Tv shows, movies, learning idioms."
    email_notification false
  end
end
