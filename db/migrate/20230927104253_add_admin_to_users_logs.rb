class AddAdminToUsersLogs < ActiveRecord::Migration[7.0]
  def change
    add_column :user_logs, :admin, :boolean, default: false
  end
end
