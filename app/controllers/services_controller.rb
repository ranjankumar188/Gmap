class ServicesController < ApplicationController
 
  before_filter :find_church,:check_authentication 

  def index
      @div_id= params[:church_id]
     @services = @church.services.find(:all,:conditions=>["start_date >=? or recurring=?",Date.today,false])
  end

  
  def show
    @service = @church.services.find(params[:id])
  end

 
  def new
      @service = @church.services.build
   end


  def edit
    @service = @church.services.find(params[:id])
  end

 
  def create
      @service = @church.services.build(params[:service])
      @service.created_by=session[:user]
      if params[:service][:recurring]=="1"
        if params[:start_date]!= "" and  params[:end_date]!= ""
          @service.start_date=params[:start_date].to_date
          @service.start_at=params[:start_date].to_time
          @service.end_date=params[:end_date].to_date
          @service.end_at=params[:end_date].to_time
          @service.save
          redirect_to :controller =>"churches", :action =>"index"
        else
              flash[:notice]= "Please Select proper time"
              render :action => "new",:layout=>true
        end  
     else
          @service.save
          redirect_to :controller =>"churches", :action =>"index"
    end
  end

 
  def update
    @service = @church.services.find(params[:id])

      if @service.update_attributes(params[:service])
        flash[:notice] = 'Service was successfully updated.'
        redirect_to(church_services_path(@church))
      else
        render :action => "edit"
      end
   
  end

 
  def destroy
    @service = @church.services.find(params[:id])
    @service.destroy
    redirect_to(church_services_path(@church))
  end
  
  private
  
  def find_church
      @church = Church.find(params[:church_id])
  end
end
