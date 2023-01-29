class AddDetailsToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :name, :string, null: false
    add_column :events, :description, :text, null: false
    add_column :events, :registered_users, :integer, default: 0
    add_reference :events, :user, null: false, foreign_key: true
    add_reference :events, :comic, null: false, foreign_key: true
  end
end
