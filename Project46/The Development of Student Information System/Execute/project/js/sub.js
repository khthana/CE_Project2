function preadd(v,val, valplus) {
	blank = "";
	if( valplus.value != blank ) {
		for( i=0; i<val.length; i++) {
			if ( val[i].value == valplus.value ) return 1;
		}
		val.length=val.length+1;
		val[val.length -1].text=valplus.value;
		val[val.length- 1].value=valplus.value;
		v[val.length - 1].value=valplus.value;
		valplus.value = blank;
		valplus.text = blank;
	}
}
function predel(v,val, valdel) {
	blank = "";
	if( valdel.value != blank ) {
		for( i=0; i<val.length; i++) {
			if ( val[i].value == valdel.value ) {
				for( j = i; j<val.length - 1; j++) {
					val[j].value = val[j+1].value;
					val[j].text = val[j+1].value;
					v[j].value = v[j+1].value;
				}
				v[val.length-1].value = blank;
				val[val.length-1].value = blank;
				val[val.length-1].text = blank;				
				valdel.value = blank;
				valdel.text = blank;
				val.length = (val.length - 1);
				return;
			}
		}
	}
}
function secadd(vsec, vsecplus, vstd, vstdplus) {
	blank="";
	if ( (vsecplus.value != blank) && (vstdplus.value != blank) ) {
		//for( i=0; i<vsec.length; i++) {
			//if ( vsec[i].value == vsecplus.value ) return;
		//}
		if (preadd(vsec, vsecplus) != 1) {
			vstd.length=vstd.length+1;
			vstd[vstd.length -1].text=vstdplus.value;
			vstd[vstd.length- 1].value=vstdplus.value;
			vstdplus.value = blank;
			vstdplus.text = blank;
		}
	}
}
function secdel(vsec, vstd, vsecdel) {
	blank="";
	if( vsecdel.value == blank ) {return;}
	for( i=0; i<vsec.length; i++) {
		if ( vsec[i].value == vsecdel.value ) {
			for( j = i; j<vsec.length - 1; j++) {
				vsec[j].value = vsec[j+1].value;
				vsec[j].text = vsec[j+1].value;
				vstd[j].value = vstd[j+1].value;
				vstd[j].text = vstd[j+1].value;
			}
			vsec[vsec.length-1].value = blank;
			vsec[vsec.length-1].text = blank;					
			vstd[vstd.length-1].value = blank;
			vstd[vstd.length-1].text = blank;					
			vsecdel.value = blank;
			vsecdel.text = blank;
			vsec.length = (vsec.length - 1);
			vstd.length = (vstd.length - 1);
			return;
		}
	}
}