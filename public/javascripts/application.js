// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

window.onload = init;

function init() {
  var rb = new RoundBorders();
  if (Object.isFunction(searches_init)) {
    searches_init(rb);
  }
  rb.render('ul#top_menu li','generic',0);
}

var RoundBorders = Class.create ({
  initialize: function () {
     var name = "Round Borders using Ruzee";
  },

  render: function (css_selector, name, border_size) {
    var borders;

    if (name == "tabs")
      borders = RUZEE.ShadedBorder.create({ corner: 4, edges:"tlr", border:border_size });
    else if (name == "generic")
      borders = RUZEE.ShadedBorder.create({ corner: 4 , border: border_size});

    $$(css_selector).each(function (element) {
      if (name == "tabs")
        borders.render(element);
      else if (name == "generic")
        borders.render(element);
    });
  }
});
	
	// Added For Character Remaning For Text Area
	var current_count = 0;
	var max_count = 255;
	
	//Toggeling Events
	function event_hide()
	{
	var start_at = $('start_at');
	var start_time=$('start_time')
	start_at.style.display = $F("event_recurring") ? "block" : "none";
	start_time.style.display = $F("event_recurring") ? "none" : "block";
	}
	
	//Toggeling Services
	function service_hide()
	{
	var start_at = $('start_at');
	var start_time=$('start_time')
	start_at.style.display = $F("service_recurring") ? "block" : "none";
	start_time.style.display = $F("service_recurring") ? "none" : "block";
	}
	
	//Counting Number Of Character
	function textCounter(field, target){
		if (field.value.length > max_count) {
			field.value = field.value.substring(0, max_count);
		}
		else {
			current_count = max_count - field.value.length;
			target.value = current_count;
		}
	}
	
	function show_service_link_on_info_window(id)
	{
    	 new Ajax.Updater('services', '/searches/new', 
		 {asynchronous:true, evalScripts:true, 
		 parameters:"id="+id + "&authenticity_token=" + 
		 encodeURIComponent('f9eecc2abc1776ae1467fd906aa11d73f71812ee')}); 
	}
	
	function show_event_link_on_info_window(id)
   {  
    $('show_service').hide();
	$('show_event').show();
   	 new Ajax.Updater('show_event', '/searches/new', 
		 {asynchronous:true, evalScripts:true, 
		 parameters:"id="+id + "&authenticity_token=" + 
		 encodeURIComponent('f9eecc2abc1776ae1467fd906aa11d73f71812ee')}); 
   }
