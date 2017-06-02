require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  let(:current_user) {User.create(name: "Pierce Test",
    email: "pierce@test.com",
    photo: "https://pbs.twimg.com/profile_images/856041767220649984/dJQxT0Dz.jpg")}
  let!(:art) {Article.create(title: "Test Post", text: "This is a test post",
    about: "This is the about", user_id: current_user.id.to_s)}

  before do
    session[:user_id] = current_user.id
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:google]
  end
  
  describe "Post #create" do
    context "when creating new article" do
      let :params do
        {article: {title: "Test Post", text: "This is a test post, NEW",
        about: "This is the about", user_id: current_user.id.to_s}}
      end
      it "creates an article for the current user and redirects to article_path(param[:id])" do
        expect {post(:create, params)}.to change {Article.count}.by(1)
        expect(session[:user_id]).to_not be_nil
        expect(response).to redirect_to article_path(Article.last.id)
      end
    end
  end

  describe "PUT #update" do
    context "when editing an existing article" do
      let(:attr) do { title: 'Test UPDATE', text: 'This is a test UPDATE',
        about: "About UPDATE", user_id: current_user.id.to_s }
      end
    before(:each) do
      put :update, id: art.id, article: attr
      art.reload
    end
    it "update the selected article with the new aprams and redirects to article_path(param[:id])" do
      expect(art.title).to eq attr[:title]
      expect(art.about).to eq attr[:about]
      expect(art.text).to eq attr[:text]
      expect(response).to redirect_to article_path(art.id)
      end
    end

    context "Editing an exisitng article with the incorrect params" do
      let(:attr) do { title: 'DATE', text: 'This is a test UPDATE',
        about: "About UPDATE", user_id: current_user.id.to_s }
      end
    before(:each) do
      put :update, id: art.id, article: attr
      art.reload
    end
    it "fail to updates seelcted article and redirect to current path" do
      expect(art.title).to_not eq attr[:title]
      expect(response).to_not redirect_to article_path(art.id)
      end
    end
  end

  describe "DELETE #destroy" do
    context "when deleting an article" do
      it "deletes the current article and redirects to artciles_path" do
        expect{delete :destroy,  {id: art.id}}.to change {Article.count}.by(-1)
        expect(response).to redirect_to articles_path
      end
    end
  end
end
