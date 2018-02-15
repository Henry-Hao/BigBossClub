var start_time;
var end_time;
$(document).ready(function(){
	$table = $("#studentTable").bootstrapTable({
        // data:JSON.parse($("#data").html()),
		striped: true,
		pagination: true,
		height: 600,
		width:800,
		pageSize: 12
    });
	
	$('#add_dob').datetimepicker({
        language:  'en',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		forceParse: 0,
        showMeridian: 1,
		minView:2,
		pickerPosition:'top-left',
		
    });
	
	$('#add_doj').datetimepicker({
        language:  'en',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		forceParse: 0,
        showMeridian: 1,
		minView:2,
        pickerPosition:'top-left'
    });
	
	$("#add_dob")
	.datetimepicker()
	.on('changeDate', function(ev){
		time = $("#add_dob_input").val();
	});
	$('#add_dob').datetimepicker('setEndDate', new Date());
	
	$("#add_doj")
	.datetimepicker()
	.on('changeDate', function(ev){
		time = $("#add_doj_input").val();
	});
	$('#add_doj').datetimepicker('setEndDate', new Date());
	
	
	$("#addStudentConfirm").click(function(){
		var name = $("#add_name").val().trim();
		var email = $("#add_email").val().trim();
		var mobilenumber = $("#add_mobilenumber").val().trim();
		var dob = $("#add_dob_input").val();
		var doj = $("#add_doj_input").val();
		
		if(name == "" || email == "" || mobilenumber == ""){
			alert("All fields should be filled!");
			return;
		}
		
		$("#addStudentForm").submit();
	});

	$("#modifyStudentConfirm").click(function(){
		var name = $("#modify_name").val().trim();
		var email = $("#modify_email").val().trim();
		var mobilenumber = $("#modify_mobilenumber").val().trim();
		var dob = $("#modify_dob_input").val();
		var doj = $("#modify_doj_input").val();
		
		if(name == "" || email == "" || mobilenumber == ""){
			alert("All fields should be filled!");
			return;
		}
		
		$("#modifyStudentForm").submit();
	});
})


function removeTerm(node){
	$(node).parent().remove();
}

function modifyFormatter(value, row, index){
	return [
		'<a class="modify" data-dismiss="modal" data-toggle="modal" data-target="#modifyModal" style="text-decoration:none; text-align:center" href=# title="Modify">',
			'<i class="glyphicon glyphicon-edit"></i>',
		'</a>'
	].join('');
}

window.modifyEvents = {
	'click .modify':function(e,value,row,index){
		$("#modify_std_id").val(row['std_id']);
		$("#modify_name").val(row['std_name']);
		$("#modify_email").val(row['std_email']);
		$("#modify_mobilenumber").val(row['std_mobilenumber']);
		$("#modify_dob input").val(row['std_dob']);
		$("#modify_doj input").val(row['std_dojoin']);

		$('#modify_dob').datetimepicker({
			language:  'en',
			weekStart: 1,
			todayBtn:  1,
			autoclose: 1,
			todayHighlight: 1,
			forceParse: 0,
			showMeridian: 1,
			minView:2,
			pickerPosition:'top-left'
		});
		
		$('#modify_doj').datetimepicker({
			language:  'en',
			weekStart: 1,
			todayBtn:  1,
			autoclose: 1,
			todayHighlight: 1,
			forceParse: 0,
			showMeridian: 1,
			minView:2,
			pickerPosition:'top-left'
		});
		
		$("#modify_dob")
		.datetimepicker()
		.on('changeDate', function(ev){
			time = $("#modify_dob_input").val();
		});
		$('#modify_dob').datetimepicker('setEndDate', new Date());
		
		$("#modify_doj")
		.datetimepicker()
		.on('changeDate', function(ev){
			time = $("#modify_doj_input").val();
		});
		$('#modify_doj').datetimepicker('setEndDate', new Date());
		
	}
}



function removeFormatter(value, row, index) {
    return [
        '<a class="remove" style="text-decoration:none; text-align:center" href=# title="Remove">',
            '<i class="glyphicon glyphicon-remove"></i>',
        '</a>'
    ].join('');
}
window.removeEvents = {
		'click .remove':function (e,value,row,index){
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

			if(confirm("Are you sure to remove it??")){
				$.ajax({
					url:"/deleteStudent",
					data:{
						"std_id":row['std_id'],
					},
					dataType:'json',
					method:'POST',
					success:function(result){
						location.href = "student";
					}
				})
			}
		}
}
