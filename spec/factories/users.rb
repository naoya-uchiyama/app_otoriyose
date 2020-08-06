FactoryBot.define do
  
  factory :user do
    id                      {"1"}
    nickname                {"hoge"}
    email                   {"hoge@gmail.com"}
    password                {"aaaaaa"}
    password_confirmation   {"aaaaaa"}
  end
end