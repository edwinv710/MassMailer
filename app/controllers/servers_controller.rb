=begin
  ServersController:

  Views:
    index:
      Contains a listing of every server in the database
      Output:
        :address, :name, :port, :user_name, :authentication, :max_emails
    show:
      Detailed description on the email
      Output:
        address, count, table of mailing lists
      [Future:]
        Will contain information such as name and other statistics on that email
    edit:
      Edit email information
    new:
      Add a new email to the database
      Inputs:
        address
=end
class ServersController < ApplicationController
	def new
    @server = Server.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create
    @server = Server.new(params[:server])
    @server.password = @server.server_password
    @server.init
    respond_to do |format|
      if @server.save
        format.html { redirect_to @server, notice: 'Server was successfully created.' }
        format.json { render json: @server, status: :created, location: @server }
      else
        format.html { render action: "new" }
        format.json { render json: @server.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @servers = Server.filter(:params => params)
   

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @servers }
    end
  end


  def show
    @server = Server.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @server }
    end
  end

  def update
    @server = Server.find(params[:id])

    respond_to do |format|
      if @server.update_attributes(params[:server])
        format.html { redirect_to @server, notice: 'Server was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @server.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /owners/1
  # DELETE /owners/1.json
  def destroy
    @server = Server.find(params[:id])
    @server.destroy

    respond_to do |format|
      format.html { redirect_to servers_url }
      format.json { head :no_content }
    end
  end


  # GET /owners/1/edit
  def edit
    @server = Server.find(params[:id])
  end
end
