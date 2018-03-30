class CreateAccesses < ActiveRecord::Migration[5.1]
  def change
    create_table :accesses do |t|
      t.integer :user_id
      t.integer :todo_list_id
      t.boolean :read
      t.boolean :create
      t.boolean :update

      t.timestamps
    end
  end
end
