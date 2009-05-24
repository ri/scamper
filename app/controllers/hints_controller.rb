class HintsController < ApplicationController
  layout "hunts"
  
  def index
    @question = Question.find(params[:question_id])
    @hunt = @question.hunt
    @hint = @question.hints    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @questions }
    end
  end
  
  def printview
    
  end
  
  def new
    @hint = Hint.new
    @question = Question.find(params[:question_id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @hints }
    end
  end

  
  def show
    @hint = Hint.find(params[:id])
    @question = Question.find(params[:question_id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @hint }
    end
  end
  
  def create
    @hint = Question.find(params[:question_id]).hints.new(params[:hint])
    @question = Question.find(params[:question_id])
    
    
    respond_to do |format|
      if @hint.save
        flash[:notice] = 'Hint was successfully created.'
        format.html { redirect_to(hunt_question_hints_path(@question.hunt, @question)) }
        format.xml  { render :xml => @hint, :status => :created, :location => @hint }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @hint.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @hint = Hint.find(params[:id])
    @hint.destroy

    respond_to do |format|
      format.html { redirect_to(hunt_question_hints_url) }
      format.xml  { head :ok }
    end
  end
end
  