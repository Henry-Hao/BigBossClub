$(document).ready(function(){
	var csrftoken = Cookies.get('csrftoken');

	function csrfSafeMethod(method) {
		// these HTTP methods do not require CSRF protection
		return (/^(GET|HEAD|OPTIONS|TRACE)$/.test(method));
	}
	$.ajaxSetup({
		beforeSend: function(xhr, settings) {
			if (!csrfSafeMethod(settings.type) && !this.crossDomain) {
				xhr.setRequestHeader("X-CSRFToken", csrftoken);
			}
		}
	});
});


function modifyFormatter(value, row, index){
	return [
		'<a class="modify" data-dismiss="modal" data-toggle="modal" data-target="#modifyModal" style="text-decoration:none; text-align:center" href=# title="Modify">',
			'<i class="glyphicon glyphicon-edit"></i>',
		'</a>'
	].join('');
}


function removeFormatter(value, row, index) {
    return [
        '<a class="remove" style="text-decoration:none; text-align:center" href=# title="Remove">',
            '<i class="glyphicon glyphicon-remove"></i>',
        '</a>'
    ].join('');
}