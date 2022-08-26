require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before(:example) { get('/users') }

    it 'should have an http success response' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders correct page contents' do
      expect(response.body).to include('Sign in')
    end

    it 'renders index template' do
      expect(response).to render_template('index')
    end
  end
end
