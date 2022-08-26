FactoryBot.define do
  factory :player do
    name { Faker::FunnyName.two_word_name }
    drafted { [true, false].sample }
    rating { rand(350) }
    team
  end
end
