FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              { person.last.hiragana }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { person.last.kanji }
    first_name            { person.first.kanji }
    last_name_kana        { person.last.katakana }
    first_name_kana       { person.first.katakana }
    birthday              { Faker::Date.between(from: '1930-01-01', to: '2020-11-01') }
  end
end
