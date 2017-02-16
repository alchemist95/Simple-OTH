class SessionsController < ActionController::Base
def create
  auth=request.env["omniauth.auth"]
  user=User.create_with_omniauth(auth)
  reset_session
  session[:user_id]=user.id
  val=User.f_o_c
  if val==1
  	flash[:notice]="Welcome Again!!"
  	redirect_to root_path
  else
  	flash[:notice]="Please Complete Your Profile"
  	redirect_to edit_user_path(id: user.id)
  end
end


def destroy
	reset_session
	flash[:notice]="You have successfully logged Out!!"
	redirect_to root_path
end

def failure
redirect_to root_url, :alert => "Authentication error"
end

end
