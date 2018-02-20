$std_id = new Set();
$class_id = null;
$time = null;
map = ['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'];
$(document).ready(function(){
    $table = $("#attendanceTable").bootstrapTable({
        striped:true,
        pagination:true,
        height:600,
        width:800,
        pageSize:12
    })

    $("#btn_add").click(function(){
        $('#time').datetimepicker({
			language:  'en',
			weekStart: 1,
			todayBtn:  1,
			autoclose: 1,
			todayHighlight: 1,
			forceParse: 0,
			showMeridian: 1,
			minView:2,
			pickerPosition:'bottom-left'
        });
        $("#time")
		.datetimepicker()
		.on('changeDate', function(ev){
           $time = $("#time_input").val();
           $("#att_date").val($time);
		});
		$('#time').datetimepicker('setEndDate', new Date());

    })


    $("#DateSelectBtn").click(function(){
        $std_id = new Set();
        $class_id = null;
        year = $time.substring(0,4);
        month = $time.substring(5,7);
        day = $time.substring(8,10);
        dayofweek = map[new Date(year,month,day).getDay()];
        if( typeof($table1) != 'undefined'){
            $table1.bootstrapTable("destroy");
        }
        $table1 = $("#addClassTable").bootstrapTable({
            url:'class/data/date='+dayofweek,
            striped:true,
            pagination:true,
            height:300,
            width:400,
            pageSize:12
        }).on('click-row.bs.table',function(e,row,element){
            element.find("input").prop("checked",true);
			$class_id = row['class_id'];
        })


        $table2 = $("#addStudentTable").bootstrapTable({
            striped:true,
            pagination:true,
            height:300,
            width:400,
            pageSize:12
        }).on('click-row.bs.table',function(e,row,element){
            a = element.find("input");
            if(a.prop('checked')){
                a.prop('checked',false);
                $std_id.delete(row['std_id']);
            } else {
                a.prop('checked',true);
                $std_id.add(row['std_id']);
            }
        }).on('check.bs.table',function(e,row,element){
            $std_id.add(row['std_id']);
        }).on('uncheck.bs.table',function(e,row,element){
            $std_id.delete(row['std_id']);
        }).on('check-all.bs.table',function(e,rows,element){
            $std_id.clear();
            $.each(rows,function(index,row){
                $std_id.add(row['std_id']);
            })
        }).on('uncheck-all.bs.table',function(e,rows,element){
            $std_id.clear();
        })

        $("#addAttendanceConfirm").click(function(){
            if($class_id == null || $std_id.size == 0){
                alert("Select one class and at least one student");
                return;
            }
            $("#class_id").val($class_id);
            $("#std_id").val(Array.from($std_id).join(';'));
            $("#addAttendanceForm").submit();
        })


    })
})

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
            url:'class/data/class='+row['class_id']+'&date='+row['date'],
            striped:true,
            pagination:true,
            height:300,
            width:400,
            pageSize:12
        })
    }
}

window.removeEvents = {
    'click .remove':function(e,value,row,index){
        if(confirm("Confirm to delete!")){
            $.ajax({
                url:'deteleAttendance',
                method:'POST',
                dataType:'json',
                data:{
                    'date':row['date'],
                    'class_id':row['class_id']
                },
                success:function(result){
                    location.href = 'attendance';
                }
            })
        }
    }
}