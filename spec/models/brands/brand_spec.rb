require 'rails_helper'

RSpec.describe Brand do
  let(:brand) { create :brand }

  describe 'association' do
    it { is_expected.to have_many(:products) }
  end
end
