class StaticController < ApplicationController

  def home
    if current_user && current_user.player?
    @my_id=(current_score/10)+1
  	    @question=questions.find(@my_id)
  	    if params[:answer].present?
  	  	  if params[:answer].casecmp(@question.answer)==0
  	  		  flash[:sucess]="Correct!!"
  	  		  current_user.score+=10
              if current_score==100
                 current_user.role=0
              end
  	  		  current_user.save!
              if current_score!=100
  	 	           @my_id=(current_score/10)+1
  	  		       @question=Question.find(@my_id)
  	  	      else
  	  	         redirect_to static_victory_path
  	  	      end
   	  	  end
	      end
    elsif current_user && current_user.victor?
        redirect_to static_victory_path
    end
	end


  def scoreboard
  	@users=User.order(updated_at: :desc)
  	@users=@users.sort_by(&:score).reverse
  end

  def error
  end

  def victory
  	if current_score!=100
  		redirect_to static_error_path
  	end
  end

end
