require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  before do
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:google]
  end

  describe "POST #create" do
    context "when the user is a new user" do
      it "creates a user and redirects to artilces_path" do
        expect {
          post :create, provider: :google
        }.to change{ User.count }.by(1)
        expect(session[:user_id]).to_not be_nil
        expect(response).to have_http_status 302
        expect(response).to redirect_to articles_path
      end
    end

    context "when it's a RETURNING  an exisitng user" do
      before do
        User.create(name: "Pierce Test")
      end

      it "finds the user and redirects to articles_path" do
        post :create, provider: :google
        expect(User.find_by(name: "Pierce Test")).to be_a User
        expect(session[:user_id]).to_not be_nil
        expect(response).to have_http_status 302
        expect(response).to redirect_to articles_path
      end
    end
  end
end
