class CreateUserLog < ActiveRecord::Migration[7.0]
  def change
    create_table :user_logs do |t|
      t.string:username
      t.string:email
      t.timestamps
    end
  end
end
