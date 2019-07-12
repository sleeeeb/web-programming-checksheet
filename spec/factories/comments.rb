FactoryBot.define do
  factory :comment do
    content_id { 1 }
    text { 'test' }
    user_id { 1 }
  end
end
