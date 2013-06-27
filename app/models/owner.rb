class Owner < ActiveRecord::Base
  attr_accessible :firstName, :lastName
  has_many :emails, :dependent => :destroy

  
end
