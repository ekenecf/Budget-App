require 'rails_helper'

RSpec.describe 'Hello world', type: :feature do
  describe 'index page' do
    let(:user) do
        User.create!(name: 'Ekene', email: 'example@gmail.com', password: 111223)
      end

      let(:groups) do
        Group.create!(user:, name: 'Life of a coder', icon: 'image path')
      end

    it 'shows the right content' do
      visit user_groups_path(user, user.groups)
      expect(page).to have_content('All groups')
    end

    it 'shows the user"s post"s body' do
        # user.save
        # post.save
        visit user_groups_path(user, user.groups)
        expect(page).to have_link('Back to user')
    end
  end
end
