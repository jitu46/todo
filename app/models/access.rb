class Access < ApplicationRecord
	belongs_to :user
	belongs_to :todo_list
end
