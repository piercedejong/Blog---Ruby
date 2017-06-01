require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  let(:current_user) {User.create(name: "Pierce Test",
    email: "pierce@test.com",
    photo: "https://pbs.twimg.com/profile_images/856041767220649984/dJQxT0Dz.jpg")}

  let :params do
    {article: {title: "Test Post", text: "This is a test post, text text text",
    about: "This is the about", user_id: current_user.id.to_s}}
  end

  before do
    session[:user_id] = current_user.id
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:google]
  end



  describe "Post #create" do
    context "when creating new article" do

      it "creates an article for the current user and redirects to article_path(param[:id])" do
        expect {
          post(:create, params)
        }.to change {Article.count }.by(1)
        expect(session[:user_id]).to_not be_nil
        expect(response).to redirect_to article_path(Article.last.id)
      end
    end
  end
end
