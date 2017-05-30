class User < ApplicationRecord
  has_many :articles
  has_many :comments
  def self.create_user(auth_hash)
    User.create(
    email: auth_hash.info.email,
    name: auth_hash.info.nickname
    )
  end

end
