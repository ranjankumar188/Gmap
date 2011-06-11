class PasswordsController < ApplicationController
before_filter :check_authentication ,:only => [:edit, :update]
  
def new
 @user=User.new 
end

def create
  @user=User.find_by_email(params[:user][:email])

  if @user
    new_password=generate_password()
    @user.password=new_password
    
    @user.save
     flash[:notice] = "Your password has been changed"
     MailRobot::deliver_new_password(@user,new_password)
     redirect_to  :controller=>'sessions',:action => 'new'
  else
    flash[:notice]="Invalid Email"
    render :action=>'new'
   
  end
 

end

def edit
  
end

def update
  
   if params[:confirm_new_password]==params[:new_password]
    @user=User.find(session[:user])
        
    if User.verify_password(params[:current_password],@user.password_salt,@user.password_hash)
       @user.password=(params[:new_password])
       @user.save
       redirect_to :controller=>'searches', :action=>'index'
    else
       flash[:notice]="Wrong current password"
       render :controller=>'passwords', :action=>'edit'
    end
   else
   flash[:notice]="Error"
   render :action=>'edit'
   end
   
end

private
def generate_password()   # generates random text for forgot password
    length = 6
    chars = 'abcdefghjkmnpqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ23456789'
    new_password = ''
    length.downto(1) { |i| new_password << chars[rand(chars.length - 1)] }
    new_password
  end


end
