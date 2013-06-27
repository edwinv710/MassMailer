class ServerList < ActiveRecord::Base
  attr_accessible :name, :server_ids
  has_and_belongs_to_many :servers


end
