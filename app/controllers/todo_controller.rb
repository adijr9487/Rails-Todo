class TodoController < ApplicationController
  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.user_id = session[:user_id]
    if @todo.save
      redirect_to index_user_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def mark_complete
    @todo = Todo.find_by(id: params[:id])
    @todo.completed = true
    @todo.save
    redirect_to index_user_path
  end

  def destroy
    @todo = Todo.find_by(id: params[:id])
    @todo.destroy
    redirect_to index_user_path
  end

  def todo_params
    params.require(:todo).permit(:title, :action, :datetime)
  end
end
