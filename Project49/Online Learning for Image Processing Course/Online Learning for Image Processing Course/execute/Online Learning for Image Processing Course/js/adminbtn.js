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
        Rollover("profile",  "../Image/Button/admin/aprofile2.jpg");
        Rollover("news",  "../Image/Button/admin/anews2.jpg");
        Rollover("calendar",  "../Image/Button/admin/acalendar2.jpg");
        Rollover("thesis",  "../Image/Button/admin/athesis2.jpg");
        Rollover("user",  "../Image/Button/admin/auser2.jpg");
        Rollover("subject",  "../Image/Button/admin/asubject2.jpg");
        Rollover("section",  "../Image/Button/admin/asec2.jpg");
		Rollover("assess",  "../Image/Button/admin/aassess2.jpg");
        Rollover("board",  "../Image/Button/admin/aboard2.jpg");
        Rollover("out",  "../Image/Button/admin/aout2.jpg");
