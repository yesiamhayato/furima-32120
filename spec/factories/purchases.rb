FactoryBot.define do
  factory :purchase do
    token {"tok_abcdefghijk00000000000000000"}
    zip_code {"123-4567"}
    prefecture_id {"2"}
    city {"夕張市"}
    house_number {"東五反田2-8-5"}
    phone_number {"08022227777"}
    association :user
    association :item
  end
end
