class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  def current_user
	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_score
    if current_user
  	  @current_score = current_user.score
    end
  end

  def questions
	@questions ||= Question.all
  end

  helper_method :current_user
  helper_method :current_score
  helper_method :questions
end
