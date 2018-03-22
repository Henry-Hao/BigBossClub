$std_id = null;
$(document).ready(function(){
    $table = $("#feesTable").bootstrapTable({
        striped:true,
        pagination:true,
        height:600,
        width:800,
        pageSize:12
    })

    $("#btn_add").click(function(){
        $table2 = $("#addStudentTable").bootstrapTable({
            striped:true,
            height:300,
            width:400,
            pagination:true,
            pageSize:10
        }).on('click-row.bs.table',function(e,row,element){
            element.find("input").prop("checked",true);
			$std_id = row['std_id'];
        })
    })

    $("#addFeesConfirm").click(function(){
        setTimeout(300);
        if($std_id == null){
            alert("Select one student");
            return;
        }
        $("#addStdId").val($std_id);
        $("#addFeesForm").submit();
    })
})

window.removeEvents = {
    'click .remove':function(e,value,row,index){
        if(confirm("Confirm to delete!")){
            $.ajax({
                url:"deleteFees",
                method:"POST",
                dataType:'json',
                data:{
                    'removeId':row['fees_id']
                },
                success:function(result){
                    location.href = 'fees'
                }
            })
        }
    }
}