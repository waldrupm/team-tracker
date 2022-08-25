FactoryBot.define do
  factory :team do
    name { Faker::Team.name }
    pro { [false, true].sample }
    last_year_finish { rand(32) }
  end
end
