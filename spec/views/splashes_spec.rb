require 'rails_helper'

RSpec.describe 'Budget app', type: :feature do
  describe 'index page' do
    it 'shows the right content' do
      visit splashes_path
      expect(page).to have_content("Budget App\nA mobile web application")
    end
  end
end
