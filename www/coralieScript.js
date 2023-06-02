  // var img = "LOGO-ATBNEED";
  document.body.style.backgroundColor = "blue";
  var img = document.getElementbyId("logo");
    var angle = 0;
    setInterval(function () {
       img.style.transform = "rotateZ(" + angle++ + "deg)";
       }, 30);