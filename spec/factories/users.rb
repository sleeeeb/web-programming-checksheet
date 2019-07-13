FactoryBot.define do
  factory :user do
    id { 1 }
    username { 'test' }
    email { 'ddd@gmail.com' }
    password { 'hoge0000' }
    password_confirmation { 'hoge0000' }
    start_date { Time.local(2017, 5, 1) }
  end
end
