class ChangeUuidToStringInArticles < ActiveRecord::Migration[5.0]
  def change
  	change_column :articles, :uuid, :string
  end
end
