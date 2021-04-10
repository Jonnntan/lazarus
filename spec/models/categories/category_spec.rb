require 'rails_helper'

RSpec.describe Category do

  describe 'association' do
    it { is_expected.to have_many(:products) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
  end
end