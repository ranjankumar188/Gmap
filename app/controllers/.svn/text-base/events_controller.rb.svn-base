class EventsController < ApplicationController

  before_filter :load_church,:check_authentication 
  
  def index
    @div_id= params[:church_id]
    @events = @church.events.find(:all,:conditions=>["start_date >=? or recurring=?",Date.today,false])
  end


  def show
    @event = @church.events.find(params[:id])
  end

 
  def new
    @div_id= params[:church_id]
    @event = @church.events.build
  end

 
  def edit
       @event = @church.events.find(params[:id])
  end

  
  def create
    
     @event = @church.events.build(params[:event])
     @event.created_by=session[:user]
      if params[:event][:recurring]=="1"
        if params[:start_date]!= "" and  params[:end_date]!= ""
          @event.start_date=params[:start_date].to_date
          @event.start_at=params[:start_date].to_time
          @event.end_date=params[:end_date].to_date
          @event.end_at=params[:end_date].to_time
          @event.save
          redirect_to :controller =>"churches", :action =>"index"
        else
              flash[:notice]= "Please Select proper time"
              render :action => "new",:layout=>true
        end  
     else
          @event.save
          redirect_to :controller =>"churches", :action =>"index"
    end
  end







 
  def update
    @event = @church.events.find(params[:id])

        if @event.update_attributes(params[:event])
        flash[:notice] = 'Event was successfully updated.'
        redirect_to(church_events_path(@church))
        else
        render :action => "edit"
        end
  
  end

 
  def destroy
    @event = @church.events.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to(church_events_url) }
      format.xml  { head :ok }
    end
  end
  
  def load_church
    @church=Church.find(params[:church_id])
  end
end
