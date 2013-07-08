


class ServerListsController < ApplicationController
	def show
   	 @server_list = ServerList.find(params[:id])
     @servers = @server_list.servers.filter(:params => params)
     @server_all = Server.filter(:params => params)
   	 respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @server_list }
    	end
	end

    def new
    	@server_list = ServerList.new

    	respond_to do |format|
      		format.html # new.html.erb
    	end
  	end

  	def index
    	@server_lists = ServerList.filter(:params => params)

    	respond_to do |format|
      		format.html # index.html.erb
     		format.json { render json: @server_list }
    	end
  	end

  	def create
  		@server_list = ServerList.new(params[:server_list])
  		
	   	 respond_to do |format|
	      if @server_list.save
	        format.html { redirect_to @server_list, notice: 'Server List was successfully created.' }
	        format.json { render json: @server_list, status: :created, location: @server_list }
	      else
	        format.html { render action: "new" }
	        format.json { render json: @server_list.errors, status: :unprocessable_entity }
	      end
	  end
  	end	

  	def update
    @server_list = ServerList.find(params[:id])

    respond_to do |format|
      if @server_list.update_attributes(params[:server_list])
        format.html { redirect_to @server_list, notice: 'Owner was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @server_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /owners/1
  # DELETE /owners/1.json
  def destroy
    @server_list = ServerList.find(params[:id])
    @server_list.destroy

    respond_to do |format|
      format.html { redirect_to server_lists_url }
      format.json { head :no_content }
    end
  end

  def edit
    @server_list = ServerList.find(params[:id])
  end

  def remove_many
      server_list = ServerList.find(params[:server_list_id])
      server_list.remove_servers(params[:server_ids])
      redirect_to server_list, notice: "Servers Removed"
  end

  def add_servers
    server_list = ServerList.find(params[:server_list_id])
    server_list.add_servers(params[:server_ids])
    redirect_to server_list, notice: "Servers Added"
  end



end