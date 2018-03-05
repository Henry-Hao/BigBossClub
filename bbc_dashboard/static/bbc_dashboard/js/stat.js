$(document).ready(function(){
    $("#studentBtn").click(function(){
        hideAll();
        $("#studentGroup").show();
        studentGraph();
    });

    $("#rankBtn").click(function(){
        hideAll();
        $("#rankGroup").show();
        rankGraph();
    });

    $("#attendanceBtn").click(function(){
        hideAll();
        $("#attendanceGroup").show();
        attendanceGraph();
    })
          
})

function studentGraph(){
    $.ajax({
        url:"studentStatUrl",
        method:"POST",
        dataType:"json",
        success:function(result){
            // pie graph
            var myChart1 = new Chart($("#studentChart1"), {
                type: 'pie',
                data: {
                    labels: ["Juveniles","Adult"],
                    datasets: [{
                        data: result[0],
                        backgroundColor:[
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(255, 206, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(255, 159, 64, 0.2)'
                        ],
                        borderColor: [
                            'rgba(255,99,132,1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)',
                            'rgba(75, 192, 192, 1)',
                            'rgba(153, 102, 255, 1)',
                            'rgba(255, 159, 64, 1)'
                        ],
                        borderWidth: 1
                    }]
                },
                options:{
                    title:{
                        display:true,
                        text:"Composition of Student",
                        fontSize:16,
                        position:'bottom'
                    },
                    layout:{
                        padding:{
                            left:0,
                            top:50,
                            right:0,
                            bottom:0
                        }
                    }
                }
        
            });
            // line graph
            var myChart2 = new Chart($("#studentChart2"),{
                type: 'line',
                data: {
                    datasets: [{
                        data: result[1],
                        backgroundColor:"rgba(255,99,132, 0.3)",
                        borderColor:"rgba(255,99,132,1)",
                        pointBackgroundColor:"rgba(54, 162, 235, 0.3)",
                        pointBorderColor:"rgba(rgba(54, 162, 235, 1))",
                        pointRadius:6,
                        pointHoverRadius:6,
                    }]
                },
                options:{
                    elements: {
                        line: {
                            tension: 0, // disables bezier curves
                        }
                    },
                    title:{
                        display:true,
                        text:"Registration per Month",
                        fontSize:16,
                        position:"bottom"
                    },
                    scales:{
                        xAxes:[{
                            type:"time",
                            time:{
                                unit:"month"
                            },
                            position:"bottom",
                            display:"true",
                            scaleLabel: {
                                display: true,
                                labelString: 'Month'
                            },
                        }],
                        yAxes: [{
                            ticks: {
                                min: 0,
                                stepSize: 1,
                            },
                            position:"left",
                            display:"true",
                            scaleLabel: {
                                display: true,
                                labelString: 'Number of Registration'
                            },
                        }]
                    },
                    layout:{
                        padding:{
                            left:0,
                            top:50,
                            right:0,
                            bottom:0
                        }
                    },
                    legend:{
                        display:false
                    }
                }
                
            })
        }
    })
}

function rankGraph(){
    $.ajax({
        url:"rankStatUrl",
        method:"POST",
        dataType:"json",
        success:function(result){
            var myChart3 = new Chart($("#rankChart1"), {
                type: 'pie',
                data: {
                    labels: result[0]['labels'],
                    datasets: [{
                        data: result[0]['data'],
                        backgroundColor:[
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(255, 206, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(255, 159, 64, 0.2)'
                        ],
                        borderColor: [
                            'rgba(255,99,132,1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)',
                            'rgba(75, 192, 192, 1)',
                            'rgba(153, 102, 255, 1)',
                            'rgba(255, 159, 64, 1)'
                        ],
                        borderWidth: 1
                    }]
                },
                options:{
                    title:{
                        display:true,
                        text:"Ranks of Student",
                        fontSize:16,
                        position:'bottom'
                    },
                    layout:{
                        padding:{
                            left:0,
                            top:50,
                            right:0,
                            bottom:0
                        }
                    }
                }
        
            });

            
        }
    })
}

function attendanceGraph(){
    $.ajax({
        url:"attendanceStatUrl",
        method:"POST",
        dataType:"json",
        success:function(result){
            var myChart4 = new Chart($("#attChart1"),{
                type: 'bar',
                data: {
                    labels:result[0]['labels'],
                    datasets: [{
                        data: result[0]['data'],
                        backgroundColor:"rgba(255,99,132, 0.3)",
                        borderColor:"rgba(255,99,132,1)",
                        pointRadius:6,
                        pointHoverRadius:6,
                    }]
                },
                options:{
                    scales:{
                        xAxes: [{
                            stacked: true,
                            display:true,
                            position:"bottom",
                            scaleLabel:{
                                display:true,
                                labelString:'Class'
                            }
                        }],
                        yAxes: [{
                            stacked: true,
                            display:true,
                            position:"left",
                            scaleLabel:{
                                display:true,
                                labelString:'Average attendance'
                            }
                        }]
                    },
                    title:{
                        display:true,
                        text:"Average Attendance per Class",
                        fontSize:16,
                        position:"bottom"
                    },
                    layout:{
                        padding:{
                            left:0,
                            top:50,
                            right:0,
                            bottom:0
                        }
                    },legend:{
                        display:false
                    }
                }
            });

            var myChart5 = new Chart($("#attChart2"),{
                type: 'bubble',
                data: {
                    yLabels:result[1]['labels'],
                    datasets: [{
                        data: result[1]['data'],
                        borderWidth: 1
                    }]
                },
                options:{
                    scales:{
                        xAxes:[{
                            type:"time",
                            bounds:"ticks",
                            time:{
                                unit:"hour"
                            },
                            display:"true",
                            scaleLabel:{
                                display:true,
                                labelString:'Time'
                            }
                        }],
                        yAxes:[{
                            type:"category",
                            position:"left",
                            display:"true",
                            scaleLabel: {
                                display: true,
                                labelString: 'Class Level'
                            },
                        }]
                    },
                    legend:{
                        display:false
                    },
                    title:{
                        display:true,
                        text:"Distribution of Attendance",
                        fontSize:16,
                        position:'bottom'
                    },
                    layout:{
                        padding:{
                            left:0,
                            top:50,
                            right:0,
                            bottom:0
                        }
                    }
                }
        
            });
        }
    })
}

function hideAll(){
    $.each($(".group"),function(index,value){
        $(value).hide();
    })
}