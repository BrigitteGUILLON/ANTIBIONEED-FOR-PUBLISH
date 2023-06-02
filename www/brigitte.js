document.body.style.backgroundColor = "blue";
  var img = document.getElementById("logo");
    var angle = 0;
    setInterval(function () {
       img.style.transform = "rotateZ(" + angle++ + "deg)";
       }, 30);