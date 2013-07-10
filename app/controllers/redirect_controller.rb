class RedirectController < ApplicationController
  def direct
  	if(EmailSubmission.exists?(params[:id]))
  		sub = EmailSubmission.find(params[:id])
  		em = Email.find(sub.email_id)

  		sub.visit_count = sub.visit_count + 1
  		em.visit_count = em.visit_count + 1
  		sub.save
  		em.save
  		if(ListMail.exists?(sub.list_mail_id))
  			list = ListMail.find(sub.list_mail_id)
  			list.total_visit_count = list.total_visit_count + 1
  			list.save
  		end
  	end

  	respond_to do |format|
      format.html { redirect_to "http://www.badcreditbusinessloans.com" }
      format.json { render json: @email_messages }
    end
  	 
  end



end
