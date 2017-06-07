class AddUserUuidToComments < ActiveRecord::Migration[5.0]
  def change
  	add_column :comments, :user_uuid, :string
  end
end
