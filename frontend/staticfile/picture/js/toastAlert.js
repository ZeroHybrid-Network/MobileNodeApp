
function toastAlert(msg){
	if (typeof jQuery == 'undefined'){
		console.log("Error: jQuery is not loaded!\n");
	  return;
  }
	divObj = $('div#_divToastBox');
	if(typeof divObj !== "object" || divObj.length <=0){
		$('body').append('<div class="toast" id="_divToastBox"></div>');
		divObj = $('div#_divToastBox');
	}
  if(divObj.hasClass("toast")){
		posLeft = document.documentElement.scrollLeft + (document.documentElement.clientWidth - divObj.outerWidth())/2 + "px"
		divObj.css("left", posLeft);
		divObj.html('<font class="toastText">' + msg + '</font>');
		divObj.fadeIn();
		divObj.delay(2000).fadeOut();
	}else{
	  console.log("Error: lack of css style.\n");
	}
}
