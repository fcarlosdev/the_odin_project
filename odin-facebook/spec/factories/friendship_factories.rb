FactoryBot.define do
  factory :friendship do
    user
    friend
    accepted true
  end
end
