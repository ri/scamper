class SiteController < ApplicationController
  def index
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
