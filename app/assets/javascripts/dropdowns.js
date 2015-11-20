function initDropdowns() {
  $("#gift_receiver").chosen({
    placeholder_text_single: "Search for a friend",
    no_results_text: "There's no registered friend named"
  });

  $("#gift_menu_item").chosen({
    placeholder_text_single: "Choose menu item",
    disable_search_threshold: 5
  });

   $("#gift_charitable").on("click", function(){
    if (this.checked) {
      $("#gift_receiver").prop("disabled", true).trigger("chosen:updated");
      $("#gift_phone").prop("disabled", true);
    } else {
      $("#gift_receiver").prop("disabled", false).trigger("chosen:updated");
      $("#gift_phone").prop("disabled", false);
    }
  })
};