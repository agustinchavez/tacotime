function initProfileToggle() {
  setupProfile();

  $(".profile-filter-tag").on('click', function(e) {
    e.preventDefault();
    var tag = $(this).html();

    if( tag == "given") {
      $(".given-tacos-container").show();
      $(".received-tacos-container").hide();
    } else if( tag == "received" ){
      $(".given-tacos-container").hide();
      $(".received-tacos-container").show();
    };
  });
};


function setupProfile() {
  $(".given-tacos-container").hide();
  $(".received-tacos-container").show();
};