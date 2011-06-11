module SearchesHelper

HASHEs = {
  "miles" =>[
    ["5 Miles","5"],
    ["10 Miles","10"], 
    ["20 Miles","20"],
    ["30 Miles","30"], 
    ["40 Miles","40"],
    ["50 Miles","50"]
        
    ],

     "Day" =>[
    ["Select",""], 
    ["Sunday","Sun"],
    ["Monday","Mon"], 
    ["Tuesday","Tues"],
    ["Wednesday","Wed"], 
    ["Thrusday","Thu"],
    ["Friday","Fri"],
    ["Saturday","Sat"]
    ],
    
   "event_service" =>[
    ["Service/event","1"],
    ["Service","2"],
    ["Event","3"]
    ],
    
   "before_after" =>[
    ["Before","1"],
    ["On","2"],
    ["After","3"]
    ],  
    
}

  def windowed_pagination_links(pagingEnum, options)
  link_to_current_page = options[:link_to_current_page]
  always_show_anchors = options[:always_show_anchors]
  padding = options[:window_size]
  
  current_page = pagingEnum.page
  html = ''
 
  #Calculate the window start and end pages 
  padding = padding < 0 ? 0 : padding
  first = pagingEnum.page_exists?(current_page  - padding) ? current_page - padding : 1
  last = pagingEnum.page_exists?(current_page + padding) ? current_page + padding : pagingEnum.last_page
 
  # Print start page if anchors are enabled
  html << yield(1) if always_show_anchors and not first == 1
 
  # Print window pages
  first.upto(last) do |page|
    (current_page == page && !link_to_current_page) ? html << page : html << yield(page)
    end

    # Print end page if anchors are enabled
    html << yield(pagingEnum.last_page) if always_show_anchors and not last == pagingEnum.last_page
    html
  end

  def get_hash(lov_name)
    return  HASHEs[lov_name];
  end


end
