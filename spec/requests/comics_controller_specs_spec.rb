require 'rails_helper'

RSpec.describe 'ComicsController', type: :request do
  describe 'GET /comics' do
    url = get_url('/comics')
    response = RestClient.get(url, { content_type: :json, accept: :json })

    it 'returns a list of comics' do
      expect(response.body).to include('data')
    end

    it 'returns status 200' do
      expect(response.code).to eq(200)
    end
  end

  describe 'GET /comics/:id' do
    url = get_url('/comics/39')
    response = RestClient.get(url, { content_type: :json, accept: :json })

    it 'returns status 200' do
      expect(response.code).to eq(200)
    end
  end
end
