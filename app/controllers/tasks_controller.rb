class TasksController < ApplicationController
  def index
    @tasks = Task.all.order(created_at: :desc)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(
      name: params[:name],
      description: params[:description],
      deadline: params[:deadline],
      # label: params[:label],
      priority: params[:priority]
    )

    if @task.save
      flash[:notice] = "タスクを作成しました"
      redirect_to("/tasks")
    else
      render("tasks/new")
    end

  end



end
