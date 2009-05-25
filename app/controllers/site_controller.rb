class SiteController < ApplicationController
  def index
    if current_user
      redirect_to(user_hunts_path(current_user))
    end
  end

  def project
    render :layout => 'project'
  end
  
  def team
    render :layout => 'team'
  end
  
  def about
    render :layout => 'about'
  end
end
