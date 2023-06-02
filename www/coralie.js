  // var img = "LOGO-ATBNEED";
  // document.body.style.backgroundColor = "blue";
  var img = document.getElementById("logo");
    var angle = 0;
    setInterval(function () {
		   var img = document.getElementById("logo2");
       img.style.transform = "rotateZ(" + angle++ + "deg)";
       }, 30);