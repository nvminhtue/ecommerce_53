$(document).on("turbolinks:load", function(){
  rating_run();
});

function rating_run(){
  var users = document.getElementsByClassName("user_rating");
  var length = users.length;

  if(length > 0)
  {
    var save_img = [];
    for (var i = 0;i<length;i++) {
      save_img[i] = users[i].src;
    }

    for (var i = 0;i<length;i++){
      users[i].onmouseover = function(){
        onoff(users,index(users,this));
      };

      users[i].onclick = function(){
        users = document.getElementsByClassName("user_rating");
        for (var i = 0;i<length;i++) {
          save_img[i] = users[i].src;
        }
      }
    }

    document.getElementById("user_rating").onmouseleave = function(){
      reset(users);
    };

    function index(users,user) {
      for(var i = 0;i<length;i++){
        if(users[i] == user)
        {
          return i;
        }
      }
    }

    function onoff(users,on){
      for(var i = 0;i<length;i++){
        if(i<=on)users[i].src = "/images/rating/star-on.png";
        else users[i].src = "/images/rating/star-off.png";
      }
    }

    function reset(users){
      for(var i = 0;i<length;i++){
        users[i].src = save_img[i];
      }
    }

    console.log("rating runing");
  }
}
