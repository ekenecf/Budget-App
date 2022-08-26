require 'rails_helper'

RSpec.describe 'Recipe', type: :request do
  describe 'GET #index' do
    let(:user) do
      User.create!(name: 'Ekene', email: 'example@gmail.com', password: 111112)
    end
    let(:deals) do
      Deal.create!(name: 'Deal1', amount: 10)
    end

    before(:example) { get user_deals_path(user, user.deals) }

    it 'returns http success' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders correct page contents' do
        expect(response.body).to include('All deals')
    end

    it 'renders index template' do
      expect(response).to render_template('index')
    end
  end
end
