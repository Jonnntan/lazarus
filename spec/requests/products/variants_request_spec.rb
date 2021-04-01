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
      patch "/products/#{product_variant.product.id}/variants/#{product_variant.id}",  params: { variant: {inventory: 5} }

      expect(response).to redirect_to product_variant_path
      follow_redirect!
      expect(Variant.last.inventory).to eq(5)
    end
  end

  describe '#destroy' do
    let!(:product_variant) { create(:variant) }
    it 'destroy a Variant' do
      expect { delete product_variant_path(product_variant.product_id, product_variant.id) }.to change(Variant, :count).by(-1)
      expect(Variant.count).to be_zero
    end
  end
end
