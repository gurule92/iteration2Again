FactoryBot.define do
    factory :tier_list do
      name { "My Tier List" }
      description { "This is a sample tier list." }
      numTiers { 5 }
    end
  end
  