class SessionsController < ApplicationController
layout 'main'
before_filter :check_authentication ,:only => [:destroy]
def new
    @title = "Church Finder - Login"
   
  end
  
  def create
      begin
        user = User.authenticate(params[:username], params[:password])
          if user.status=="active"
            user.last_login = Time.now
            user.login_count = user.login_count.to_i + 1
            user.save!
            session[:user] = user.id
            flash[:notice] = "Welcome Back #{user.username}..."
            redirect_to :controller=>'churches',:action=>'index'
          else
            flash[:notice] = "Your account is not activated check your mail for activation"
            redirect_to :controller=>'searches',:action=>'index'
          end
      rescue
        flash[:notice] = "Invalid Password"
        render :action=>'new'
      end
  end
  
  def update
     user_id=Array.new
     user_id=params[:id].split("-")
     @user=User.find(user_id[0])
    if(@user.email_activation == params[:id])
     @user.status="active"
     @user.save
     flash[:notice]="'#{@user.name}' your account is  successfully activated"
    else
     flash[:notice]="Invalid Confirmation Code"
    end
     render :action=>'new'
  end
  
  def destroy
    session[:user] = nil
    reset_session
    flash[:notice] = "You are successfully logged out."
    redirect_to :controller=>'sessions',:action => 'new'
  end


end
