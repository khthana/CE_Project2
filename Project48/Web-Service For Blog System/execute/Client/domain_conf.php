<?php
	session_start();
	include "service_register.php";

###############################Function Get_Menu_Header###############################
function Get_Domain_Header() {
	print "
		<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN'
		'http://www.w3.org/TR/html4/loose.dtd'>
		<html>
		<head>
		<meta http-equiv='Content-Type' content='text/html; charset=windows-874'>
		<title>Blog Regis</title>
		<link href=\"domain_css.css\" rel=\"stylesheet\" type=\"text/css\">
		<script language=\"JavaScript\" type=\"text/JavaScript\">
		<!--
		function MM_preloadImages() { //v3.0
		  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
			var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
			if (a[i].indexOf('#')!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
		}

		function MM_findObj(n, d) { //v4.01
		  var p,i,x;  if(!d) d=document; if((p=n.indexOf('?'))>0&&parent.frames.length) {
			d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
		  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
		  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
		  if(!x && d.getElementById) x=d.getElementById(n); return x;
		}

		function MM_swapImage() { //v3.0
		  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
		   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
		}

		function MM_swapImgRestore() { //v3.0
		  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
		}

		function displayWindow(url, width, height) {
				var Win = window.open(url,'displayWindow','width=' + width + ',height=' + height + ',resizable=0,scrollbars=no,menubar=no,status=no' );
		}

		function checkSubmit(form) {
			User= document.login.tusername.value;
			Pass= document.login.tpassword.value;
			if ((!User)&&(!Pass)) { 
				alert('กรุณาใส่ Username และ Password ให้ถูกต้อง');
				return false;
			} else {
				return true;
			}
		}
		//-->
	";
}

###############################Function Get_Menu_Header_End###############################
function Get_Domain_Header_End() {
print "</script>
		</head>";
}

###############################Function Get_Menu###############################
function Get_Menu() {
	print "<div class='menu'> ";
	include('login_form.php');
	print "<br>";
	include('search_form.php');
	print "<br>";
	include('random_blog.php');
	print "<br>";
	print "</div>";
}

#########################Function CONVERT_TIME#########################
function convert_time($time) {
	$month_name = array("","มกราคม","กุมภาพันธ์","มีนาคม","เมษายน","พฤษภาคม","มิถุนายน","กรกฎาคม","สิงหาคม","กันยายน","ตุลาคม","พฤศจิกายน","ธันวาคม");
	list($date,$time) = explode(" ",$time);
	list($year,$month,$day) = explode("-",$date);
	list($hour,$min,$sec) = explode(":",$time);
	$month = (int)$month;
	return $day." ".$month_name[$month]." ".$year." เวลา ".$hour.":".$min.":".$sec;
}


?>