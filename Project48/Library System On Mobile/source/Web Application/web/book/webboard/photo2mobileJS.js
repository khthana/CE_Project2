function popup_photo2mobile(partner_id,fullurl) {
	var pmWin = window.open('http://www.monozone.com/p2mcolor.php?pid=' + partner_id +'&img='+escape(fullurl),'p2m','status=0,menuBar=0,statusbar=0,resizable=0,scrollBars=0,HEIGHT=450,WIDTH=550,top=50,left=50');
}
function write_link(inside,partner_id,fullurl) {
	var str = "<a href=\"javascript:popup_photo2mobile('"+partner_id+"','"+fullurl+"')\">" + inside + "</a>";
	document.write(str);
}
function test_pho2mobile_link(inside,partner_id,fullurl) {
	var str = "<a href=\"javascript:popup_photo2mobile('"+partner_id+"','"+fullurl+"')\">" + inside + "</a>";
	document.write(str);
}

