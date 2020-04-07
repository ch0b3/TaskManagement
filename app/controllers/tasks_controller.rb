class TasksController < ApplicationController

  before_action :set_properties, {only: [:create, :edit, :update]}

  def index
    @tasks = current_user.tasks.joins(:priority, :status_table).includes(:priority, :status_table)

    if sort_column && sort_direction
      @tasks = @tasks.order(params[:sort_column].to_sym => params[:sort_direction].to_sym)
    else
      @tasks = @tasks.order(created_at: :desc)
    end
  end

  def new
    @task = Task.new
    @priorities = Priority.all
  end

  def create
    @task = Task.new(task_params.merge(user_id: current_user.id))

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
    @task = task_find
  end

  def update
    @task = task_find

    if @task.update(task_params)
      redirect_to tasks_path, notice: "タスク「#{@task.name}」を更新しました。"
    else
      render :action => "edit"
    end
  end

  def destroy
    @task = task_find
    @task.destroy
    redirect_to tasks_path, notice: "タスク#{@task.name}を削除しました"
  end

  private

  def set_properties
    @priorities = Priority.all
    @statuses = Status.all
  end

  def task_params
    params.require(:task).permit(:name,:description,:priority_id,:deadline, :status)
  end

  def sort_column
    %W[deadline priority_id].include?(params[:sort_column])
  end

  def sort_direction
    %W[asc desc].include?(params[:sort_direction])
  end

  def task_find
    current_user.tasks.find(params[:id])
  end
end
