require 'rails_helper'

RSpec.describe "Brands::Products", type: :request do

  let(:product_params) do
    attributes_for(:product)
  end

  describe "#index" do
    let(:brand) { create(:brand) }
    let!(:product) do
      create_list(:product, 3, brand: brand)
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

  describe "#create" do
    let!(:brand) { create(:brand) }
    it 'creates new Product of a selected brand' do
      post "/brands/#{brand.id}/products", params: { product: product_params }

      expect(response).to redirect_to product_path(brand.products.last)
      follow_redirect!
      expect(response.body).to include('Test product 4')
    end
  end

  describe "#update" do
    let!(:product) { create(:product) }
    it 'update a Product and redirect to show page' do
      put "/brands/#{product.brand_id}/products/#{product.id}", params: { product: { title: 'Sephora Lipstick' } }

      expect(response).to redirect_to product_path
      follow_redirect!
      expect(product.reload.title).to eq('Sephora Lipstick')
    end
  end

  describe '#destroy' do
    let!(:product) do
      create_list(:product, 3)
    end
    it 'destroy a Product' do
      product1 = product.first

      delete(brand_product_path(product1.brand_id, product1.id))
      expect(Product.ids).not_to include(product1.id)
      expect(Product.count).to eq(2)
    end
  end
end