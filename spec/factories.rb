FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
  end

  factory :item do
    name "Google Nexus"
    price 60
    quantity 3
    general_description "New google phone"
  end

  factory :shoppingcart do
    quantity = 8
    user
  end

end

