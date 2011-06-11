class ChurchFindersController < ApplicationController


require 'ym4r'
include Ym4r::GoogleMaps
before_filter :check_authentication 

def index
   
  @map = GMap.new("map_div")
  @map.control_init(:large_map => true,:map_type => true)
  @map.center_zoom_init([35.809159,-78.645188],2)
  render :action=>'index'
end

def new
  @church=Church.find(params[:id])
    render :partial=>'service'
end


def create
   @map = GMap.new("map_div")
   @map.control_init(:large_map => true,:map_type => true)
    if params[:search]!=""
    @loc = GeoKit::Geocoders::Geocoder.google_geocoder(params[:search])
    @map.center_zoom_init([@loc.lat,@loc.lng],10)
    @churches=Church.location(@loc.lat,@loc.lng,params[:map][:miles].to_i)
    @churches.each do |x|
    distance=Church.calculate_distance(x.lat,x.lng,@loc.lat,@loc.lng)  
    info_window="#{x.name}  #{distance}Miles <br>#{x.street} <br>#{x.state} <br>#{x.city}"
    @map.overlay_init(GMarker.new([x.lat,x.lng],:title => x.name,:info_window =>info_window))
     end
    render :action=>'index'     
   else
    flash[:notice]="No Result found"
    redirect_to :action=>'index'
    end
   
     
 
end


end
