require 'rails_helper'

RSpec.describe Article, type: :model do

  let!(:user) {User.create(name: "Pierce Test", email: "pierce@test.com", photo: "https://pbs.twimg.com/profile_images/856041767220649984/dJQxT0Dz.jpg=3")}
  let!(:valid_article) {Article.create(title: "Test Post", text: "Hello World, what an amazing day", about: "About this post", user_id: user.id)}
  let!(:invalid_article) {Article.create(title: "Test", text: "Hello World, what an amazing day", user_id: user.id)}

  context "when passed valid params" do
    it "saves and creates a user" do
      expect(valid_article.valid?).to eq true
      expect(valid_article.title).to eq "Test Post"
      expect(valid_article.text).to eq "Hello World, what an amazing day"
      expect(valid_article.about).to eq "About this post"
      expect(Article.all).to eq [valid_article]
    end
  end

  context "when passed invalid params" do
    it "saves and creates a user" do
      expect(invalid_article.valid?).to eq false
      expect(invalid_article.errors).to have_key(:title)
      expect(invalid_article.errors).to have_key(:about)
    end
  end
end
