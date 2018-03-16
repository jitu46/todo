class TodoListsController < ApplicationController
  before_action :set_todo_list, only: [:show, :edit, :update, :destroy]

  # GET /todo_lists
  # GET /todo_lists.json
  def index
    if user_signed_in?
      @todo_lists = current_user.todo_lists
      @todo_lists.each do |l|
        @todoitem = l.todo_items
        @todoitem.each do |i|
          if (!i.completed?&&i.end<Date.today&&i.checked == 0)
              str = "Warning: Task: #{i.id} of TodoList: #{l.id} has been Timed Out."
              @n = Notification.create(:notice => str, :user_id => current_user, :todo_item_id => i.id)
          end
        end
      end
    end
  end

  # GET /todo_lists/1
  # GET /todo_lists/1.json
  def show
    #binding.pry
  end

  # GET /todo_lists/new
  def new
    @todo_list = current_user.todo_lists.build
  end

  # GET /todo_lists/1/edit
  def edit
  end

  # POST /todo_lists
  # POST /todo_lists.json
  def create
    @todo_list = current_user.todo_lists.build(todo_list_params)

    respond_to do |format|
      if @todo_list.save
        format.html { redirect_to @todo_list, notice: 'Todo list was successfully created.' }
        format.json { render :show, status: :created, location: @todo_list }
      else
        format.html { render :new }
        format.json { render json: @todo_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todo_lists/1
  # PATCH/PUT /todo_lists/1.json
  def update
    respond_to do |format|
      if @todo_list.update(todo_list_params)
        format.html { redirect_to @todo_list, notice: 'Todo list was successfully updated.' }
        format.json { render :show, status: :ok, location: @todo_list }
      else
        format.html { render :edit }
        format.json { render json: @todo_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todo_lists/1
  # DELETE /todo_lists/1.json
  def destroy
    @todo_list.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Todo list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo_list
      @todo_list = TodoList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_list_params
      params.require(:todo_list).permit(:title, :description)
    end
end
