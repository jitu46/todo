class TodoList < ApplicationRecord
	has_many :todo_items , dependent: :destroy 
	has_and_belongs_to_many :user

	has_many :accesses
	has_many :users, through: :accesses
end
