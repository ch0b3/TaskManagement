class AddColumnToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :description, :text
    add_column :tasks, :deadline, :date
    add_column :tasks, :priority , :string
    add_column :tasks, :status, :integer
    add_column :tasks, :user_id, :integer
  end
end
