var remaining_audio_init_timeout;

function DrawTB(UseAudio, ImagePath, CamNbr, MediaRecording, HideMicSettings) // NOTE: HideMicSettings = "yes" for 207, otherwise it should be "no" (or undefined)
{
  if (document.Player) {
    if (UseAudio == "yes") {
      if (HideMicSettings == "yes") {
        document.Player.ToolbarConfiguration = "+play,+snapshot,+fullscreen,+mute,+volume";
        if (ImagePath.indexOf("mpeg4") != -1 && MediaRecording != 0)  {
          document.Player.ToolbarConfiguration = "+play,+snapshot,+rec,+fullscreen,+mute,+volume";
          document.Player.EnableRecording = MediaRecording;
        }
      }
      else {
        remaining_audio_init_timeout = 5000;
        doAudioCheck(ImagePath, CamNbr, MediaRecording);
      }
    }
    else if (ImagePath.indexOf("mpeg4") != -1 && MediaRecording != 0) {
      document.Player.ToolbarConfiguration = "+play,+snapshot,+rec,+fullscreen";
      document.Player.EnableRecording = MediaRecording;
    }
    else {
      document.Player.ToolbarConfiguration = "+play,+snapshot,+fullscreen";
    }
    if (UseAudio == "yes") {
      document.Player.Play();
    }
  }
}

function doAudioCheck(ImagePath, CamNbr, MediaRecording)
{
  if (!document.AudioComponent) {
    if (remaining_audio_init_timeout > 0) {
      setTimeout('doAudioCheck()', 250);
      remaining_audio_init_timeout -= 250; 
    }
    else if (ImagePath.indexOf("mpeg4") != -1 && MediaRecording != 0) {
      document.Player.ToolbarConfiguration = "+play,+snapshot,+rec,+fullscreen";
      document.Player.EnableRecording = MediaRecording;
    }
    else {
      document.Player.ToolbarConfiguration = "+play,+snapshot,+fullscreen";
    }
  }
  else {
    initAudio(ImagePath, CamNbr, MediaRecording);
  }
}

function initAudio(imagepath, camnbr, mediarecording)
{
  document.Player.AudioConfigURL = "http://161.246.5.88/axis-cgi/audio/getparam.cgi?camera=" + camnbr;
  document.Player.AudioTransmitURL = "http://161.246.5.88/axis-cgi/audio/transmit.cgi?camera=" + camnbr;
  if (imagepath.indexOf("mjpg") != -1) {
    document.Player.AudioReceiveURL = "http://161.246.5.88/axis-cgi/audio/receive.cgi?camera=" + camnbr;
  }
  if (imagepath.indexOf("mpeg4") != -1 && mediarecording != 0) {
    document.Player.ToolbarConfiguration = "+play,+snapshot,+rec,+fullscreen,+audiocontrol";
    document.Player.EnableRecording = mediarecording;
  }
  else {
    document.Player.ToolbarConfiguration = "+play,+snapshot,+fullscreen,+audiocontrol";
  }
}

function InstallFilter(prodName, ID, CLSID_filter, ver_filter, cab, installText1, text, installText2, installText3, installText4)
{
var createdElement = document.createElement('<object ID="'+ ID + '" height="0" width="0" CLASSID="CLSID:' + CLSID_filter + '" CODEBASE="/activex/' + cab + '#Version=' + ver_filter + '"><br><b>' + ID + '</b>&nbsp;' + installText1 + '&nbsp;' + text + '&nbsp;' + installText2 + '&nbsp;' + installText3 + '<br>' +ID + '&nbsp;' + installText4 + '<br></OBJECT>');
filterinstallocation.appendChild(createdElement);
}

function InstallDecoder(prodName, ID, CLSID_AMC, cab, ver_AMC, authorized, notAuthorizedText, authorizedText, installDecoderText1, installDecoderText2)
{
  document.write('<OBJECT ID="'+ ID + '" height="0" width="0" CLASSID="CLSID:' + CLSID_AMC + '" CODEBASE="' + cab + '#version=' + ver_AMC + '" STANDBY="Loading Axis Media Control components..."');
  if (authorized != "yes") {
    document.write('<br><p><b>' + notAuthorizedText + '</b><br>');
  } else {
    document.write('<br><p><a href="javascript:launch(\'')
    if (ID == "AAC Decoder") {
      document.write('http://161.246.5.88/incl/aac_license.shtml\')">' + authorizedText + '</a><br>')
    } else { 
      document.write('http://161.246.5.88/incl/license.shtml\')">' + authorizedText + '</a><br>')  
    }
  }
  document.write('<br>' + installDecoderText1);
  if (authorized == "yes") {
    document.write('<br>' + installDecoderText2);
  }
  document.write('<br></OBJECT>');
}

function drawMpeg4Dec(height, width, imagepath, CLSID_AMC, cab, ver_AMC)
{
  document.write('<OBJECT ID="Decoder" height="' + height + '" width="' + width + '" border="0" CLASSID="CLSID:' + CLSID_AMC + '" CODEBASE="/activex/decoder/' + cab + '#version=' + ver_AMC + '" STANDBY="Loading Axis Media Control components..."><br></OBJECT>');

}

