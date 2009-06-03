class ResponsesController < ApplicationController
  before_filter :get_current_question
  before_filter :verify_question_is_unanswered
  before_filter :login_required_except_kml, :only   => :show
  before_filter :login_required,            :except => :show
    layout "hunts"
  
  def show
    @hunt = Hunt.find(params[:hunt_id])
    @response = current_player.responses.build
    @current_player = @hunt.players.find_by_user_id(current_user.id)
    
  end
  
  def create
    @hunt = @question.hunt
    @questions = @hunt.questions
    @response = current_player.responses.build
    @response.player = current_player
    @response.answer_id = params[:response][:answer_id]
    
    if @response.save
      if @questions.not_answered(@current_player).count > 0 
        redirect_to hunt_question_response_path(@hunt, @questions.not_answered(@current_player).rand)
        flash[:notice] = 'Your answer has been saved'
        return
      else
        redirect_to completed_hunt_path(@hunt)
        return
      end
    else
      flash[:error] = "Please select an answer"
      render :action => :show
    end
    end
  
  protected
    def login_required_except_kml
      login_required unless params['format'].to_s == 'kml'
    end
  
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
