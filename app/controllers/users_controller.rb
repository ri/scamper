class UsersController < ApplicationController
    layout "hunts"
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  

  # render new.rhtml
  def new_creator
    @user = User.new
    @user.creator = true
  end
 
 def new_player
   @user = User.new
   @user.creator = false
   
 end
 
  def create
    logout_keeping_session!

    @user = User.new(params[:user])
    @user.creator = (params[:user][:creator] == "true")
  
    success = @user && @user.save
    if success && @user.errors.empty?
      logger.debug @user.creator?.inspect
            # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      self.current_user = @user # !! now logged in
      redirect_back_or_default(user_hunts_path(current_user))
      flash[:notice] = "Thanks for signing up!"
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      @action = @user.creator ? 'new_creator' : 'new_player'
      render :action => @action
    end
  end
  def show 
      @user = User.find(params[:id])
      @hunts = @user.hunts
      respond_to do |format| 
      format.html # show.html.erb 
      format.xml { render :xml => @user } 
    end 
  end
  
  def index 
     if params[:hunt_id]
       @hunt = Hunt.find(params[:hunt_id])
       @users = @hunt.users
     else
       @users = User.find(:all)
     end
     
      respond_to do |format| 
      format.html # index.html.erb 
      format.xml { render :xml => @users } 
          
      end 
  end 
  
  def edit
    @user = User.find(params[:id]) 
  end
  
  def update
    @user = User.find(params[:id]) 
      respond_to do |format|
        if @user.update_attributes(params[:user])
          flash[:notice] = 'Your account was successfully updated.'
          format.html { redirect_to(hunts_path) }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
        end
      end
  end
  
  def destroy 
      @user = User.find(params[:id]) 
      @user.destroy 
      respond_to do |format| 
      format.html { redirect_to(users_url) } 
      format.xml { head :ok } 
      end 
  end
end
