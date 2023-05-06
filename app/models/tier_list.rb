class TierList < ApplicationRecord
    has_many :tier_list_items, dependent: :destroy
    validates_presence_of :description, :name, :numTiers
end
