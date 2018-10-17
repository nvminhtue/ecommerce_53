$(document).on("turbolinks:load", function(){
  left_height_right();
  nice_admin();
});

function hs(_parent) {
  var parent = document.getElementById(_parent);
  if(parent.length <= 0)return;
  var child = document.getElementById(_parent.replace("admin","for"));

  if(parent.childNodes[3].style.transform != "rotate(-90deg)"){
    parent.childNodes[3].style.transform = "rotate(-90deg)";
    parent.style.borderBottom  = "1px solid #11394c";
    parent.style.backgroundColor = "#2979a0";
    child.className = "admin-hs"
  }
  else{
    parent.childNodes[3].style.transform = "rotate(0deg)";
    parent.style.borderBottom  = "1px solid #e7e7e7";
    parent.style.backgroundColor = "#3299cc";
    child.className = "admin-hs hide"
  }
  console.log("hs runing");
}

function admin_menu_select(element){
  element.className += " admin-select";
}

function admin_menu_unselect(element){
  element.className = element.className.replace("admin-select","");
}

function nice_admin(){
  // users
  if(window.location.href.indexOf("/admin/users") != -1){
    hs("admin-menu-1");
    admin_menu_select(document.getElementById("list_user"));
    return;
  }

  if(window.location.href.indexOf("/admin/suggestions") != -1){
    hs("admin-menu-1");
    admin_menu_select(document.getElementById("suggestion"));
    return;
  }

  // products
  if(window.location.href.indexOf("/admin/products") != -1){
    hs("admin-menu-2");
    admin_menu_select(document.getElementById("products_list"));
    return;
  }

  if(window.location.href.indexOf("/admin/categories") != -1){
    hs("admin-menu-2");
    admin_menu_select(document.getElementById("products_cate"));
    return;
  }

  if(window.location.href.indexOf("/admin/orders") != -1){
    hs("admin-menu-2");
    admin_menu_select(document.getElementById("products_order"));
    return;
  }

  // dashboard
  if(window.location.href.indexOf("/admin") != -1){
    admin_menu_select(document.getElementById("dashboard"));
  }
}

function left_height_right(){
  if(window.location.href.indexOf("/admin") != -1){
    document.getElementsByClassName("admin-nav-left")[0].style.minHeight =
      document.getElementsByClassName("admin-row")[0].offsetHeight +"px";
  }
}
