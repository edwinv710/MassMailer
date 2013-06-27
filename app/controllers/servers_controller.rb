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
    @servers = Server.all

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
      if @server.update_attributes(params[:owner])
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
