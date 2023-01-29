class AddDetailsToComics < ActiveRecord::Migration[7.0]
  def change
    add_column :comics, :name, :string
    add_column :comics, :description, :text
    add_column :comics, :reads_count, :integer
    remove_column :comics, :favorite, :boolean
    add_reference :comics, :user, null: false, foreign_key: true
  end
end
