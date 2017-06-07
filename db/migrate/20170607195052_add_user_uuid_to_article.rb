class AddUserUuidToArticle < ActiveRecord::Migration[5.0]
  def change
  	add_column :articles, :user_uuid, :string
  end
end
