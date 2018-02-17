$(document).ready(function(){
    $table = $("#classTable").bootstrapTable({
        striped:true,
        pagination: true,
		height: 600,
		width:800,
		pageSize: 12
    })

    $("#add_time").clockpicker({
        autoclose:true
    });

    $("#addClassConfirm").click(function(){
        $("#addClassForm").submit();
    });
})

function modifyFormatter(value, row, index){
    return [
        '<a class="modify" data-dismiss="modal" data-toggle="modal" data-target="#modifyModal" style="text-decoration:none; text-align:center" href="#" title="Modify">',
            '<i class="glyphicon glyphicon-edit"></i>',
        '</a>'
    ].join('');
}

window.modifyEvents = {
    'click .modify':function(e, value, row, index){
        $("#modify_id").val(row['id']);
        $("#modify_name").val(row['class_name']);
        $("#modify_day").val(row['class_day']);
        $("#modify_inst").val(row['inst_id']);
        $("#modify_time_input").val(row['class_time']);
        $("#modify_time").clockpicker({
            autoclose:true
        })

        $("#modifyClassConfirm").click(function(){
            if($("#modify_name").trim() == null || 
                $("#modify_day").trim() == null ||
                $("#modify_time").trim() == null ||
                $("#modify_inst").trim() == null){
                    alert("All fields must be filed");
                    return;
                }
            $("#modifyClassForm").submit();
        });
    }
}

function removeFormatter(value, row, index){
    return [
        '<a class="remove" style="text-decoration:none; text-align:center" href="#" title="Remove">',
            '<i class="glyphicon glyphicon-remove"></i>',
        '</a>'
    ].join('');
}

window.removeEvents = {
    'click .remove':function(e, value, row, index){
        if(confirm("Confirm to delete the class. Note that all the related attendance records will be deleted.")){
            $.ajax({
                url:'deleteClass',
                data:{
                    'removeId':row['id']
                },
                method:"POST",
                dataType:'json',
                success:function(result){
                    location.href = "class";
                }
            })
        }
    }
}