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
        Rollover("profile",  "../Image/Button/teacher/tprofile2.jpg");
		Rollover("gradelevel",  "../Image/Button/teacher/tgrade2.jpg");
        Rollover("news",  "../Image/Button/teacher/tnews2.jpg");
        Rollover("file",  "../Image/Button/teacher/tfile2.jpg");
        Rollover("subject",  "../Image/Button/teacher/tsubject2.jpg");
        Rollover("lesson",  "../Image/Button/teacher/tlesson2.jpg");
        Rollover("assessment",  "../Image/Button/teacher/tassessment2.jpg");
        Rollover("testing",  "../Image/Button/teacher/ttesting2.jpg");
		Rollover("live",  "../Image/Button/teacher/tlive2.jpg");
        Rollover("track",  "../Image/Button/teacher/ttrack2.jpg");
		Rollover("assessresult",  "../Image/Button/teacher/tassessresult2.jpg");
        Rollover("out",  "../Image/Button/teacher/tout2.jpg");
		Rollover("studentresult",  "../Image/Button/teacher/tsudentresult2.jpg");
		Rollover("checkass",  "../Image/Button/teacher/tcheckass2.jpg");
        