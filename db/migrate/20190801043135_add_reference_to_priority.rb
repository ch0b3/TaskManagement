class AddReferenceToPriority < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks, :priority
  end
end
