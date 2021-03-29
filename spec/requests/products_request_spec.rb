require 'rails_helper'

RSpec.describe 'Products', type: :request do

  let(:brand) { create(:brand) }
  let!(:product_brand) { create(:product, brand: brand) }

  before do
    @products_params = attributes_for(:product) do |pd|
      pd[:brand_id] = brand.id
    end
  end

  describe '#index' do
    it 'list all Products' do
      get '/products'
      expect(response).to render_template(:index)
      expect(response).to have_http_status(200)
    end
  end

  describe '#create' do
    it 'creates a Product and redirects to the show page' do
      post '/products', params: { product: @products_params }
      follow_redirect!
      expect(response).to render_template(:show)
    end
  end

  describe '#update' do
    it 'update a Product details and redirects to the show page' do
      put "/products/#{product_brand.id}", params: { product: @products_params }
      follow_redirect!
      expect(response).to render_template(:show)
    end
  end

  describe '#destroy' do
    it 'destroy a Product and redirects to index page' do
      expect { delete product_path(product_brand.id) }.to change(Product, :count).by (-1)
    end
  end
end
