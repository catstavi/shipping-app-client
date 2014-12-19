$(function() {
  $(".checkout").click(function(e) {
    e.preventDefault();
    $(this).fadeOut();
    $(".new-address").slideDown();
  });

  $(".ship_radio_button").click(function() {
    var product_cost = parseFloat($(this).attr('id'));
    var ship_cost = parseFloat($(".total").attr('id'));
    var cost = product_cost + ship_cost;
    $(".total").html("$" + moveDecimal(cost));
  });
});

function moveDecimal(n) {
  n_str = n.toString();
  index = n_str.length-2;
  return (n_str.substring(0,index) + "." + n_str.substring(index,n.length));
}
