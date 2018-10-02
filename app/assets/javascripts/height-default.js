$(document).on("turbolinks:load", function(){
  height_run();
});

function height_run(){
  element = document.getElementsByClassName("height-default-js")[0];
  if(element != null){
    min = window.innerHeight - document.body.scrollHeight;
    min += element.offsetHeight;
    if(min < window.innerHeight && min > 0){
      element.style.minHeight = min + "px";
      console.log("min-height");
    }
  }
}
