$(document).ready(function() {

  initRegistrationPopups();

  if ($('#map').length) {
    initMap()
  }

  if ($('#user_profile').length) {
    initProfileToggle()
  }

  if ($('#cafe_index').length) {
    initRestaurantFilter();
  }

  if ($('#new_coffee').length) {
    initDropdowns();
  }

  if ($('#dropin').length) {
    initPayments();
  }

});