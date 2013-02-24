FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "Tester#{n}"}
    sequence(:email) { |n| "tester_#{n}@test.com" }
    #password  "foo1234"
    #password_confirmation "foo1234"

    factory :admin do
      admin true
    end
  end

  factory :post do
    sequence(:subject) { |n| "Title #{n}" }
    content Faker::Lorem.sentence 10
    user
  end
end