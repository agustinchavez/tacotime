$(document).ready(function() {

  initRegistrationPopups();

  if ($('#map').length) {
    initMap()
  }

  if ($('.tags-topbar').length) {
    initRestaurantFilter();
  }

  if ($('#dropin').length) {
    initPayments();
  }

  if ($('#restaurant_profile').length) {
    initGiftSearch();
  }

  if ($('.gift-form').length) {
    initGiftFormDropdown();
  }

});