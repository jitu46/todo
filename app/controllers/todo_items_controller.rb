class TodoItemsController < ApplicationController
	before_action :set_todo_list
	before_action :set_todo_item, except: [:create, :edit]


	def create
		#binding.pry
		@todo_item = @todo_list.todo_items.create(todo_item_params)
		redirect_to @todo_list
	end

	def edit
  	end 

	def destroy
		#binding.pry
		if @todo_item.destroy
			flash[:sucess] = "Todo list item was deleted."
		else
			flash[:sucess] = "Todo list item could not be deleted."
		end 
		redirect_to @todo_list
	end


	def complete
		#binding.pry
		@todo_item.update_attribute(:completed_at, Time.now)
		redirect_to @todo_list, notice: "Todo item completed"
	end

	private

	def set_todo_list
		@todo_list = TodoList.find(params[:todo_list_id])
	end

	def set_todo_item
		@todo_item = @todo_list.todo_items.find(params[:id])
	end

	def todo_item_params
		params.require(:todo_item).permit(:content, :end)
	end

	

end
