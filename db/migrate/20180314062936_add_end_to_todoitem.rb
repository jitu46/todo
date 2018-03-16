class AddEndToTodoitem < ActiveRecord::Migration[5.1]
  def change
    add_column :todo_items, :end, :date
  end
end
