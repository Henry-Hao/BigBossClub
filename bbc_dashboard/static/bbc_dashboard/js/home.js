$(document).ready(function(){
	// var csrftoken = Cookies.get('csrftoken');

	function csrfSafeMethod(method) {
		// these HTTP methods do not require CSRF protection
		return (/^(GET|HEAD|OPTIONS|TRACE)$/.test(method));
	}
	$.ajaxSetup({
		beforeSend: function(xhr, settings) {
			var csrftoken = Cookies.get('csrftoken');
			if (!csrfSafeMethod(settings.type) && !this.crossDomain) {
				xhr.setRequestHeader("X-CSRFToken", csrftoken);
			}
		}
	});
	// $.ajaxSettings = $.extend($.ajaxSettings, {
	// 	beforeSend: function(xhr, settings) {
	// 		if (!csrfSafeMethod(settings.type) && !this.crossDomain) {
	// 			xhr.setRequestHeader("X-CSRFToken", csrftoken);
	// 		}
	// 	}
	// })
});

function navClick(id){
	$(".myframe").css("height","630px");
	switch(id){
		case "student":
			$(".myframe").attr("src","student");
			break;
		case "parent":
			$(".myframe").attr("src","parent");
			break;
		case "class":
			$(".myframe").attr("src","class");
			break;
		case "rank":
			$(".myframe").attr("src","rank");
			break;
		case "fees":
			$(".myframe").attr("src","fees");
			break;
		case "attendance":
			$(".myframe").attr("src","attendance");
			break;
		case "instructor":
			$(".myframe").attr("src","instructor");
			break;
		default:
			break;
	}
}