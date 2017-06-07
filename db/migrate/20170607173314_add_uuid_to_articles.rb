class AddUuidToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :uuid, :integer
  end
end
