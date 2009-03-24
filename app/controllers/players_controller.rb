class PlayersController < ApplicationController
  layout "hunt"
  # GET /questions
  # GET /questions.xml
  
  def join
    
    #TODO add player to hunt
    #player = User.find(params[:id])
      redirect_to hunt_player_path()
  end
  
  def index
    @hunt = Hunt.find(params[:hunt_id])
    @player = @hunt.players.find(:all, params[:hunt_id])
    @user = User.find(:all)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @players }
    end
  end
  
  def new
    @player = Player.new
    @hunt = Hunt.find(params[:hunt_id])
    @user = User.find(:all)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @player }
      
    end
  end
  
  def create
    #@question = Question.new(params[:question])
    @player = Hunt.find(params[:hunt_id]).players.new(params[:player])
    @hunt = Hunt.find(params[:hunt_id])
    
    
    respond_to do |format|
      if @player.save
        flash[:notice] = 'Question was successfully created.'
        format.html { redirect_to(hunt_players_path(@hunt)) }
        format.xml  { render :xml => @player, :status => :created, :location => @player }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @player.errors, :status => :unprocessable_entity }
      end
    end
  end
  

end   