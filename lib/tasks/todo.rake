task :pick_winner => :environment do
	@users = User.all
	@users.each do |user|
		@todo_lists = user.todo_lists
      	@todo_lists.each do |l|
			
			@todoitem = l.todo_items

			@todoitem.each do |i|
				if (!i.completed? && i.end<Date.today && i.checked == false)
			    	str = "Warning:  Task: #{i.content} of TodoList: #{l.id}  #{user.email} has been Timed Out."
			    	@n = Notification.create(:notice => str, :user_id => user.id, :todo_item_id => i.id)
			    	 i.checked = true
             		 i.save!
			  	end
			end
		end
	end
end


task :ask do
	puts "where from"
end