require 'rails_helper'

RSpec.describe User, type: :model do

  let!(:valid_user) {User.create(name: "Pierce Test", email: "pierce@test.com", photo: "https://pbs.twimg.com/profile_images/856041767220649984/dJQxT0Dz.jpg=3")}
  let(:invalid_user) {User.create(name: "Pierce Test", email: "", photo: "")}

  context "when passed valid params" do
    it "saves and creates a user" do
      expect(valid_user.valid?).to eq true
      expect(valid_user.name).to eq "Pierce Test"
      expect(User.all).to eq [valid_user]
    end
  end
end
