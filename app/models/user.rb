class User < ActiveRecord::Base

attr_accessor :password

validates_presence_of :username,:question,:answer,:name, :email

validates_uniqueness_of :username, :message => "User Name Already Taken" 
validates_uniqueness_of :email, :message =>"Email Already Exists"
validates_format_of :email,:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,:message => " is not in valid format", :if => Proc.new { |a| !a.email.blank? }

#symbolize :status
#validates_inclusion_of :status, :in => [:registered, :active, :expired]

validates_confirmation_of :password

def password
  return @plain_password
end

def password=(pass)
  @plain_password = pass
 salt = [Array.new(6){rand(256).chr}.join].pack("m").chomp
 self.password_salt = salt
 self.password_hash = Digest::SHA256.hexdigest(pass + salt)
end

def self.authenticate(username, password)
 user = User.find(:first, :conditions => ['username = ?' , username])
 if user.blank? || Digest::SHA256.hexdigest(password + user.password_salt) != user.password_hash
  raise "UserID/Email or Password invalid"
 end
 user
end

def self.verify_password(password,password_salt,password_hash)
 return false if Digest::SHA256.hexdigest(password + password_salt) != password_hash
 return true
end


  def self.confirmation_code(user)
      return user.id.to_s + "-" + User.encrypt(user.username + "sadf@34543aweaffrtyrty45635254rtg^#%$#")
  end
 #--------Private Actions---------------------------
 private
 
    def self.encrypt(plain)
      return  Digest::SHA256.hexdigest(plain)
    end
end
