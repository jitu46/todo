class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.string :notice
      t.references :todo_item
      t.references :user

      t.timestamps
    end
  end
end
