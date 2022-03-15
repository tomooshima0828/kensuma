$(document).on("turbolinks:load", function() {
  $('#order_order_post_code').jpostal({
    postcode : ['#order_order_post_code'],
    address: { "#order_order_address" : "%3%4%5%6%7" }
  });
});
