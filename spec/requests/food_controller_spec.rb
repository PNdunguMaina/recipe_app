require 'rails_helper'
require_relative '../support/devise'

RSpec.describe 'Foods', type: :controller do
  login_user
  before(:each) do
    @food = Food.create(name: 'testfood', measurement_unit: 'gram', price: 10, user_id: 1)
  end
  describe 'GET #index' do
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
  end
end
