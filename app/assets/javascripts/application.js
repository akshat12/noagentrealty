// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require jquery-1.9.1
//= require jquery-ui-1.10.2.custom
//= require jquery.sausage
//= require masonry/jquery.masonry
//= require tinymce-jquery
//= require_tree .

$(function() {
  $("#item_available_from").datepicker({
    "dateFormat": "yy-mm-dd",
    "appendText": "yyyy-mm-dd"
  });
  $("#item_available_until").datepicker({
    "dateFormat": "yy-mm-dd",
    "appendText": "yyyy-mm-dd"
  });
  $("#event_event_date").datepicker({
    "dateFormat": "yy-mm-dd",
    "appendText": "yyyy-mm-dd"
  });
  $("#wish_list_available_from").datepicker({
    "dateFormat": "yy-mm-dd",
    "appendText": "yyyy-mm-dd"
  });
  $("#wish_list_available_until").datepicker({
    "dateFormat": "yy-mm-dd",
    "appendText": "yyyy-mm-dd"
  });
  $("#from").datepicker({
    "dateFormat": "yy-mm-dd",
    "appendText": "yyyy-mm-dd"
  }); 
});