$add_par_id = null;
$under18 = true;
$modify_par_id = null;
$under18_m = true;
$flag = false;
$list=[];
$(document).ready(function(){
	$table = $("#studentTable").bootstrapTable({
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
		d = ev.date;
		timeofbirth = Date.UTC(1900+d.getYear(),1+d.getMonth(),d.getDate());
		r = Date.now() - timeofbirth;
		if(r >= 567993600000){
			$("#addParentDiv").hide();
			$under18 = false;
			$add_par_id = null;
		} else {
			$("#addParentDiv").show();
			$under18 = true;
		}

	});
	$('#add_dob').datetimepicker('setEndDate', new Date());
	
	$("#add_doj")
	.datetimepicker()
	.on('changeDate', function(ev){
		time = $("#add_doj_input").val();
	});
	$('#add_doj').datetimepicker('setEndDate', new Date());
	
	
	$("#addStudentConfirm").click(function(){
		setTimeout(300);
		var name = $("#add_name").val().trim();
		var email = $("#add_email").val().trim();
		var mobilenumber = $("#add_mobilenumber").val().trim();
		var add = $("#add_add").val().trim();
		var dob = $("#add_dob_input").val();
		var doj = $("#add_doj_input").val();
		
		if(name == "" || email == "" || mobilenumber == "" || add == ""){
			alert("All fields should be filled!");
			return;
		}

		if($under18 && $add_par_id == null){
			alert("Juveniles need one parent!");
			return;
		}
		if($under18)
			$("#addParId").val($add_par_id);
		else
			$("#addParId").val("null");
		
		$("#addStudentForm").submit();
	});

	$("#modifyStudentConfirm").click(function(){
		setTimeout(300);
		var name = $("#modify_name").val().trim();
		var email = $("#modify_email").val().trim();
		var mobilenumber = $("#modify_mobilenumber").val().trim();
		var dob = $("#modify_dob_input").val();
		var doj = $("#modify_doj_input").val();
		var add = $("#modify_add").val();
		
		if(name == "" || email == "" || mobilenumber == "" || add == ""){
			alert("All fields should be filled!");
			return;
		}
		if($under18_m && $modify_par_id == null){
			alert("Juveniles need one parent!");
			return;
		}
		if($under18_m)
			$("#modifyParId").val($modify_par_id);
		else
			$("#mofidyParId").val("null");

		
		$("#modifyStudentForm").submit();
	});


	$("#btn_add").click(function(){
		$table2 = $("#addParentTable").bootstrapTable({
			striped: true,
			pagination: true,
			height: 300,
			width:400,
			pageSize: 12
		}).on('click-row.bs.table',function(event,row,element){
			element.find("input").prop("checked",true);
			$add_par_id = row['par_id'];
		})

	})

})

window.modifyEvents = {
	'click .modify':function(e,value,row,index){
		$("#modify_std_id").val(row['std_id']);
		$("#modify_name").val(row['std_name']);
		$("#modify_email").val(row['std_email']);
		$("#modify_mobilenumber").val(row['std_mobilenumber']);
		$("#modify_add").val(row['std_add']);
		$("#modify_dob input").val(row['std_dob']);
		$("#modify_doj input").val(row['std_dojoin']);
		$("#modify_dob_input").val(row['std_dob']);
		$("#modify_doj_input").val(row['std_dojoin']);


		$("#modifyParentTable").bootstrapTable({
			striped:true,
			pagination:true,
			height:300,
			width:400,
			pageSize:12
		}).on('load-success.bs.table',function(e,data){
			$.each(data,function(index,value){
				$list[value.par_id] = index;
			})
			initParTable(e,row['par_id']);
			$flag = true;
		}).on('click-row.bs.table',function(event,row,element){
			element.find("input").prop("checked",true);
			$modify_par_id = row['par_id'];
		})
		if($flag)
			initParTable(e,row['par_id']);

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
			d = ev.date;
			timeofbirth = Date.UTC(1900+d.getYear(),1+d.getMonth(),d.getDate());
			r = Date.now() - timeofbirth;
			if(r >= 567993600000){
				$("#modifyParentDiv").hide();
				$under18_m = false;
				$modify_par_id = null;
			} else {
				$("#modifyParentDiv").show();
				$under18_m = true;
			}
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

window.removeEvents = {
		'click .remove':function (e,value,row,index){
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

function initParTable(e,id){
	if(id != null){
		$modify_par_id = id;
		$under18_m = true;
		pos = $list[id];
		$("#modifyParentTable tbody tr:eq(" + pos + ") input").prop('checked','true');
		$("#modifyParentDiv").show();
	}else {
		$modify_par_id = null;
		$under18_m = false;
		//uncheck every radiobox
		$.each($("#modifyParentTable tbody tr input"),function(i,e){
			$(e).prop("checked",false)
		 })
		$("#modifyParentDiv").hide();
	}
}

function parentFormatter(value,row,index){
	return ['<a class="parent_name" href="#" style="text-decoration:none" data-toggle="modal" data-target="#modifyParentModal" >',
			row['std_parent'],
			'</a>'].join("");
}

window.parentEvents = {
	'click .parent_name':function(e,value,row,index){
		$.ajax({
			url:"/findParentById",
			data:{
				"par_id":row['par_id'],
			},
			dataType:'json',
			method:'POST',
			success:function(result){
				$("#modify_parent_id").val(result.par_id);
				$("#modify_parent_name").val(result.par_name);
				$("#modify_parent_email").val(result.par_email);
				$("#modify_parent_mobilenumber").val(result.par_mobilenumber);

				$("#modifyParentConfirm").click(function(){
					if($("#modify_parent_name").val().trim() == "" || $("#modify_parent_email").val().trim() == "" || $("#modify_parent_mobilenumber").val().trim() == ""){
						alert("All fields must be filed");
						return;
					}
					
					$("#modifyParentForm").submit();
					location.href = "/student"
				})
			}
		})
		
	}
}
