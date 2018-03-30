FactoryBot.define do
  factory :user do
    email "test@test.com"
    password "password"
    firstname "Tester"
    lastname "Test"
    phone "+380000000000"
    country "Ukraine"
    city "Uzhorod"
  end
 end