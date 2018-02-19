$(document).ready(function(){
    $table = $("#instructorTable").bootstrapTable({
        striped:true,
        pagination:true,
        height:600,
        width:800,
        pageSize:12
    })

    $("#addInstructorConfirm").click(function(){
        if($("#add_name").val().trim() == ""){
            alert("Name must be filled!");
            return;
        }

        $("#addInstructorForm").submit();
    })

})

window.modifyEvents = {
    'click .modify':function(e,value,row,index){
        $("#modify_inst_id").val(row['inst_id']);
        $("#modify_name").val(row['inst_lname']);

        $("#modifyInstructorConfirm").click(function(){
            if($("#modify_name").val().trim() == ""){
                alert("Name must be filled!");
                return;
            }
    
            $("#modifyInstructorForm").submit();
        })
    }
}

window.removeEvents = {
    'click .remove':function(e,value,row,index){
        if(confirm("Confirm to delete!")){
            $.ajax({
                url:'deleteInstructor',
                method:'POST',
                dataType:'json',
                data:{
                    "removeId":row['inst_id']
                },
                success:function(result){
                    location.href = 'instructor';
                }
            })
        }
        
    }
}