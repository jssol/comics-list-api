require 'rails_helper'

RSpec.feature "ComicsControllers", type: :feature do
  describe 'GET /comics' do
    before do
      visit '/comics'
    end

    it 'returns a list of comics' do
      expect(page).to have_content('data')
      expect(page).to have_content('results')
    end

    it 'returns status 200' do
      expect(page.status_code).to eq 200
    end
  end

  describe 'GET /comics/:id' do
    before do
      visit '/comics/1'
    end

    it 'returns a specific comic' do
      expect(page).to have_content('data')
      expect(page).to have_content('results')
    end

    it 'returns status 200' do
      expect(page.status_code).to eq 200
    end
  end

  describe 'PATCH/PUT /comics/:id' do
    before do
      @comic = Comic.create(id: 1, title: 'Old Title', description: 'Old Description', thumbnail: 'Old Thumbnail')
      visit '/comics/1'
      fill_in 'comic[title]', with: 'New Title'
      fill_in 'comic[description]', with: 'New Description'
      fill_in 'comic[thumbnail]', with: 'New Thumbnail'
      click_button 'Update'
    end

    it 'updates the comic information' do
      expect(page).to have_content('New Title')
      expect(page).to have_content('New Description')
      expect(page).to have_content('New Thumbnail')
    end

    it 'returns status 200' do
      expect(page.status_code).to eq 200
    end
  end

  describe 'GET /comics/search?query=title' do
    before do
      visit '/comics/search?query=title'
    end

    it 'returns a list of comics' do
      expect(page).to have_content('data')
      expect(page).to have_content('results')
    end

    it 'returns status 200' do
      expect(page.status_code).to eq 200
    end
  end
end
