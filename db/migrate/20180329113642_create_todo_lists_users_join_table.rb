class CreateTodoListsUsersJoinTable < ActiveRecord::Migration[5.1]
	def change
	  # This is enough; you don't need to worry about order
	  #create_join_table :categories, :users

	  # If you want to add an index for faster querying through this join:
	  create_join_table :todo_lists, :users do |t|
	    t.index :todo_list_id
	    t.index :user_id
	  end
	end
end
