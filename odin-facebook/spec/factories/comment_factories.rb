FactoryBot.define do
  factory :comment do
    body "Nice post!!"
    post
    commenter
  end
end
