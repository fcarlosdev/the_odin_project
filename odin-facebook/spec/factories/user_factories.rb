FactoryBot.define do
  factory :user, aliases: [:friend, :commenter] do
    first_name "John"
    last_name  "Doe"
    sequence(:email) {|n| "john_doe#{n}@example.com" }
    password "password"
  end
end
