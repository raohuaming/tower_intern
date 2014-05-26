class AddPasswordDigestToUsers < ActiveRecord::Migration
  def up
    add_column :users, :password_digest, :text
    remove_column :users, :encrypted_password
    remove_column :users, :salt
  end

  def down
    remove_column :users, :password_digest
    add_column :users, :encrypted_password, :string
    remove_column :users, :salt, :string
  end
end
