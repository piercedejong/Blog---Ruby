class AddAbout < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :about, :string
  end
end
