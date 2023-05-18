<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
    #container{
        width: 600px;
        height : 400px;
        border : 2px solid red;
    }
</style>
<script>
    let chart02 = {
        init: function(){
            $('#chart02 > button').on('click', () => {//람다로 나타내면 this가 바로 상위가 아니라 그 위 노드의 상위.
                //this.display();
                this.getdata();
                });
            setInterval(()=>{
                this.getdata()//this는 init function의 상위인 chart02를 지칭?
            },5000)
            //또는 setInterval(chart02.getdata,5000); 함수명만 기재하여 실행.
    },
        getdata : function(){
            $.ajax({
                url:'/chart02',
                success: function(result){
                    //console.log(result);
                    chart02.display(result);
                },
            });
        },
        display : function(result){
            Highcharts.chart('container', {
                chart: {
                    type: 'column',
                    options3d: {
                        enabled: true,
                        alpha: 10,
                        beta: 25,
                        depth: 70
                    }
                },
                title: {
                    text: 'External trade in goods by country, Norway 2021',
                    align: 'left'
                },
                subtitle: {
                    text: 'Source: ' +
                        '<a href="https://www.ssb.no/en/statbank/table/08804/"' +
                        'target="_blank">SSB</a>',
                    align: 'left'
                },
                plotOptions: {
                    column: {
                        depth: 25
                    }
                },
                xAxis: {
                    categories: result.category,
                    labels: {
                        skew3d: true,
                        style: {
                            fontSize: '16px'
                        }
                    }
                },
                yAxis: {
                    title: {
                        text: 'NOK (million)',
                        margin: 20
                    }
                },
                tooltip: {
                    valueSuffix: ' MNOK'
                },
                series: [{
                    name: 'Total imports',
                    data: result.datas
                }]
            });//end of chart import
        }
    }
    $(function(){
        chart02.init();
    })
</script>
<div class="col-sm-8 text-left">
    <div class="container" id = "chart02">
        <h3>Chart02</h3>
        <button type="button" class="btn btn-danger">chart</button>
        <div id = "container"></div>
    </div>
</div>