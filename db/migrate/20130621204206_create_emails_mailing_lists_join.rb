class CreateEmailsMailingListsJoin < ActiveRecord::Migration
  def up
  	create_table 'emails_mailing_lists', :id => false do |t|
  		t.column 'email_id', :integer
  		t.column 'mailing_list_id', :integer
  	end
  end

  def down
  	drop_table 'emails_mailing_lists'
  end
end
