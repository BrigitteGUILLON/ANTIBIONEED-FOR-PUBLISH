  // var img = "LOGO-ATBNEED";
  // document.body.style.backgroundColor = "blue";
 
	 
    setInterval(function () {
		   var img = document.getElementById("logo2");
      var angle = (Math.random() * 30);
       img.style.transform = "rotateZ(" + angle + "deg)";
       }, 60);
     