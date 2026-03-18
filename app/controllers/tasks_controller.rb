class TasksController < ApplicationController
  before_action :authorize_request
  def index
    tasks = Task.all
    render json: tasks
  end

  def create
    task = Task.new(task_params)
    if task.save
      render json: task
    else
      render json: { error: "Task not created" }
    end
  end

  def show
    task = Task.find(params[:id])
    render json: task
  end

  def update
    task = Task.find(params[:id])

    if task.update(task_params)
      render json: task
    else
      render json: { error: "Update failed" }
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    render json: { message: "Task deleted" }
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :completed)
  end
end
