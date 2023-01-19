class CreateComics < ActiveRecord::Migration[7.0]
  def change
    create_table :comics do |t|
      t.boolean :favorite

      t.timestamps
    end
  end
end
