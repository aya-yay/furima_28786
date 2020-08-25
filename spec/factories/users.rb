FactoryBot.define do
  gimei = Gimei.name

  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    family_name           {gimei.last.kanji}
    first_name            {gimei.last.kanji}
    family_name_kana      {gimei.last.katakana}
    first_name_kana       {gimei.first.katakana}
    birth_date            {Faker::Date.birthday(min_age: 15, max_age: 120)}
  end
end

