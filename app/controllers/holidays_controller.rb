class HolidaysController < ApplicationController
  helper_method :sort_column, :sort_direction
  # GET /holidays
  # GET /holidays.xml
  def index
    #@holidays = Holiday.all
    respond_to do |format|
      format.html {render :html => @holidays } # index.html.erb
      format.xml  { render :xml => @holidays }
    end
  end
  def manager
    @holidays = Holiday.joins(:manager).all
    @holidays = Holiday.order(sort_column + ' ' + sort_direction)
  end

  # GET /holidays/1
  # GET /holidays/1.xml
  def show
    @title = "Your Holiday Request"
    @holiday = Holiday.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @holiday }
    end
  end

  # GET /holidays/new
  # GET /holidays/new.xml
  def new
    @title = "New Holiday Request"
    @holiday = Holiday.new
    @holiday.firstName = current_employee.firstName
    @holiday.lastName = current_employee.lastName
    @holiday.email = current_employee.email

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @holiday }
    end
  end

  # GET /holidays/1/edit
  def edit
    @title = "Editing Holiday Request"
    @holiday = Holiday.find(params[:id])
  end

  # POST /holidays
  # POST /holidays.xml
  def create
    @holiday = Holiday.new(params[:holiday])


    respond_to do |format|
      if @holiday.save
        HolidayMailer.holiday_request(@holiday).deliver
        format.html { redirect_to(employee_root_path, :notice => 'Holiday was successfully created.') }
        format.xml  { render :xml => @holiday, :status => :created, :location => @holiday }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @holiday.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /holidays/1
  # PUT /holidays/1.xml
  def update
    @holiday = Holiday.find(params[:id])

    respond_to do |format|
      if @holiday.update_attributes(params[:holiday])
        format.html { redirect_to(@holiday, :notice => 'Holiday was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @holiday.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /holidays/1
  # DELETE /holidays/1.xml
  def destroy
    @holiday = Holiday.find(params[:id])
    @holiday.destroy

    respond_to do |format|
      format.html { redirect_to(holidays_url) }
      format.xml  { head :ok }
    end
  end
private
  def sort_column  
    Holiday.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
  end  

  def sort_direction  
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end

end
