class UsersController < ApplicationController
    layout "hunts"
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  

  # render new.rhtml
  def new
    @user = User.new
  end
 
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
            # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      self.current_user = @user # !! now logged in
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!  We're sending you an email with your activation code."
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new'
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
  
  def destroy 
      @user = User.find(params[:id]) 
      @user.destroy 
      respond_to do |format| 
      format.html { redirect_to(users_url) } 
      format.xml { head :ok } 
      end 
  end
end
