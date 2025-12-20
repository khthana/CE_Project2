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
        Rollover("intro",  "../Image/Button/imageprocessing/imgintro2.jpg");
        Rollover("colorbalance",  "../Image/Button/imageprocessing/imgcb2.jpg");
		Rollover("histogram",  "../Image/Button/imageprocessing/imghis2.jpg");
		Rollover("arithmetic",  "../Image/Button/imageprocessing/imgia2.jpg");
        Rollover("linearcon",  "../Image/Button/imageprocessing/imglc2.jpg");
		Rollover("logcon",  "../Image/Button/imageprocessing/imgloc2.jpg");
		Rollover("expocon",  "../Image/Button/imageprocessing/imgexc2.jpg");
        Rollover("powercon",  "../Image/Button/imageprocessing/imgplc2.jpg");
		Rollover("linearbright",  "../Image/Button/imageprocessing/imglb2.jpg");
		Rollover("conbright",  "../Image/Button/imageprocessing/imglcb2.jpg");
		Rollover("meanfilter",  "../Image/Button/imageprocessing/imgmf2.jpg");
        Rollover("orderfilter",  "../Image/Button/imageprocessing/imgosf2.jpg");
		Rollover("adaptfilter",  "../Image/Button/imageprocessing/imgaf2.jpg");
