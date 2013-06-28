class EmailSubmissionsController < ApplicationController
  # GET /email_submissions
  # GET /email_submissions.json
  def index
    @email_submissions = EmailSubmission.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @email_submissions }
    end
  end

  # GET /email_submissions/1
  # GET /email_submissions/1.json
  def show
    @email_submission = EmailSubmission.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @email_submission }
    end
  end

  # GET /email_submissions/new
  # GET /email_submissions/new.json
  def new
    @emails = Email.all
    @messages = EmailMessage.all
    @email_submission = EmailSubmission.new(params[:email_submission])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @email_submission }
    end
  end

  # GET /email_submissions/1/edit
  def edit
    @email_submission = EmailSubmission.find(params[:id])
  end

  # POST /email_submissions
  # POST /email_submissions.json
  def create
    @email_submission = EmailSubmission.new(params[:email_submission])
    email = @email_submission.email_id
    message = @email_submission.email_message_id
    server = @email_submission.server_id
    

    respond_to do |format|
      if @email_submission.save
        @email_submission.deliver(server, email, message)
        format.html { redirect_to @email_submissions, notice: 'Email submission was successfully sent.' }
        format.json { render json: @email_submissions, status: :created, location: @email_submission }
      else
        format.html { render action: "new" }
        format.json { render json: @email_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /email_submissions/1
  # PUT /email_submissions/1.json
  def update
    @emails = Email.all
    @messages = EmailMessage.all
    @email_submission = EmailSubmission.find(params[:id])

    respond_to do |format|
      if @email_submission.update_attributes(params[:email_submission])
        format.html { redirect_to @email_submission, notice: 'Email submission was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @email_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /email_submissions/1
  # DELETE /email_submissions/1.json
  def destroy
    @email_submission = EmailSubmission.find(params[:id])
    @email_submission.destroy

    respond_to do |format|
      format.html { redirect_to email_submissions_url }
      format.json { head :no_content }
    end
  end
end
