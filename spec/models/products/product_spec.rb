require 'rails_helper'

describe Product do
  let(:product) { create :product }

  describe 'associations' do
    it { is_expected.to belong_to(:brand) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:brand) }
    it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0) }
  end
end