FactoryBot.define do
    factory :tier_list_item do
      tier_list
      name { "Tier List Item" }
      description { "This is a sample tier list item." }
      tier { 2 }
      justification {"This is a justification"}
    end
  end
  