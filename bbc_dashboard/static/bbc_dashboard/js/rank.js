$std_id = null;
$(document).ready(function(){
    $table = $("#rankTable").bootstrapTable({
        striped:true,
        pagination:true,
        height:600,
        width:800,
        pageSize:12
    })

    $("#btn_add").click(function(){
        $table2 = $("#addStudentTable").bootstrapTable({
            striped:true,
            pagination:true,
            height:300,
            width:400,
            pageSize:12
        }).on('click-row.bs.table',function(e,row,element){
            element.find("input").prop("checked",true);
			$std_id = row['std_id'];
        })
    })

    $("#addRankConfirm").click(function(){
        setTimeout(300);
        if($std_id == null){
            alert("Choose one student");
            return;
        }
        $("#std_id").val($std_id);
        $("#addRankForm").submit();
        
    })
})

window.removeEvents = {
    'click .remove':function(e,value,row,index){
        if(confirm("Confirm to delete")){
            if(row['rank_color'] == "White"){
                alert("Basic record cannot be deleted.");
                return;
            } else {
                $.ajax({
                    url:'deleteRank',
                    method:'POST',
                    dataType:'json',
                    data:{
                        'removeId':row['rank_id']
                    },
                    success:function(result){
                        location.href = 'rank'
                    }
                })
            }
        }
    }
}