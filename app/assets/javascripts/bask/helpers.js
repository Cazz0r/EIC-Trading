function ShowLoading() {
  $('div.progress').addClass('on');
}

function HideLoading() {
  $('div.progress').removeClass('on');
}

function blank(object) {
	if(object == null) { return true; }
	if(object == undefined) { return true; }
	if(object == '') { return true; }
	return false;
}

function capitalizeFirstLetter(string) {
  return string.charAt(0).toUpperCase() + string.slice(1);
}