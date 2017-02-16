class UsersController < ApplicationController

def edit
	if User.exists?(id: params[:id])
	  @user=User.find(params[:id])
	end

	if @user!=current_user
		redirect_to static_error_path
	end
end

def update
	@user=User.find(params[:id])
	if @user.update(user_params)
		flash[:notice]="Your Profile was successfully Updated!!"
		redirect_to root_path
	else
		flash[:notice]="Sorry!! Could not save!"
		render 'edit'
	end
end

private

def user_params
  params.require(:user).permit(:dob, :name,:college)
end

end
