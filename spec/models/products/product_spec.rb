require 'rails_helper'

describe Product do
  let(:product) { create :product }

  describe "respond to products" do
    it { should respond_to(:id) }
    it { should respond_to(:title) }
    it { should respond_to(:description) }
    it { should respond_to(:price) }
  end

  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:price) }
    it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0) }
  end

end