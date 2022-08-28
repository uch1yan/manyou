class Admin::UsersController < ApplicationController 
  before_action :admin_user

  def index
    @users = User.all.includes(:tasks)
  end

  def new 
    @user = User.new 
  end 

  def create 
    @user = User.new(user_params)
    if @user.save 
      redirect_to admin_users_path
    else  
      render :new 
    end 
  end 

  def show
    @user = User.find(params[:id])
  end
  
  def edit 
    @user = User.find(params[:id]) 
  end 

  def update 
    @user = User.find(params[:id])
    if @user.update(user_params) 
      redirect_to admin_users_path
      flash[:success] = 'User情報を更新しました!'
    else 
      render :edit
    end 
  end 

  def destroy
    @user = User.find(params[:id])
		if @user.destroy 
			redirect_to admin_users_path 
			flash[:danger] = 'Userを削除しました!'
		else 
      redirect_to admin_users_path 
      flash[:danger] = '管理者は一人以上必要です'
		end  
  end 

  private 

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin )
  end 


  def admin_user 
    unless current_user.admin?
      redirect_to tasks_path 
      flash[:danger] = '管理者以外はアクセスできません'
    end 
  end 


end



