require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:current_user) {User.create(name: "Pierce Test",
    email: "pierce@test.com",
    photo: "https://pbs.twimg.com/profile_images/856041767220649984/dJQxT0Dz.jpg")}

  let!(:article) {Article.create(title: "Test Post", text: "This is a test post",
    about: "This is the about", user_id: current_user.id.to_s)}

  let!(:comment) {Comment.create(body: "Hello World", article_id: article.id, user_id: current_user.id)}

  before do
    session[:user_id] = current_user.id
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:google]
  end

  describe "Post #create" do
    context "creating a new comment" do
      let :params do
        {article_id: article.id, comment: {body: "This is a NEW comment", user_id: current_user.id}}
      end
      it "creates an comment for the current user and redirects to article_path(param[:id])" do
        expect{post :create, params}.to change(Comment, :count).by(1)
        expect(session[:user_id]).to_not be_nil
        expect(response).to redirect_to article_path(article.id)
      end
    end

    context "creating a new comment with no body" do
      let :params do
        {article_id: article.id, comment: {body: "", user_id: current_user.id}}
      end
      it "fails to create a comment for the current article, redirects to article_path(param[:id])" do
        expect{post :create, params}.to change(Comment, :count).by(0)
        expect(session[:user_id]).to_not be_nil
        expect(response).to redirect_to article_path(article.id)
      end
    end
  end
  
  describe "DELETE #destroy" do
    context "delteing a comment from an article" do
      it "deletes the current article and redirects to artciles_path" do
        expect{delete :destroy,  {article_id: article.id, id: comment.id}}.to change(Comment, :count).by(-1)
        expect(response).to redirect_to article_path(article.id)
      end
    end
  end
end