function drawAacDec(height, width, imagepath, CLSID_AAC_dec, cab, ver_AAC_dec)
{
  document.write('<OBJECT ID="aac" height="' + height + '" width="' + width + '" border="0" CLASSID="CLSID:' + CLSID_AAC_dec + '" CODEBASE="/activex/decoder/' + cab + '#version=' + ver_AAC_dec + '" STANDBY="Loading Axis Media Control components..."></OBJECT>');
}

function DrawAMC(prodName, ID, height, width, imagepath, CLSID_AMC, cab, ver_AMC, ShowAMCToolbar, ptzgui, useWithCam, camnbr, UseRel, ShowRelCross, ShowSVG, UseMotion, UseAudio, rtspPort, external, installText1, text, installText2, installText3, installText4, mediaRecording, extra) // NOTE: extra = "yes" -> 207, extra = "9999" means centermode (zoom=9999) is activated in 212PTZ, otherwise extra should be "no" or undefined.
{
  var rtspAddress = "rtsp://" + location.hostname
  
  if (imagepath.indexOf("mpeg4") != -1) {
    var mpeg4 = "yes";
  }
  if (imagepath.indexOf("mjpg") != -1) {
    var mjpg = "yes";
  }
  if (imagepath.indexOf("mpeg2") != -1) {
    var mpeg2 = "yes";
  }
  if (imagepath.indexOf("sdp") != -1) {
    var multicast = "yes";
  }

  document.write('<OBJECT ID="Player" height="' + height + '" width="' + width + '" border="0" CLASSID="CLSID:' + CLSID_AMC + '" CODEBASE="/activex/' + cab + '#version=' + ver_AMC + '" STANDBY="Loading Axis Media Control components...">');
  if(mpeg4 == "yes" && external == "no") {
    document.write('<param name="MediaURL" value="' + rtspAddress + ':' + rtspPort + '' + imagepath + '">');
  } else {
    document.write('<param name="MediaURL" value="' + imagepath + '">');
  }
  if ((mpeg4 == "yes") && (multicast != "yes")) {
    document.write('<param name="MediaType" value="auto-sense">');
  } else if (multicast == "yes") {
    document.write('<param name="MediaType" value="multicast">');
  }
  if (mjpg == "yes") {
    document.write('<param name="MediaType" value="mjpeg-unicast">');
  }
  if (mpeg2 == "yes") {
    document.write('<param name="MediaType" value="mpeg2-unicast">');
  }
  if (extra == "yes") {  // 207
    document.write('<param name="Volume" value="70">');
  }
  document.write('<param name="ShowStatusBar"');
  if (ShowAMCToolbar == "yes") {
    document.write('value="1">');
  } else {
    document.write('value="0">');
  }
  document.write('<param name="ShowToolbar"');
  if (ShowAMCToolbar == "yes") {
    document.write('value="1">');
  } else {
    document.write('value="0">');
  }

  if (UseAudio == "yes") {
    document.write('<param name="AutoStart" value="0">');
  }
  else {
    document.write('<param name="AutoStart" value="1">');
  }

  document.write('<param name="StretchToFit" value="1">');

  if ((ptzgui == "yes") && (useWithCam == "yes")) {
    document.write('<param name="PTZControlURL" value="http://161.246.5.88/axis-cgi/com/ptz.cgi?camera=' + camnbr);
    extra += ""
    if (extra == "9999")
      document.write('&zoom=9999')
    document.write('">');
    document.write('<param name="UIMode"');
    if (UseRel == "no") {
      document.write('value="ptz-absolute">');
    } else if (ShowRelCross == "yes") {
      document.write('value="ptz-relative">');
    } else {
      document.write('value="ptz-relative-no-cross">');
    }
  }

  document.write('<br><b>' + ID + '</b>&nbsp;' + installText1 + '&nbsp;' + text + '&nbsp;' + installText2 + '&nbsp;' + installText3 + '<br>' + ID + '&nbsp;' + installText4);
  document.write('<br><br></OBJECT>');

  if (document.Player.ShowToolbar) { // This line is essential when installing AMC or else volume and mute buttons will show until reload
    if (ShowAMCToolbar == "yes") {
      if (extra == "yes") { // = 207
        document.Player.ToolbarConfiguration = "+play,+snapshot,+fullscreen,+mute,+volume";
      } else if (mpeg4 == "yes" && mediaRecording != 0) {
        document.Player.ToolbarConfiguration = "+play,+snapshot,+rec,+fullscreen";
        document.Player.EnableRecording = mediaRecording;
      }
      else {
        document.Player.ToolbarConfiguration = "+play,+snapshot,+fullscreen";
      }
    }
  }

  if (UseMotion == "yes") {
    document.Player.UIMode = "MDConfig";
    document.Player.MotionConfigURL = "http://161.246.5.88/axis-cgi/operator/param.cgi?ImageSource=" + [camnbr - 1]
    document.Player.MotionDataURL = "http://161.246.5.88/axis-cgi/motion/motiondata.cgi";
  }

  if (ShowSVG == "yes") {
    document.Player.SvgDataURL = "http://161.246.5.88/axis-cgi/iv/stream.cgi?channel=9";
  }

  document.Player.EnableContextMenu = "1";
}

//-->
