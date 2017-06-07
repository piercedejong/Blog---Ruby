class User < ApplicationRecord
  before_create :create_uuid
  has_many :articles
  has_many :comments
  def self.create_user(auth_hash)
    User.create(
    email: auth_hash.info.email,
    name: auth_hash.info.name,
    photo: auth_hash.info.image
    )
  end

  def create_uuid
    begin
      self.uuid = SecureRandom.uuid
    end while self.class.exists?(:uuid => uuid)
  end

end
