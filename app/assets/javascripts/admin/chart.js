$(document).ready(
new Morris.Line({
  element: "orders_chart",
  data: JSON.parse($("#orders_chart").attr("data-orders")),
  xkey: "date",
  ykeys: ["total"],
  labels: ["Total"],
  lineColors: ["#E65A26"],
  postUnits: " VND"
}));

