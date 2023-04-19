class TierList < ApplicationRecord
    has_many :tier_list_items, dependent: :destroy
end
