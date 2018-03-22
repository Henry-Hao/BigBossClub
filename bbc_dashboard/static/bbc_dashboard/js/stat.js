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

var fillGapsWithZeroPlugin = {
    beforeUpdate: function(c) {
        var timeAxis = c.options.scales.xAxes[0].time;
        if (!timeAxis || !timeAxis.fillGapsWithZero) return;
        for (var i=0;i<c.data.datasets.length;i++){
            var set = c.data.datasets[i];
            var min, max, hash = {};
            for (var j=0;j<set.data.length;j++){
                var val = moment(set.data[j].t, timeAxis.parser);
                if (!min || min.diff(val)>0)
                    min = val;
                if (!max || max.diff(val)<0)
                    max = val;
                hash[set.data[j].t] = 1;
            }
            for (var val = min; max.diff(val)>0; val.add(1, timeAxis.minUnit)){
                var d = val.format(timeAxis.parser);
                if (!hash[d])
                    set.data.push({t:d, y:0});
            }
            set.data.sort(function(a,b){
                return a.t < b.t?-1:1;
            });
        }
    }
}



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
            Chart.pluginService.register(fillGapsWithZeroPlugin);
            maxV = 0;
            for(x in result[1]){
                if (result[1][x]['y'] > maxV)
                maxV = result[1][x]['y']
            }

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
                    spanGaps:true,
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
                                unit:"month",
                                fillGapsWithZero:true,
                                minUnit:"month",
                                parser:"YYYY-MM"
                            },
                            bounds:"ticks",
                            position:"bottom",
                            display:"true",
                            scaleLabel: {
                                display: true,
                                labelString: 'Month'
                            }
                        }],
                        yAxes: [{
                            ticks: {
                                beginAtZero: true,
                                min: 0,
                                stepSize: 1,
                                max: maxV+1
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
            Chart.pluginService.unregister(fillGapsWithZeroPlugin);
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
            s = new Set()
            for(i in result[1]['data']){
                s.add(result[1]['data'][i]['y'])
            }
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
                    tooltips: {
                        callbacks: {
                           label: function(t, d) {
                               timeLabel = moment(t.xLabel).format("HH:mm");
                               levelLabel = t.yLabel;
                               radiusLabel = d.datasets[0].data[t.index].r;
                            return timeLabel+","+levelLabel+","+radiusLabel
                           }
                        }
                     },
                    scales:{
                        xAxes:[{
                            type:"time",
                            bounds:"ticks",
                            time:{
                                unit:"hour",
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
                            labels: Array.from(s),
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