=begin
	ListMail - Sends Mail to a list of people 

	
=end


class ListMailsController < ApplicationController

  def index
    @list_mails = ListMail.filter(:params => params)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @list_mails }  
    end
  end	

  def show
    @list_mail = ListMail.find(params[:id])
    @email_submissions = @list_mail.email_submissions.filter(:params => params)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @list_mail }
    end
  end

  def new
    @list_mail = ListMail.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @list_mail }
    end
  end

  def create
     @list_mail = ListMail.new(params[:list_mail])
     @list_mail.addSubmissions(@list_mail.mailing_list_id, @list_mail.server_list_id, @list_mail.message_id)
     @list_mail.init
    respond_to do |format|
	    if @list_mail.save

	      format.html {redirect_to @list_mail, notice: "List Mail was successfully created"}
	      format.json { render json: @list_mail }
	    else
	        format.html { render action: "new" }
	        format.json { render json: @list_mail.errors, status: :unprocessable_entity }
	    end
    end
  end

    def destroy
    list_mail = ListMail.find(params[:id])
    list_mail.destroy

    respond_to do |format|
      format.html { redirect_to list_mails_url }
      format.json { head :no_content }
    end
  end

  def deliver
    @list_mail = ListMail.find(params[:id])
    @list_mail.deliver

    respond_to do |format|
      format.html { redirect_to list_mails_path, notce: "Emails are being sent" }
      format.json { head :no_content }
    end
  end
	
end
