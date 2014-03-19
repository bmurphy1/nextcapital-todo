class TodosController < ApplicationController
  def index
    render :json => current_user.todos.to_json(:except => [:user_id])
  end

  def update
    todo = current_user.todos.find(params[:id])
    todo.update_columns(todo_params)
    render :json => todo.to_json(:except => [:user_id])
  end

  def create
    render :json => current_user.todos.create(todo_params)
  end

  def todo_params
    params.require(:todo).permit(:description, :is_complete)
  end
end
