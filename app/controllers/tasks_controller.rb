class TasksController < ApplicationController
  def index #GET / tasks
    @tasks = Task.all
  end

  def show #GET / tasks/:id
    @task = Task.find(params[:id])
  end

  def new #GET / tasks/new
    @task = Task.new
  end

  def create #POST / tasks
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to tasks_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private
  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

end
