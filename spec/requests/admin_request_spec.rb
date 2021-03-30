require 'rails_helper'

RSpec.describe "Admins", type: :request do
  describe '#index' do
    it 'display Products & Brands link' do
      get '/'
      expect(response).to have_http_status(200)
    end
  end
end
