class HuntsController < ApplicationController
  layout "hunts"
  
  before_filter :login_required

  
  def completed
    @hunt = Hunt.find(params[:id])
    @current_player = @hunt.players.find_by_user_id(current_user.id)
    if (!Response.count(:conditions => {:player_id => @hunt.players.find_by_user_id(@current_player.id)}) == @hunt.questions.count)
      redirect_back_or_default(user_hunts_path(current_user))
    end
    
  end
  
  def admin?
    current_user.creator?
  end

  def invite_players
    @player_users = User.find(:all, :conditions => {:creator => false})
    @hunt = Hunt.find(params[:id])   
    @current_players = @hunt.users
    
    render :layout => :choose_layout
  end
  
  def add_players
    @hunt = Hunt.find(params[:id])
    (params[:user_ids] || []).each do |user_id|
      @hunt.players.create(:user_id => user_id)
    end
    flash[:notice] = "Success!"
    redirect_to :action => invite_players_hunt_path(@hunt)
  end

  def play
      @users = User.find(:all)
      @hunt = Hunt.find(params[:id])
      @questions = @hunt.questions(params[:hunt_id]) 

      render :layout => 'play'
  end
  
  def answer
       @users = User.find(:all)
        @hunt = Hunt.find(params[:id])
        @questions = @hunt.questions(params[:hunt_id])
        render :layout => 'play'
  end
    
  
  def index
    @user = current_user
    #@player = Player.find :all, :conditions => { :user_id => current_user.id }
    
    @playerhunts = @user.hunts
    @hunts =  Hunt.find :all, :conditions => { :created_by => current_user.login}
      
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @hunts }
    end
  end

  # GET /hunts/1
  # GET /hunts/1.xml
  def show
    @users = User.find :all, :conditions => { :creator => false}
    @hunt = Hunt.find(params[:id])
    @questions = @hunt.questions(params[:hunt_id])

      render :layout => :choose_layout
  end

  # GET /hunts/new
  # GET /hunts/new.xml
  def new
    @hideprofilebutton = true
    @hunt = Hunt.new
    render :layout => :choose_layout
  end

  # GET /hunts/1/edit
  def edit
    @hunt = Hunt.find(params[:id])   
    render :layout => :choose_layout
  end

  # POST /hunts
  # POST /hunts.xml
  def create
    @hunt = Hunt.new(params[:hunt])
    @hunt.created_by = current_user.login

    respond_to do |format|
      if @hunt.save
        flash[:notice] = 'Hunt was successfully created.'
        format.html { redirect_to(new_hunt_question_path(@hunt)) }
        format.xml  { render :xml => @hunt, :status => :created, :location => @hunt }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @hunt.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /hunts/1
  # PUT /hunts/1.xml
  def update
    @hunt = Hunt.find(params[:id])

    respond_to do |format|
      if @hunt.update_attributes(params[:hunt])
        flash[:notice] = 'Hunt was successfully updated.'
        format.html { redirect_to(edit_hunt_path(@hunt)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @hunt.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /hunts/1
  # DELETE /hunts/1.xml
  def destroy
    @hunt = Hunt.find(params[:id])
    @hunt.destroy

    respond_to do |format|
      format.html { redirect_to(hunts_url) }
      format.xml  { head :ok }
    end
  end
  
  protected
  
    def choose_layout
      if current_user.creator?
        'huntsedit'
      else
        'hunts'
      end
    end
end
