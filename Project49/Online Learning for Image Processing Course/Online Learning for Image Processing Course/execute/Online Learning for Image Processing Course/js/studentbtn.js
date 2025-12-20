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
        Rollover("profile",  "../Image/Button/student/stprofile2.jpg");
        Rollover("register",  "../Image/Button/student/stregister2.jpg");
        Rollover("schedule",  "../Image/Button/student/stschedule2.jpg");
        Rollover("lesson",  "../Image/Button/student/stlesson2.jpg");
        Rollover("testing",  "../Image/Button/student/sttesting2.jpg");
        Rollover("ppt",  "../Image/Button/student/stppt2.jpg");
        Rollover("vdo",  "../Image/Button/student/stvdo2.jpg");
        Rollover("sim",  "../Image/Button/student/stsim2.jpg");
        Rollover("live",  "../Image/Button/student/stlive2.jpg");
        Rollover("doc",  "../Image/Button/student/stdoc2.jpg");
        Rollover("track",  "../Image/Button/student/sttrack2.jpg");
		Rollover("assess",  "../Image/Button/student/stassessteacher2.jpg");
        Rollover("mb",  "../Image/Button/student/stmb2.jpg");
        Rollover("out",  "../Image/Button/student/stout2.jpg");