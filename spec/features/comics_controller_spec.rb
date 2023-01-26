require 'rails_helper'

RSpec.feature 'ComicsControllers', type: :feature do
  describe 'GET /comics' do
    before do
      visit '/comics'
    end
    it 'returns a list of comics' do
      expect(page).to have_content('id')
    end
    it 'returns status 200' do
      expect(page.status_code).to eq 200
    end
  end
  describe 'GET /comics/:id' do
    before do
      visit '/comics/39'
    end
    it 'returns a specific comic' do
      expect(page).to have_content('id')
    end
    it 'returns status 200' do
      expect(page.status_code).to eq 200
    end
  end
  describe 'GET /comics/search?query=hulk' do
    before do
      visit '/search?query=hulk'
    end
    it 'returns status 200' do
      expect(page.status_code).to eq 200
    end
  end
end
