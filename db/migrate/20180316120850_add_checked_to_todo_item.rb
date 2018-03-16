class AddCheckedToTodoItem < ActiveRecord::Migration[5.1]
  def change
    add_column :todo_items, :checked, :boolean , :default => 0
    
  end
end
