class WorkshopsController < ApplicationController
  # GET /workshops
  # GET /workshops.xml
  def index
    @title = "Available Workshops"
    @workshops = Workshop.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @workshops }
    end
  end

  # GET /workshops/1
  # GET /workshops/1.xml
  def show
    @workshop = Workshop.find(params[:id])
    @title = @workshop.name
    @employee = current_employee
    #redirect_to @post
    #call the method in Workshop and gets a list of interest and appoint that match than delete the matching ones
    available_times = @workshop.available_times
    available_times.each do |interest, appointments|
      appointments.each do |appointment|
        @workshop.appointments.delete(appointment)
      end
    end
    #save the model so the that database is updated
    @workshop.save
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @workshop }
    end
  end

  # GET /workshops/new
  # GET /workshops/new.xml
  def new
    @workshop = Workshop.new
    @title = "Creating a New Workshop"
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @workshop }
    end
  end

  # GET /workshops/1/edit
  def edit
    @workshop = Workshop.find(params[:id])
    @title = "Editing #{@workshop.name}"
  end

  # POST /workshops
  # POST /workshops.xml
  def create
    @workshop = Workshop.new(params[:workshop])

    respond_to do |format|
      if @workshop.save
        format.html { redirect_to(@workshop, :notice => 'Workshop was successfully created.') }
        format.xml  { render :xml => @workshop, :status => :created, :location => @workshop }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @workshop.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /workshops/1
  # PUT /workshops/1.xml
  def update
    @workshop = Workshop.find(params[:id])

    respond_to do |format|
      if @workshop.update_attributes(params[:workshop])
        format.html { redirect_to(@workshop, :notice => 'Workshop was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @workshop.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /workshops/1
  # DELETE /workshops/1.xml
  def destroy
    @workshop = Workshop.find(params[:id])
    @workshop.destroy

    respond_to do |format|
      format.html { redirect_to(workshops_url) }
      format.xml  { head :ok }
    end
  end
end
