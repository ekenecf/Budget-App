require 'rails_helper'

RSpec.describe 'Recipe', type: :request do
  describe 'GET #index' do
    let(:user) do
      User.create!(name: 'Ekene', email: 'example@gmail.com', password: 111_112)
    end

    before(:example) { get user_groups_path(user, user.groups) }

    it 'returns http success' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders correct page contents' do
      expect(response.body).to include('No group added')
    end

    it 'renders index template' do
      expect(response).to render_template('index')
    end
  end
end
