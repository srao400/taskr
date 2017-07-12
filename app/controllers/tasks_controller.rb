class TasksController < ApplicationController

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end


  private
  def task_params
    params.require(:task).permit(:content)
  end

end
