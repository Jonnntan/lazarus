require 'rails_helper'

RSpec.describe "Brands::Products", type: :request do

  describe "#index" do
    let(:brand) { create(:brand) }
    let!(:product) do
      3.times { create(:product, brand: brand) }
    end
    it 'list all Products of a Brand' do
      get "/brands/#{brand.id}/products"

      expect(response).to have_http_status(200)
      expect(Product.count).to eq(3)
      expect(response.body).to include('Test product 1')
      expect(response.body).to include('Test product 2')
      expect(response.body).to include('Test product 3')
    end
  end

  descirbe
end