class HuntsController < ApplicationController
  layout "hunts"
  
  before_filter :login_required
  
  def add_player
    @hunt = Hunt.find(params[:id])
    
    (params[:user_ids] || []).each do |user_id|
      @hunt.players.create(:user_id => user_id)
    end
    flash[:notice] = "Success!"
    redirect_to :action => "show"
  end
  
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @hunts = @hunt.users(params[:hunts])
    else
      @hunts = Hunt.find(:all)
    end 
      
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @hunts }
    end
  end

  # GET /hunts/1
  # GET /hunts/1.xml
  def show
    @users = User.find(:all)
    @hunt = Hunt.find(params[:id])
    @questions = @hunt.questions(params[:hunt_id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @hunt }
    end
  end

  # GET /hunts/new
  # GET /hunts/new.xml
  def new
    @hunt = Hunt.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @hunt }
    end
  end

  # GET /hunts/1/edit
  def edit
    @hunt = Hunt.find(params[:id])
    @user = User.find(params[:user_id])
    @hunts = @user.hunts
 
    
  end

  # POST /hunts
  # POST /hunts.xml
  def create
    @hunt = Hunt.new(params[:hunt])
    @hunt.created_by = current_user.login

    respond_to do |format|
      if @hunt.save
        flash[:notice] = 'Hunt was successfully created.'
        format.html { redirect_to(@hunt) }
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
        format.html { redirect_to(@hunt) }
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
end


