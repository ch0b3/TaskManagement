class ChangePrioritiesColumnToNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :priorities, :value, false
  end
end
