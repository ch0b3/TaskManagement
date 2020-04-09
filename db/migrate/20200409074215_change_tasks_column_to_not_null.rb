class ChangeTasksColumnToNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :tasks, :name, false
    change_column_null :tasks, :description, false
    change_column_null :tasks, :deadline, false
    change_column_null :tasks, :status, false
    change_column_null :tasks, :user_id, false
    change_column_null :tasks, :priority_id, false
  end
end
