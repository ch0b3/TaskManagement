class TasksController < ApplicationController
  before_action :set_properties, { only: %i[index new create edit update] }

  def index
    @tasks = current_user.tasks.joins(:priority, :status_table)
                         .preload(:priority, :status_table)
                         .eager_load(:labels)
    @tasks = @tasks.where(labels: { id: params[:label_id] }) if params[:label_id].present?

    @tasks = if sort_column && sort_direction
               @tasks.order(params[:sort_column].to_sym => params[:sort_direction].to_sym)
             else
               @tasks.order(created_at: :desc)
             end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params.merge(user_id: current_user.id))

    if @task.save
      redirect_to tasks_path, notice: "タスク「#{@task.name}」を作成しました"
    else
      render action: 'new'
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = find_task_of_current_user
  end

  def update
    @task = find_task_of_current_user

    if @task.update(task_params)
      redirect_to tasks_path, notice: "タスク「#{@task.name}」を更新しました。"
    else
      render action: 'edit'
    end
  end

  def destroy
    @task = find_task_of_current_user
    @task.destroy
    redirect_to tasks_path, notice: "タスク#{@task.name}を削除しました"
  end

  private

  def set_properties
    @priorities = Priority.all
    @statuses = Status.all
    @labels = Label.all
  end

  def task_params
    params.require(:task).permit(:name, :description, :priority_id, :deadline, :status, { label_ids: [] })
  end

  def sort_column
    %w[deadline priority_id].include?(params[:sort_column])
  end

  def sort_direction
    %w[asc desc].include?(params[:sort_direction])
  end

  def find_task_of_current_user
    current_user.tasks.find(params[:id])
  end
end
