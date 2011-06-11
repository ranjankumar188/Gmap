class ChurchesController < ApplicationController
  include GeoKit::Geocoders
  before_filter :check_authentication,:is_admin 
  
 def index
   if @is_admin
      @churches = Church.paginate :page => params[:page],:conditions=>["deleted = ?",false]
   else
      @churches = Church.paginate :page => params[:page],:conditions=>["created_by = ? and deleted =?",session[:user],false]
   end
 end

 def auto_complete_for_church_denomination_id
    @criteria =  params[:church][:denomination_id] + '%'
    @denomination = Denomination.find(:all, 
                     :conditions=>["LOWER(name) like ?", @criteria],
                     :limit=>8)
    render :partial=> "denomination_list" 
 end


  def show
    @church = Church.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @church }
    end
  end


  def new
    @church = Church.new
    render :action=>'new', :layout=>false
  end


  def edit
    @church = Church.find(params[:id])
  end

  def create
    @church = Church.new(params[:church])
    denomination_name=params[:church][:denomination_id]
    @denomination=Denomination.find_by_name(denomination_name)
    if @denomination==nil
      @denomination=Denomination.new
      @denomination.name=denomination_name
      @denomination.save
      
    end
    @church.denomination_id=@denomination.id
    loc=calculate_location(@church.zip)
    @church.lat=loc.lat
    @church.lng=loc.lng
    
    @church.created_by=session[:user]
      if @church.save
       redirect_to :action =>'index'
      else
       render :action => "new" 
      end
  end


  def update
    @church = Church.find(params[:id])
    loc=calculate_location(@church.zip)
    @church.lat=loc.lat
    @church.lng=loc.lng
    @church.updated_by=session[:user]
    respond_to do |format|
      if @church.update_attributes(params[:church])
        flash[:notice] = 'Church was successfully updated.'
        format.html { redirect_to(@church) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @church.errors, :status => :unprocessable_entity }
      end
    end
  end

  def search
 
  end
  def search_result
     conditions = []
     values = []
     
     if params[:church][:created_by]!=""
      @user=User.find_by_name(params[:church][:created_by])  
        if @user!=nil
          params[:church][:created_by]=@user.id
        else
          params[:church][:created_by]=""
        end
     end
      for attr in [:name,:created_by,:city,:zip]
       value =params[:church][attr]
       if value !=""
         conditions << "#{attr} = ?"
         values << value
       end
      end
      condition=conditions.join(" and ")
      @church=Church.find(:all,:conditions=>values.unshift(condition))
      render :partial=>'search_result'   
  end
   
  def destroy
    @church = Church.find(params[:id])
    @church.deleted=true
    @church.save
    respond_to do |format|
      format.html { redirect_to(churches_url) }
      format.xml  { head :ok }
    end
  end

  private
  def calculate_location(zip)
     GeoKit::Geocoders::Geocoder.google_geocoder(zip)
  end
end
