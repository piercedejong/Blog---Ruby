class Article < ApplicationRecord
	before_create :create_uuid
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: {minimum: 5}
  validates :about, presence: true, length: {minimum: 5}

  def create_uuid
    begin
      self.uuid = SecureRandom.uuid
    end while self.class.exists?(:uuid => uuid)
  end
  	
end
