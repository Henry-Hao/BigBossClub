

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
		case "stat":
			$(".myframe").attr("src","stat");
			break;
		default:
			break;
	}
}