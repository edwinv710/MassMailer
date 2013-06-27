class Email < ActiveRecord::Base
  has_and_belongs_to_many :mailing_lists
  attr_accessible :emailAddress, :mailing_list_ids

  def self.import(file , list)
  	CSV.foreach(file.path, headers: true) do |row|
    email = Email.new(row.to_hash)
    email.mailing_lists << MailingList.find(list)
    email.save!
  	end
  end

  def self.destroyAllFromList(list_id)
  	MailingList.find(list_id).emails.each(&:destroy)
  end

  def self.destroyManyFromList(list_id, array)
  	Email.find_all_by_id(array).each(&:destroy)
  end

end
