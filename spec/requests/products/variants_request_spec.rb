require 'rails_helper'

RSpec.describe "Products::Variants", type: :request do

  let(:variant_params) do
    attributes_for(:variant)
  end

  describe "#index" do
    let!(:product_variant) { create(:variant) }
    it 'list all Variants of a Product' do
      get "/products/#{product_variant.product_id}/variants"

      expect(response).to have_http_status(200)
      expect(response.body).to include('Variant 1')
    end
  end

  describe '#create' do
    let!(:product) { create(:product) }
    it 'creates new Variant and redirects to index page' do
      post "/products/#{product.id}/variants", params: { variant: variant_params }

      expect(response).to redirect_to product_variants_path
      follow_redirect!
      expect(response.body).to include('Variant 2')
    end
  end

  describe '#update' do
    let!(:product_variant) { create(:variant) }

    it 'update a Variant and redirects to index page' do
      put "/products/#{product_variant.product.id}/variants/#{product_variant.id}",  params: { variant: {inventory: 5} }

      expect(response).to redirect_to product_variant_path
      follow_redirect!
      expect(product_variant.reload.inventory).to eq(5)
      expect(response.body).to include('Variant 3')
    end
  end

  describe '#destroy' do
    let!(:product_variant) do
      create_list(:variant, 3)
    end
    it 'destroy a Variant' do
      variant1 = product_variant.first
      
      delete(product_variant_path(variant1.product_id, variant1.id))
      expect(Variant.ids).not_to include(variant1.id)
      expect(Variant.count).to eq(2)
    end
  end
end
