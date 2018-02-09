$(document).ready(function(){
	


    $("#register").click(function(){
        $(".login-part").hide();
        $(".register-part").show();
    });

    $("#back").click(function(){
        $(".login-part").show();
        $(".register-part").hide();
    });
    
    // $("#register_submit").click(function(){
    	
    	
    // });

});

function check(){
	var username = $("#register_username").val().trim();
	var password = md5($("#register_password").val().trim());
	var password_2 = md5($("#register_password_confirmed").val().trim());
	if(username == "" || password == "" || password_2 == ""){
		alert("All fileds must be filled");
		$("#register_username").val("");
		$("#register_password").val("");
		$("#register_password_confirmed").val("");
		$("#register_email").val("");
		return false;
	}else if(password != password_2){
		alert("Passwords don't match");
		$("#register_username").val("");
		$("#register_password").val("");
		$("#register_password_confirmed").val("");
		$("#register_email").val("");
		return false;
	} 
	return true;
}