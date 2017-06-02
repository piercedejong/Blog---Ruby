require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:current_user) {User.create(name: "Pierce Test",
    email: "pierce@test.com",
    photo: "https://pbs.twimg.com/profile_images/856041767220649984/dJQxT0Dz.jpg")}
  let!(:article) {Article.create(title: "Test Post", text: "This is a test post",
    about: "This is the about", user_id: current_user.id.to_s)}

  before do
    session[:user_id] = current_user.id
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:google]
  end

  describe "Post #create" do
    context "creating a new comment" do
      let :params do
        {article_id: article.id, comment: {body: "This is a NEW comment", user_id: current_user.id}}
      end
      it "creates an article for the current user and redirects to article_path(param[:id])" do
        expect{post :create, params}.to change(Comment, :count).by(1)
        expect(session[:user_id]).to_not be_nil
        expect(response).to redirect_to article_path(Article.last.id)
      end
    end

end























end
