require 'rails_helper'

RSpec.describe Article, type: :model do

  let!(:user) {User.create(name: "Pierce Test", email: "pierce@test.com", photo: "https://pbs.twimg.com/profile_images/856041767220649984/dJQxT0Dz.jpg=3")}
  let!(:article) {Article.create(title: "Test Post", text: "Hello World, what an amazing day", about: "About this post", user_id: user.id)}
  let!(:valid_comment) {Comment.create(article_id: article.id, body: "Hello World", user_id: user.id)}
  let!(:invalid_comment) {Comment.create(article_id: article.id, body: "", user_id: user.id)}

  context "when passed valid params" do
    it "creats a new comment" do
      expect(valid_comment.valid?).to eq true
      expect(valid_comment.body).to eq "Hello World"
      expect(Comment.all).to eq [valid_comment]
    end
  end

  context "when passed invalid params" do
    it "fails to create a new comment" do
      expect(invalid_comment.valid?).to eq false
      expect(invalid_comment.errors).to have_key(:body)
    end
  end
end
