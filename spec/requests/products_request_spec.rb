require 'rails_helper'

RSpec.describe 'Products', type: :request do

  let(:brand) { create(:brand) }

  let(:product_params) do
    attributes_for(:product) do |pd|
      pd[:brand_id] = brand.id
    end
  end

  describe '#index' do
    let!(:product_brand) { create(:product, brand: brand) }
    it 'list all Products' do
      get '/products'

      expect(response).to have_http_status(200)
      expect(response.body).to include('Test product 1')
    end
  end

  describe '#create' do
    it 'creates a Product and redirects to the show page' do
      post '/products', params: { product: product_params }

      expect(response).to redirect_to product_path(brand.products.last.id)
      follow_redirect!
      expect(response.body).to include('Test product 2')
    end
  end

  describe '#update' do
    let(:product_brand) { create(:product, brand: brand) }
    it 'update a Product details and redirects to the show page' do
      put "/products/#{product_brand.id}", params: { product: {title: 'Lipstick'} }

      expect(response).to redirect_to product_path(brand.products.last.id)
      follow_redirect!
      expect(product_brand.reload.title).to eq('Lipstick')
    end
  end

  describe '#destroy' do
    let!(:product_brand) do
      create_list(:product, 3, brand: brand)
    end
    it 'destroy a Product and redirects to index page' do
      product1 = product_brand.first
      delete(product_path(product1))
      expect(Product.ids).not_to include(product1.id)
      expect(Product.count).to eq(2)
    end
  end

  # describe '#search' do
  #   let!(:product_brand) { create(:product, brand: brand) }
  #   it 'search Products by title' do
  #     get '/search?search=test+product'

  #     expect(response.body).to include('Test product 5')
  #     expect(response).to have_http_status(200)
  #   end
  # end
end
