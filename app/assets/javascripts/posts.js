function scrollToTop(){
	$('body').animate({scrollTop: 0},1000); 
	return false;
}

function scrollToElement(id){
	$('body').animate({scrollTop: $('#' + id).position().top - 50},1000); 
	return false;
}
