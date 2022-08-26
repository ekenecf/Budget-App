require 'rails_helper'

RSpec.feature 'Login Page' do
  feature 'shows ' do
    background do
      visit new_user_session_path
      @user1 = User.create(name: 'example', email: 'example@gmail.com', password: 'example')
      within 'form' do
        fill_in 'Email', with: @user1.email
        fill_in 'Password', with: @user1.password
      end
      click_button 'Log in'
    end

    scenario 'shows my username after user login' do
      expect(page).to have_content("Welcome example")
    end
  end
end
