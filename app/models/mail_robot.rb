class MailRobot < ActionMailer::Base
	
  	
	 def new_password(user, password)
    recipients user.email
    from  "churchfinder.com"
    subject "New Password " 
    @body["name"]=user.name
    @body["username"] = user.username
    @body["new_password"] = password
  end
  
  
      def confirmation_email(user,confirmation_code,password)
      setup_email(user)
      @subject    += 'Your account has been activated!'
      body :confirmation_code => "http://localhost:3002/sessions/update/"+confirmation_code,:first_name => user.name
    end

protected

    def setup_email(user) 
      @recipients  = "#{user.email}"
      @from        = "churchfinder.com"
      @subject     ="Mail from church finder"
      @sent_on     = Time.now
    end

  
  
end
  
  

