class EmailMessage < ActiveRecord::Base
   attr_accessible :label, :message, :subject, :html
end
