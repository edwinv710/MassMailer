require 'csv'
class Email < ActiveRecord::Base
  has_and_belongs_to_many :mailing_lists
  attr_accessible :emailAddress, :mailing_list_ids

  def self.import(file , list)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)

    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      email = MailingList.find(list).emails.find_by_id(row["id"]) || new
      email.attributes = row.to_hash.slice(*accessible_attributes)
      unless email.mailing_lists.include?(list)
        email.mailing_lists << MailingList.find(list)
      end
      email.save!
    end
  end


  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Roo::Csv.new(file.path, nil, :ignore)
    when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

  def self.destroyAllFromList(list_id)
  	MailingList.find(list_id).emails.each(&:destroy)
  end

  def self.destroyManyFromList(list_id, array)
  	Email.find_all_by_id(array).each(&:destroy)
  end

end
