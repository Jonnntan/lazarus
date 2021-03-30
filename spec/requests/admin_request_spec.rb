require 'rails_helper'

RSpec.describe "Admins", type: :request do
  describe '#index' do
    it 'display Products & Brands link and Search button' do
      get '/'
      expect(response).to have_http_status(200)
      expect(response.body).to include('Products')
      expect(response.body).to include('Brands')
      expect(response.body).to include('Search')
    end
  end
end
