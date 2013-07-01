require "csv"

=begin
	MailingList:
		Contains a list of emails
	
	Database Variables:
		name:
			The name of the email
		description:
			A short description of the mailing list
		emails:
			All the emails associated with the Mailing List

	Relations
		emails(has and belongs to many):
			A mailing list has many emails
	TODO:

=end

class MailingList < ActiveRecord::Base
	before_save :default_values
  attr_accessible :name, :description, :email_ids, :active
  has_and_belongs_to_many :emails
  

#Method: import
#		Imports a CVS or Excel to the mailing list 

	
  def import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)

    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      email = self.emails.find_by_id(row["id"]) || Email.new
      email.attributes = row.to_hash.slice(*(Email.accessible_attributes))
      email.save!
      unless emails.include?(email)
        emails << email
      end
    end
  end


	#Method: to_cvs
		#Exports the mailing list to a cvs format that can be edited and imported

  def to_csv(options = {})
	  CSV.generate(options) do |csv|
	    csv << emails.column_names
	    emails.each do |email|
	      csv << email.attributes.values_at(*emails.column_names)
	   	end
	  end
  end


	#Method: open_spreadsheet


  def open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Roo::Csv.new(file.path, nil, :ignore)
    when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end


  def default_values
   	active = false
  end

  def remove_emails(emailids)
    emailids.each do |e|
          emails.delete(Email.find(e))
    end  
  end

  def add_emails(emailids)
    emailids.each do |eid|
      email =  Email.find(eid)
      unless emails.include?(email)
        emails << email
      end
    end
  end

end
