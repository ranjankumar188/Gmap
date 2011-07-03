# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  #helper :all # include all helpers, all the time


  protect_from_forgery # :secret => 'f4de705afa7d19b2aecc7f9614471bc5'
 

  def check_authentication
   
    unless session[:user]
      redirect_to :controller => "sessions", :action => "new"
    return
    end
  end 


  def is_admin
    if session[:user]
      user = User.find(session[:user])
      @is_admin =user.admin
    end
   
  end
 
 private
 
  def gmap_setup(lat,lng)
      distance=session[:mile].to_i
      if distance >= 50 then zoom = 9
      elsif distance >= 20 then zoom = 10
      elsif distance >= 10 then zoom = 11
      elsif distance >= 5 then zoom = 12
      else zoom = 2
      end
      map = GMap.new("map_div")
      map.control_init(:large_map => true,:map_type => true)
      map.center_zoom_init([lat,lng],zoom)
      map
  end

 
  def add_new_icon(map,color_name,icon_id) 
    image_path="/images/marker/#{color_name}_#{icon_id}.png"
    map.icon_global_init(GIcon.new(:image => image_path,
                                 :shadow => "/images/marker/shadow.png",
                                 :shadow_size => GSize.new(37,32),
                                 :icon_size => GSize.new(20,34),
                                 :icon_anchor => GPoint.new(10,17), 
                                 :info_window_anchor => GPoint.new(10,0)),
                                 "#{color_name}_#{icon_id}")
  end

  def show_map()
    @loc = GeoKit::Geocoders::Geocoder.google_geocoder(session[:location])
    @map=gmap_setup(@loc.lat,@loc.lng)
    display_starting_marker(@map,@loc)
    @churches=Church.location(@loc.lat,@loc.lng,session[:mile].to_i,params[:page])
    count=1
    @churches.each do |x|
        display_marker(@map,x,count)
        count+=1
    end
  end

  def display_starting_marker(map,loc)
    info_window="Starting location #{session[:location]}"
    map.overlay_init(GMarker.new([loc.lat,loc.lng],:title => session[:location],:info_window =>info_window))
  end

  def display_marker(map,x,count)
    info_window=show_info_message(x.lat,x.lng,x)
    color_name=x.denomination.color.name
    add_new_icon(@map,color_name,count)
    icon = :"#{color_name}_#{count}"
    map.overlay_init(GMarker.new([x.lat,x.lng],:icon=>icon,:title => x.name,:info_window =>info_window))
  end

  def show_info_message(lat,lng,church)
    loc = GeoKit::Geocoders::Geocoder.google_geocoder(session[:location])
    distance=Church.calculate_distance(lat,lng,loc.lat,loc.lng)  
    info_window="#{church.name}  &nbsp;&nbsp;&nbsp;&nbsp;#{distance}Miles <br>"+
                "#{church.street} <br>#{church.state.name} <br>"+
                "#{church.city} <br>"#+
                #"<a href='#' onclick='show_service_link_on_info_window("+"#{church.id}"+");'>[#{Church.upcoming_service(church)}&nbsp;service time]</a>"+
                #"<a href='#' onclick='show_event_link_on_info_window("+"#{church.id}"+");'>[#{Church.upcoming_event(church)}&nbsp;Upcoming Events]</a>"
 #info_window="<a href='#' onclick='show_link_on_info_window()'>See Services</a>"
 
 
    return info_window #="hi"
  end
  
  

end
