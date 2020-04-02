class AddReferenceToTasksAndUsers < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :tasks, :users
    add_index :tasks, :user_id
  end
end
