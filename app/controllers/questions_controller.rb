class QuestionsController < ApplicationController

  layout :choose_layout
  
  # This is needed so that google can access the KML file
  # without a username and password
  before_filter :login_required_except_kml
  before_filter :login_required,            :except => :index
  before_filter :get_questions
  
  # GET /questions
  # GET /questions.xml
  def index
    respond_to do |format|
      format.html
      format.xml  { render :xml => @questions }
      format.kml
    end
  end

  def edit
    @question = @questions.find(params[:id])
    @hunt = Hunt.find(:all)
  end

  def printview

  end
  
  # GET /questions/1
  # GET /questions/1.xml
  def show
    @question = @questions.find(params[:id])
    @hunt = @question.hunt
    @current_player = @hunt.players.find_by_user_id(current_user.id)
    @questions = @hunt.questions
    @player_response = Response.find_by_question_id_and_player_id(@question.id, @current_player.id)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @question }
      format.kml
    end
  end

  # GET /questions/new
  # GET /questions/new.xml
    def new
    @question = @questions.new
      @hunt = Hunt.find(params[:hunt_id])
    4.times {@question.answers.build}
    @question.hints.build
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @question }
    end
  end

  # GET /questions/1/edit
  def edit
    @question = @questions.find(params[:id])
    @hunt = Hunt.find(params[:hunt_id])
    @hint = @question.hints
  end

  # POST /questions
  # POST /questions.xml
  def create
    @hunt = Hunt.find(params[:hunt_id])
    @question = @hunt.questions.new(params[:question])
    
    @question.correct_answer = @question.answers[params[:correct_answer].to_i]
    
    respond_to do |format|
      if @question.save
        flash[:notice] = 'Question was successfully created.'
        format.html { redirect_to(new_hunt_question_path(@hunt)) }
        format.xml  { render :xml => @question, :status => :created, :location => @question }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @question.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /questions/1
  # PUT /questions/1.xml
  def update
    @question = @questions.find(params[:id])
    @hunt = Hunt.find(params[:hunt_id])
    @question.correct_answer = @question.answers[params[:correct_answer].to_i]

    respond_to do |format|
      if @question.update_attributes(params[:question])
        flash[:notice] = 'Question was successfully updated.'
        format.html { redirect_to(edit_hunt_question_path(@hunt, @question)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @question.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.xml
  def destroy
    @question = @questions.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.html { redirect_to(hunt_questions_url) }
      format.xml  { head :ok }
    end
  end 
  
  protected
  
    # If request is for a KML file then, don't require the request to be authenticated
    def login_required_except_kml
      login_required unless params['format'].to_s == 'kml'
    end
    
    def get_questions
      @hunt = Hunt.find(params[:hunt_id])
      @questions = @hunt.questions
    end
    
    def choose_layout
      if current_user
        
        if current_user.creator?
          'huntsedit'
        else
          'application'
        end
      end
    end
      
end
