function nochar() {
	if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;
}