class HuntsController < ApplicationController
  before_filter :login_required
  # GET /hunts
  # GET /hunts.xml
  def index
    @hunts = Hunt.find(:all)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @hunts }
    end
  end

  # GET /hunts/1
  # GET /hunts/1.xml
  def show
    @hunt = Hunt.find(params[:id])
    @question = @hunt.questions(params[:hunt_id])

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
  end

  # POST /hunts
  # POST /hunts.xml
  def create
    @hunt = Hunt.new(params[:hunt])

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
