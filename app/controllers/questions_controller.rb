class QuestionsController < ApplicationController
  layout "hunts"
  # GET /questions
  # GET /questions.xml
  def index
    @hunt = Hunt.find(params[:hunt_id])
    @question = @hunt.questions.find(:all, params[:hunt_id])
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @questions }
    end
  end

  def edit
    @question = Question.find(params[:id])
    @hunt = Hunt.find(:all)
  end
  
  # GET /questions/1
  # GET /questions/1.xml
  def show
    @question = Question.find(params[:id])
    @hunt = Hunt.find(params[:hunt_id])
    @questions = hunt.questions

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @question }
    end
  end

  # GET /questions/new
  # GET /questions/new.xml
    def new
    @question = Question.new
    @hunt = Hunt.find(params[:hunt_id])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @question }
    end
  end

  # GET /questions/1/edit
  def edit
    @question = Question.find(params[:id])
    @hunt = Hunt.find(params[:hunt_id])
  end

  # POST /questions
  # POST /questions.xml
  def create
    #@question = Question.new(params[:question])
    @question = Hunt.find(params[:hunt_id]).questions.new(params[:question])
    @hunt = Hunt.find(params[:hunt_id])
    
    
    respond_to do |format|
      if @question.save
        flash[:notice] = 'Question was successfully created.'
        format.html { redirect_to(hunt_questions_path(@hunt)) }
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
    @question = Question.find(params[:id])
    @hunt = Hunt.find(params[:hunt_id])

    respond_to do |format|
      if @question.update_attributes(params[:question])
        flash[:notice] = 'Question was successfully updated.'
        format.html { redirect_to(hunt_questions_path(@hunt)) }
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
    @question = Question.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.html { redirect_to(hunt_questions_url) }
      format.xml  { head :ok }
    end
  end
end
