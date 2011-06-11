class Email < ActiveRecord::Base
	validates_presence_of :subject,:mail_body
end
