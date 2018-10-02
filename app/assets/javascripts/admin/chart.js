$(document).ready(
new Morris.Line({
  element: "orders_chart",
  data: JSON.parse($("#orders_chart").attr("data-orders")),
  xkey: "created_at",
  ykeys: ["total"],
  labels: ["Total"],
  lineColors: ["#E65A26"],
  postUnits: " VND"
}));
