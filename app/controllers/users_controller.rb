class UsersController < ApplicationController
	skip_before_action :login_required, only: [:new, :create, :edit, :update ]


def new
	@user = User.new
end

def create
	@user = User.new(user_params)
	if @user.save
		session[:user_id] = @user.id
		flash[:success] = "user successfully created"
		redirect_to user_path(@user.id)
	else
		flash[:error] = "Something went wrong"
		render 'new'
	end
end



def show 
	@user = User.find(params[:id])
	@tasks = current_user.tasks.order(created_at: :desc)
end 

end


private 

def user_params
	params.require(:user).permit(:name, :email, :password, :password_confirmation)
end 
