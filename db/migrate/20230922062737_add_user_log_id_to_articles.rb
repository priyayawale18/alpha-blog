class AddUserLogIdToArticles < ActiveRecord::Migration[7.0]
  def change
    add_reference :articles, :user_log, null: true, foreign_key: true
  end
end
