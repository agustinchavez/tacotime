function initGiftFormDropdown() {
  $(".gift-form-dropdown").on('click', function(e) {

    var classStr = $(this).attr('class');
    var itemId = idFinder(classStr, "menu-item-id-");
    var restaurantId = idFinder(classStr, "restaurant-id-");
    var formContainer = $(this).siblings('.gift-form');

    $("#new_taco").remove();
    $.ajax('/restaurants/' + restaurantId + '/gifts/new').done(function(data) {
      var modData = data.replace("$menu_item_id", itemId);
      formContainer.html(modData);
      initDropdowns();
    }).fail(function(){console.log("failure to retrieve data");});
  });
  function idFinder(classStr, finderStr) {
    var index = classStr.indexOf(finderStr) + finderStr.length;
    rvar id = "";
    var i;
    for( i = 0; 1 == 1 ; i++ ){
      var nextChar = classStr.slice(index+i,(index+1+i));
      if (( nextChar === " " )||(nextChar === "")){
        return id;
      } else {
        id = id + nextChar;
      };
    };
  };
};