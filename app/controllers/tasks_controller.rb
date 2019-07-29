class TasksController < ApplicationController
  def index
    @tasks = Task.all.order(created_at: :desc)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to tasks_path, notice: "タスク「#{@task.name}」を作成しました"
    else
      render :action => "new"
    end

  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    
    if @task.update(task_params)
      redirect_to task_path(@task), notice: "タスク「#{@task.name}」を更新しました。"
    else
      render :action => "edit"
    end
  end

  private

  def task_params
    params.require(:task).permit(:name,:description,:priority,:deadline)
  end

end
