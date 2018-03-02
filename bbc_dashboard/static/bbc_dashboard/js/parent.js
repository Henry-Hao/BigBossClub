$(document).ready(function(){
    $table = $("#parentTable").bootstrapTable({
        striped: true,
		pagination: true,
		height: 600,
		width:800,
		pageSize: 12
    })

    $("#addParentConfirm").click(function(){
        if($("#add_name").val().trim() == "" || $("#add_email").val().trim() == "" || $("#add_mobilenumber").val().trim() == ""){
            alert("All fields must be filed");
            return;
        }

        $("#addParentForm").submit();
    })
})

window.modifyEvents = {
    'click .modify':function(e,value,row,index){
        $("#modify_id").val(row['par_id']);
        $("#modify_name").val(row['par_name']);
        $("#modify_email").val(row['par_email']);
        $("#modify_mobilenumber").val(row['par_mobilenumber']);

        $("#modifyParentConfirm").click(function(){
            if($("#modify_name").val().trim() == "" || $("#modify_email").val().trim() == "" || $("#modify_mobilenumber").val().trim() == ""){
                alert("All fields must be filed");
                return;
            }
            $("#modifyParentForm").submit();
        })
    }
}

window.removeEvents = {
    'click .remove':function(e,value,row,index){
        if(confirm("Comfirm you want to delete this parent\nNote that every student related to this parent will be deleted.")){
            $.ajax({
                url:'deleteParent',
                data:{
                    "removeId":row["par_id"]
                },
                dataType:"json",
                method:"POST",
                success:function(result){
                    location.href = "parent";
                }
            })
        }
    }
}

function detailFormatter(value,row,index){
    return [
		'<a class="detail" data-dismiss="modal" data-toggle="modal" data-target="#detailModal" style="text-decoration:none; text-align:center" href=# title="Detail">',
			'<i class="glyphicon glyphicon-list-alt"></i>',
		'</a>'
	].join('');
}

window.detailEvents = {
    'click .detail':function(e,value,row,index){
        if(typeof($table3) != 'undefined')
            $table3.bootstrapTable('destroy');
        $table3 = $("#detailTable").bootstrapTable({
            url:"findStudentByParId/id="+row['par_id'],
            striped:true,
            pagination:true,
            height:300,
            width:400,
            pageSize:12
        })
    }
}