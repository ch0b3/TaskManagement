class Admin::UsersController < ApplicationController
  before_action :admin_user

  def index
    @users = User.eager_load(:tasks)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save!
      redirect_to admin_users_path, notice: "ユーザー:「#{@user.name}」を作成しました"
    else
      render :action => "new"
    end

  end

  def show
    @user = User.find(params[:id])
    @tasks = @user.tasks.joins(:priority, :status_table).preload(:priority, :status_table)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to admin_users_path, notice: "ユーザー:「#{@user.name}」を更新しました。"
    else
      render :action => "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy!
    redirect_to admin_users_path, notice: "ユーザー:#{@user.name}を削除しました"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :admin)
  end

  def admin_user
    raise Forbidden unless current_user.admin?
  end
end
