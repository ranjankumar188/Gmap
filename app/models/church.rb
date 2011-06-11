class Church < ActiveRecord::Base
cattr_reader :per_page
@@per_page = 6
acts_as_mappable #:auto_geocode=>true, :except=>'create'
has_many :events
has_many :services #,:foreign_key=>:church_id
belongs_to :denomination
belongs_to :state

validates_presence_of :name,:street,:city,:zip,:denomination_id,:state,:phone,:std_code
validates_format_of :phone,:std_code,:area_code, :with => /^[+\/\-() 0-9]+$/, :message => "Invalid PhoneNumber"


def self.location(lat,lng,range,page)
Church.paginate(:all, :page=>page, :per_page => 6,:origin=>[lat,lng], :conditions=>["distance < ?",range],:units => :miles, :limit=>'6', :order=>'distance')

end

def self.upcoming_service(church)
   service_count=church.services.count(:all,:conditions=>["start_date >=? or recurring=?",Date.today,false])
     if service_count==0
     return "No"
   else
     return service_count
   end
end

def self.upcoming_event(church)
   event_count=church.events.count(:all,:conditions=>["start_date >=? or recurring=?",Date.today,false])
   if event_count==0
     return "No"
   else
     return event_count
   end
end

def self.calculate_distance(start_lat,start_lng,end_lat,end_lng)
  Church.distance_between([start_lat,start_lng],[end_lat,end_lng]).round  
end


end