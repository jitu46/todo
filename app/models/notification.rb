class Notification < ApplicationRecord
	belongs_to :user

	belongs_to :todo_item 
end
