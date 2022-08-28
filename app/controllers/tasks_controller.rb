class TasksController < ApplicationController
  before_action :login_required, only: [:index]
	before_action :authenticate_user, only: %i[new]

	def index  
		@tasks = current_user.tasks.order(created_at: "DESC") 
		if params[:sort_expired]
			@tasks = current_user.tasks.order(deadline: "DESC")
		elsif params[:sort_priority] 
			@tasks = current_user.tasks.order(priority: "DESC") 
		end 

		if params[:task]
			if task_params[:title] && task_params[:status].present?
			@tasks = Task.title_status(task_params[:title], task_params[:status])
			elsif task_params[:title]
			@tasks = Task.search_title(task_params[:title])
			elsif task_params[:status]
			@tasks = Task.search_status(task_params[:status])
			end 
		end 
		@tasks = @tasks.page(params[:page])
	end 

	def show 
		@task = Task.find(params[:id])
	end 

	def new 
    if params[:back]
      @task = Task.new(task_params)
    else
      @task = Task.new
    end
  end

	def create 
		@task = Task.new(task_params)
		if @task.save
			redirect_to tasks_path
			flash[:success] = 'Taskを登録しました!'
		else 
			render :new 
		end 
	end 

	def edit 
		@task = Task.find(params[:id]) 
	end 

	def update 
		@task = Task.find(params[:id])
		if @task.update(task_params)
			redirect_to tasks_path 
			flash[:info] = 'Taskを更新しました!'
		else  
			render :edit 
		end 
	end  

	def destroy 
		@task = Task.find(params[:id])
		if @task.destroy 
			redirect_to tasks_path 
			flash[:danger] = 'Taskを削除しました!'
		else  
			render :index 
		end
	end 

	

	private

	def task_params 
		params.require(:task).permit(:title, :content, :deadline, :status, :priority)
	end 

	def authenticate_user 
		unless @user = current_user 
			redirect_to tasks_path 
		end  
	end 

end

