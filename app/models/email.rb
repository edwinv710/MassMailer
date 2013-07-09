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
  has_and_belongs_to_many :mailing_lists
  attr_accessible :emailAddress, :mailing_list_ids, :count, :name, :subscribed, :company, :address, :city, 
  :state, :zip, :first_name, :last_name, :gender, :title, :vist_count
  validates :emailAddress, presence: true

  def default_values
    self.count = 0
  end
end
