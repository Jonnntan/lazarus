require 'rails_helper'

RSpec.describe "Brands", type: :request do

  let(:brand_params) do
    attributes_for(:brand)
  end

  describe '#index' do
    let!(:brand) { create(:brand) }
    it 'list all Brands' do
      get '/brands'

      expect(response).to have_http_status(200)
      expect(response.body).to include('Brand 1')
    end
  end

  describe '#create' do
    it 'creates a Brand and redirects to brand/products page' do
      post '/brands', params: { brand: brand_params }

      expect(response).to redirect_to brand_products_path(Brand.last)
      follow_redirect!
      expect(response.body).to include('Brand 2 Product(s)')
    end
  end

  describe '#update' do
    let!(:brand) { create(:brand) }
    it 'update a Brand name and redirects to index' do
      put "/brands/#{brand.id}", params: { brand: {name: 'Sephora'} }

      expect(response).to redirect_to brands_path
      follow_redirect!
      expect(brand.reload.name).to eq('Sephora')
    end
  end

  describe '#destroy' do
    let!(:brand) { create(:brand) }
    let!(:product) do
       create_list(:product, 3, brand: brand)
    end
    it "destroy a Brand & all it's products" do

      brand1 = brand.first
      expect { brand1.destroy }.to change(Brand, :count).by(-1)
      expect { brand.products.destroy_all }.to change(Product, :count).by(-3)
      expect(Brand.count).to be_zero
      expect(brand.products.count).to be_zero
    end
  end
end
