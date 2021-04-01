require 'rails_helper'

describe Variant do
  
  describe "associations" do
    it { is_expected.to belong_to(:product) }
  end

    describe 'validations' do
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:inventory) }
      it { should validate_presence_of(:price) }
      it { should validate_presence_of(:product) }
      it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0) }
    end
end
