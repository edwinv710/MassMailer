=begin
  Email:
    Contains information about an email address

  Database Variables:
    emailAddress:
      The string containing the email address that is to be sent.
    mailing_lists:
      All the email mailing list that the email is associated with. 
  TODO:
    Delete user_id
=end

class Email < ActiveRecord::Base
  before_save :default_values
  has_and_belongs_to_many :mailing_lists
  attr_accessible :emailAddress, :mailing_list_ids, :count

  def default_values
    count = 0
  end
end
