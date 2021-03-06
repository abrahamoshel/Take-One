class RequestsController < ApplicationController
  # GET /requests
  # GET /requests.xml
  def index
    @title = "Request List"
    @requests = Request.all
    #@request = @requests.find(params[:request_id])
    #@hours = @request.hours
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @requests }
    end
  end

  # GET /requests/1
  # GET /requests/1.xml
  def show
     @title = "Your Rquest Off"
    @request = Request.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @request }
    end
  end

  # GET /requests/new
  # GET /requests/new.xml
  def new
    @title = "New Rquest Off"
    @request = Request.new
    0.times { @request.hours.build }
    @request.firstName = current_employee.firstName
    @request.lastName = current_employee.lastName
    @request.email = current_employee.email


    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @request }
    end
  end

  # GET /requests/1/edit
  def edit
    @request = Request.find(params[:id])
  end

  # POST /requests
  # POST /requests.xml
  def create
    @request = Request.new(params[:request])

    respond_to do |format|
      if @request.save && @request.email != "" && @request.firstName != ""
        #Tell the RequestMailer to send a Email if someone enters name and email for Requsting off
        RequestMailer.request_off(@request).deliver

        format.html { redirect_to(@request, :notice => 'Request was successfully created.') }
        format.xml  { render :xml => @request, :status => :created, :location => @request }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /requests/1
  # PUT /requests/1.xml
  def update
    @request = Request.find(params[:id])

    respond_to do |format|
      if @request.update_attributes(params[:request])
        format.html { redirect_to(@request, :notice => 'Request was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.xml
  def destroy
    @request = Request.find(params[:id])
    @request.destroy

    respond_to do |format|
      format.html { redirect_to(requests_url) }
      format.xml  { head :ok }
    end
  end
end
