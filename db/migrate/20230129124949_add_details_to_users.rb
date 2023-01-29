class AddDetailsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_index :users, :first_name
    add_column :users, :last_name, :string
    add_index :users, :last_name
    add_column :users, :role, :string, default: 'reader'
    add_column :users, :followers_count, :integer, default: 0
    add_column :users, :followed_count, :integer, default: 0
  end
end
