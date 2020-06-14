class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :signup_key, :string
    add_column :users, :name, :string
    add_column :users, :email, :string
    add_column :users, :avator, :string
    add_column :users, :provider, :string
    add_column :users, :uid, :string
  end
end
