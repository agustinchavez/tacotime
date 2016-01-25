function initGiftSearch() {
  var restaurant_id = $("#restaurant_id").val();
  var url = "/restaurants/"+restaurant_id;

  $("#search-form").keyup(function(){
    var search_string = $("#search").val();
    $.ajax({
      url: url,
      type: "GET",
      data: {search: search_string}
      }).done(function(response){
        $("#search-results").html(response);
      }).fail(function(){console.log("search request failed")})
  });
}