class Attachment < ActiveRecord::Base
  attr_accessible :data, :filename, :path
end
