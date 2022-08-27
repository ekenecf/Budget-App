require 'rails_helper'

RSpec.describe 'Hello world', type: :feature do
  describe 'index page' do
    let(:user) do
      User.create!(name: 'Ekene', email: 'example@gmail.com', password: 111_223)
    end

    let(:deals) do
      Deal.create!(user:, name: 'Deal name', amount: 30)
    end

    it 'shows the right content' do
      visit user_deals_path(user, user.groups)
      expect(page).to have_content('All deals')
    end

    it 'shows the right content' do
      # user.save
      # deals.save
      visit user_deals_path(user, user.groups)
      expect(page).to have_content(deals.name)
    end

    it 'shows the user"s post"s body' do
      # user.save
      # post.save
      visit user_groups_path(user, user.groups)
      expect(page).to have_link('Back to user')
    end
  end
end
