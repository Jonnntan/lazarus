require 'rails_helper'

RSpec.describe "Categories", type: :request do

  let(:category_params) do
    attributes_for(:category)
  end

  describe '#index' do
    let!(:category) { create(:category) }
    it 'list all Categories' do
      get '/categories'

      expect(response).to have_http_status(200)
      expect(response.body).to include('Category 1')
    end
  end

  describe '#create' do
    it 'creates a new Category and redirects to category_path' do
      post '/categories', params: { category: category_params }

      expect(response).to redirect_to category_path(Category.last)
      follow_redirect!
      expect(response.body).to include('Category 2')
    end
  end

  describe '#update' do
    let!(:category) { create(:category) }
    it 'update a Category name and redirects to category_path' do
      put "/categories/#{category.id}", params: { category: {name: 'Skincare'} }

      expect(response).to redirect_to category_path
      follow_redirect!
      expect(category.reload.name).to eq('Skincare')
    end
  end

  describe "#destroy" do
    let!(:category) { create(:category) }
    let!(:product) do
      create_list(:product, 3, category: category)
    end
    it "destroy a Category & all it's products" do
      delete(category_path(category))

      expect(Category.count).to be_zero
      expect(category.products.count).to be_zero
    end
  end
end
