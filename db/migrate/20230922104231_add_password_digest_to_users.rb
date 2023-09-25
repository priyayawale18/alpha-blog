class AddPasswordDigestToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :user_logs, :password_digest, :string 
  end
end
