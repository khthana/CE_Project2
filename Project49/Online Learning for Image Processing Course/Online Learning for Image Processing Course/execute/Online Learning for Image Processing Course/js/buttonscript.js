//Generate transition CSS (transition=0 to 23)
        document.write('<STYLE TYPE="text/css">.imgTrans{ filter:revealTrans(duration=0.4,transition=12) }</STYLE>');

        //Uncomment the next line for fading rollovers instead of dissolving:
        //document.write('<STYLE TYPE="text/css">.imgTrans{ filter:blendTrans(duration=0.4) }</STYLE>');

        var onImages=new Array();
        function Rollover(imgName, imgSrc)
        {
	        onImages[imgName] = new Image();
	        onImages[imgName].src = imgSrc;
        }

        function turnOn(imgName){ 
	        if(document.images[imgName].filters != null)
		        document.images[imgName].filters[0].apply();
	        document.images[imgName].offSrc = document.images[imgName].src;
	        document.images[imgName].src    = onImages[imgName].src;
	        if(document.images[imgName].filters != null)
		        document.images[imgName].filters[0].play();
        }

        function turnOff(imgName){ 
	        if(document.images[imgName].filters != null)
		        document.images[imgName].filters[0].stop();
	        document.images[imgName].src = document.images[imgName].offSrc;
        }

        //Specify name of participating images, plus paths to their onMouseover replacements:
        Rollover("home",  "Image/Button/home2.jpg");
        Rollover("staff",  "Image/Button/staff2.jpg");
        Rollover("research",  "Image/Button/research2.jpg");
        Rollover("learning",  "Image/Button/learning2.jpg");
        Rollover("webboard",  "Image/Button/webboard2.jpg");
        Rollover("contact",  "Image/Button/contact2.jpg");