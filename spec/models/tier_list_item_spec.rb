require 'rails_helper'

RSpec.describe TierListItem, type: :model do
  describe 'associations' do
    it { should belong_to(:tier_list) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_numericality_of(:tier).only_integer.is_greater_than(0) }

    context 'when tier is within the range of the associated tier_list' do
      let(:tier_list) { create(:tier_list, numTiers: 5) }
      let(:tier_list_item) { build(:tier_list_item, tier_list: tier_list, tier: 3) }

      it 'is valid' do
        expect(tier_list_item).to be_valid
      end
    end

    context 'when tier is outside the range of the associated tier_list' do
      let(:tier_list) { create(:tier_list, numTiers: 5) }
      let(:tier_list_item) { build(:tier_list_item, tier_list: tier_list, tier: 6) }

      it 'is invalid' do
        expect(tier_list_item).to be_invalid
        expect(tier_list_item.errors[:tier]).to include("must be within the range of 1 to #{tier_list.numTiers}")
      end
    end
  end
end
