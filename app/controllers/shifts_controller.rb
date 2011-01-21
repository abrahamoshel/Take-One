class ShiftsController < ApplicationController
  # GET /shifts
  # GET /shifts.xml
  def shift_taken
    @css =  File.read(File.join(Rails.root, 'public', 'stylesheets', 'notifier.css'))
     @shift = Shift.find(params[:id])
    respond_to do |format|
      format.html
      format.html {render :html => @shift}
    end
  end 
  def index
    @shifts = Shift.all(:order => "date ASC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @shifts }
      format.html { render :html => @shifts }
    end
  end

  # GET /shifts/1
  # GET /shifts/1.xml
  def show
    @shift = Shift.find(params[:id])
    @shift.endtime 
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @shift }
    end
  end

  # GET /shifts/new
  # GET /shifts/new.xml
  def new
    @shift = Shift.new
    @shift.date ||= Date.today
    @shift.starttime ||= Time.now
    @shift.endtime ||= Time.now+5.hour

    respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @shift }
    end
  end

  # GET /shifts/1/edit
  def edit
    @shift = Shift.find(params[:id])
  end

  # POST /shifts
  # POST /shifts.xml
  def create
    @shift = Shift.new(params[:shift])

    respond_to do |format|
      if @shift.save
        
        format.html { redirect_to(shifts_path, :notice => 'Shift was successfully created.') }
        format.xml  { render :xml => @shift, :status => :created, :location => @shift }

      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @shift.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /shifts/1
  # PUT /shifts/1.xml
  def update
    @shift = Shift.find(params[:id])

    respond_to do |format|
      if @shift.update_attributes(params[:shift]) && @shift.takeingname != "" && @shift.takingemail != ""
        #Tell the ShiftMailer to send a Email if someone enters name and email for taking shift
        ShiftMailer.shift_taken(@shift).deliver

        format.html { redirect_to(@shift, :notice => 'Shift was successfully Taken!!') }
        format.xml  { head :ok }

      elsif @shift.update_attributes(params[:shift])
        format.html { redirect_to(@shift, :notice => 'Shift was successfully Updated.') }
        format.xml  { head :ok }

      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @shift.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /shifts/1
  # DELETE /shifts/1.xml
  def destroy
    @shift = Shift.find(params[:id])
    @shift.destroy

    respond_to do |format|
      format.html { redirect_to(shifts_url) }
      format.xml  { head :ok }
    end
  end
end
