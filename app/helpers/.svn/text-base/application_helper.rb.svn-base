# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

HASHEs = {
"miles" =>[
    ["5 Miles","5"],
    ["10 Miles","10"], 
    ["20 Miles","20"],
    ["30 Miles","30"], 
    ["40 Miles","40"],
    ["50 Miles","50"]
        
    ],
  }  
  
  
  def get_denomination_for_filter
    Denomination.find(:all).map {|d| [d.name,d.id]}.unshift(["Denomination Type","0"],["All","0"])
  end
  
   def get_state
    State.find(:all).map {|d| [d.name,d.id]}
  end
  
  def get_hash(lov_name)
    return  HASHEs[lov_name];
  end

  def top_menu_entry(content, is_selected = false)
    class_names = "top_menu "
    class_names << " selected" if is_selected == true
    content_tag(:li, content, :class => class_names)
  end
  
end
