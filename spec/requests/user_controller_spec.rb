require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #index' do
    it 'assigns @users with all users' do
      user1 = User.create!(name: 'Tega', posts_counter: 0)
      user2 = User.create!(name: 'Mucha', posts_counter: 0)

      get :index

      expect(response).to be_successful

      expect(assigns(:users)).to match_array([user1, user2])
    end

    it 'renders the index template' do
      get :index

      expect(response).to render_template(:index)
    end
  end
end


