class TierListItem < ApplicationRecord
  belongs_to :tier_list
  validates_presence_of :description, :name, :tier, :justification
  validates :tier, numericality: { only_integer: true, greater_than: 0 }

  validate :tier_within_range

  def tier_within_range
    if tier.present? && tier_list.present? && (tier < 1 || tier > tier_list.numTiers)
      errors.add(:tier, "must be within the range of 1 to #{tier_list.numTiers}")
    end
  end

end
