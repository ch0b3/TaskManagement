class TasksController < ApplicationController
  def index
    if params[:sort].present?
      case params[:sort].to_i
      when 1 then
        @tasks = Task.joins(:priority, :status_id).includes(:priority, :status_id).order(deadline: :desc)
      when 2 then
        @tasks = Task.joins(:priority, :status_id).includes(:priority, :status_id).order(deadline: :asc)
      when 3 then
        @tasks = Task.joins(:priority, :status_id).includes(:priority, :status_id).order(priority_id: :desc)
      when 4 then
        @tasks = Task.joins(:priority, :status_id).includes(:priority, :status_id).order(priority_id: :asc)
      else
        @tasks = Task.joins(:priority, :status_id).includes(:priority, :status_id).order(priority_id: :desc)
      end
    else
      @tasks = Task.joins(:priority, :status_id).includes(:priority, :status_id).order(created_at: :desc)
    end
  end

  def new
    @task = Task.new
    @priorities = Priority.all
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to tasks_path, notice: "タスク「#{@task.name}」を作成しました"
    else
      @priorities = Priority.all
      @statuses = Status.all
      render :action => "new"
    end

  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
    @priorities = Priority.all
    @statuses = Status.all
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      redirect_to tasks_path, notice: "タスク「#{@task.name}」を更新しました。"
    else
      @priorities = Priority.all
      @statuses = Status.all
      render :action => "edit"
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, notice: "タスク#{@task.name}を削除しました"
  end

  private

  def task_params
    params.require(:task).permit(:name,:description,:priority_id,:deadline, :status)
  end

end
