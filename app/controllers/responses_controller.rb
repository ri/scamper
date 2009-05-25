class ResponsesController < ApplicationController
  before_filter :get_current_question
  before_filter :verify_question_is_unanswered
  
  def show
    @hunt = Hunt.find(params[:hunt_id])
    @response = current_player.responses.build
    @current_player = @hunt.players.find_by_user_id(current_user.id)
    
  end
  
  def create
    @hunt = @question.hunt
    @response = current_player.responses.build
    @response.player = current_player
    @response.answer_id = params[:response][:answer_id]
    
    if @response.save
      flash[:notice] = 'Your answer has been saved'
      redirect_to hunt_question_path(@question.hunt, @question)
    else
      flash.now[:error] = "Please select an answer"
      render :action => :show
    end
  end
  
  protected
  
    def get_current_question
      @question ||= Question.find(params[:question_id])
    end

    def current_player    
      @current_player ||= begin
        hunt_id = get_current_question.hunt_id
        Player.find_by_user_id_and_hunt_id(current_user.id, hunt_id)
      end
    end
    
    def verify_question_is_unanswered
      if get_current_question.answered?(current_user)
        flash[:error] = "You have already answered this question."
        redirect_to [@question.hunt, @question]
      end
    end

        
end
