class SearchesController < ApplicationController
require 'ym4r'
include Ym4r::GoogleMaps
 before_filter :is_admin 
def index
     @map=gmap_setup(41.023849,-80.682053)
       if params[:page]!=nil
       show_map() 
      end
end

def new
  @church=Church.find(params[:id])
  @services = @church.services.find(:all,:conditions=>["start_date >=? or recurring=?",Date.today,false])
  @events = @church.events.find(:all,:conditions=>["start_date >=? or recurring=? ",Date.today,false])
  render :partial=>'service'
end

def create
    if params[:search]!=""
       session[:location]= params[:search] 
       session[:mile]= params[:map][:miles] 
       show_map()
       render :action=>'index'     
    else
       flash[:notice]="No Result found"
       redirect_to :action=>'index'
    end
end

def edit
   render :partial=>'filter_result'
end

def update
  puts "'m in"
   @loc = GeoKit::Geocoders::Geocoder.google_geocoder(session[:location])
   @map=gmap_setup(@loc.lat,@loc.lng)
   start_at = Time.mktime(params[:start_at]['(1i)'],params[:start_at]['(2i)'],params[:start_at]['(3i)'],params[:start_at]['(4i)'],params[:start_at]['(5i)']).strftime("%H:%M:%S")  
   query = ["distance < ?", session[:mile]]
   # Filter on Denomination
   if params[:filter][:denomination_id].to_i > 1
     query[0] += " and denomination_id = ?"
     query << params[:filter]['denomination_id']
   end
   
   # Filter on Services/Events
   case params[:filter][:event_service].to_i
     when 1
       # Filter by date
       if params[:filter][:filter_date].to_i == 1
         if params[:filter][:event_service_date].to_i == 1
           query[0] += " and (services.start_date < ? or services.recurring = false) or (events.start_date < ? or events.recurring = false)"
         elsif params[:filter][:event_service_date].to_i == 2
           query[0] += " and (services.start_date = ? or services.recurring = false) or (events.start_date = ? or events.recurring = false)"
         elsif params[:filter][:event_service_date].to_i == 3
           query[0] += " and (services.start_date > ? or services.recurring = false) or (events.start_date > ? or events.recurring = false)"
         end
         query << params[:start_date].to_date
         query << params[:start_date].to_date
       end
       # Filter by time
       if params[:filter][:filter_time].to_i == 1
         if params[:filter][:event_service_time].to_i == 1
           query[0] += " and services.start_at < ? or events.start_at < ?"
         elsif params[:filter][:event_service_time].to_i == 2
           query[0] += " and services.start_at = ? or events.start_at = ?"
         elsif params[:filter][:event_service_time].to_i == 3
           query[0] += " and services.start_at > ? or events.start_at > ?"
         end
         query << start_at
         query << start_at
        
       end
     when 2
       # Filter by date
       if params[:filter][:filter_date].to_i == 1
         if params[:filter][:event_service_date].to_i == 1
           query[0] += " and (services.start_date < ? or services.recurring = false)"
         elsif params[:filter][:event_service_date].to_i == 2
           query[0] += " and (services.start_date = ? or services.recurring = false)"
         elsif params[:filter][:event_service_date].to_i == 3
           query[0] += " and (services.start_date > ? or services.recurring = false)"
         end
         query << params[:start_date].to_date
         query << params[:start_date].to_date
       end
       # Filter by time
       if params[:filter][:filter_time].to_i == 1
         if params[:filter][:event_service_time].to_i == 1
           query[0] += " and services.start_at < ?"
         elsif params[:filter][:event_service_time].to_i == 2
           query[0] += " and services.start_at = ?"
         elsif params[:filter][:event_service_time].to_i == 3
           query[0] += " and services.start_at > ?"
         end
         query << start_at
       end     
     when 3
       # Filter by date
       if params[:filter][:filter_date].to_i == 1
         if params[:filter][:event_service_date].to_i == 1
           query[0] += " and (events.start_date < ? or events.recurring = false)"
         elsif params[:filter][:event_service_date].to_i == 2
           query[0] += " and (events.start_date = ? or events.recurring = false)"
         elsif params[:filter][:event_service_date].to_i == 3
           query[0] += " and (events.start_date > ? or events.recurring = false)"
         end
         query << params[:start_date].to_date
       end
       # Filter by time
       if params[:filter][:filter_time].to_i == 1
         if params[:filter][:event_service_time].to_i == 1
           query[0] += " and events.start_at < ?"
         elsif params[:filter][:event_service_time].to_i == 2
           query[0] += " and events.start_at = ?"
         elsif params[:filter][:event_service_time].to_i == 3
           query[0] += " and events.start_at > ?"
         end
         query << start_at
       end       
   end
    @churches = Church.paginate(:all, :include => [:services, :events], :origin=>[@loc.lat,@loc.lng], :conditions=>query ,:units => :miles, :limit=>'6', :order=>'distance',:page=>params[:page])   
    count=1
    @churches.each do |x|
     display_marker(@map,x,count)
     count+=1
     end
   render :action=>'index'   
end

def show

  @map = GMap.new("map_div")
  @church=Church.find(params[:id])
  color_name=@church.denomination.color.name
  add_new_icon(@map,color_name,params[:count])
  icon = :"#{color_name}_#{params[:count]}"
  @info_window=show_info_message(@church.lat,@church.lng,@church)
  @marker =
    GMarker.new([@church.lat,@church.lng],
    :title => "Update",
    :icon =>icon,
    :info_window =>@info_window
    ) 
  
end

def list
   start_at = "#{params[:start_at]['(4i)']}:#{params[:start_at]['(5i)']}"
#puts raise params.inspect
puts params[:check_date]
puts params[:check_time]
         

if params[:check_time] == "1" and params[:check_date] == "1"
  render :text=>"List #{params[:filter_denomination_id]}
                      #{params[:filter_event_service]}
                      #{params[:filter_event_service_date]}
                      #{params[:start_date]}
                      #{params[:filter_event_service_time]}
                      #{start_at}"
elsif params[:check_date] == "1"
 render :text=>"List #{params[:filter_denomination_id]}
                     #{params[:filter_event_service]}
                     #{params[:filter_event_service_date]}
                     #{params[:start_date]}"
elsif params[:check_time] == "1"
 render :text=>"List  #{params[:filter_denomination_id]}
                     #{params[:filter_event_service]}
                     #{params[:filter_event_service_time]}
                     #{start_at}"
else
  render :text=>"List  #{params[:filter_denomination_id]}
                       #{params[:filter_event_service]}"
end
end

end
