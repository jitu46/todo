class NotificationController < ApplicationController
	before_action :find_notification , only: [:destroy]

	 def notification
	    @notifications = current_user.notifications.order("created_at DESC")
	 end

	def destroy
		if @notification.destroy
			redirect_to @notification
		end
	end

	def refresh
		@todo_list = current_user.todo_lists
  		@todo_list.each do |l|
			@todoitem = l.todo_items
			@todoitem.each do |i|
				if (!i.completed?)
					i.checked = false
					i.save!
				end
			end
		end
	end

  private


    # Use callbacks to share common setup or constraints between actions.
    def find_notification
      @notification = Notification.find(params[:id])
    end
end