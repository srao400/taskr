class TasksController < ApplicationController

  before_action :set_task, only:[:edit, :show, :destroy, :update]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
      if @task.save
        flash[:notice] = "Task was successfully saved"
      redirect_to task_path(@task)
    else
      render "new"
    end
  end

  def update
        if @task.update(task_params)
      flash[:notice] = "Task was successfully updated"
    redirect_to task_path(@task)
    else
      render "edit"
    end
  end

  def show
  end

  def destroy
      @task.destroy
      flash[:notice] = 'Task was sucessfully deleted'
      redirect_to tasks_path
  end


  private

  def set_task
    @task = Task.find(params[:id])
  end
  def task_params
    params.require(:task).permit(:content)
  end

end
