function initRestaurantFilter() {
  $(".restaurants-container").on('click','.tag-container', function(e) {
    e.preventDefault();
    var url = $(this).attr('href');
    var tag = $(this).html();
    $.ajax({url: url, method: "POST", data: {tag: tag}}).done(function(data) {
      $(".restaurants-container").html(data);
    }).fail(function(){console.log("failure to send data");});
  });

  $(".tags-topbar").on('click','.tag-container', function(e) {
    e.preventDefault();
    var url = $(this).attr('href');
    var tag = $(this).html();
    if(tag == "All") {
      $.ajax(url).done(function(data) {
        $(".restaurants-container").html(data)
      }).fail(function(){console.log("failure to retrieve data");});
    } else {
      $.ajax({url: url, method: "POST", data: {tag: tag}}).done(function(data) {
        $(".restaurants-container").html(data);
      }).fail(function(){console.log("failure to send data");});
    };
  });
};

