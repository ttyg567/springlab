<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
</style>
<script>
    let chart03 = {
        init:function(){
            this.getdata1();
            this.getdata2();
            this.getdata3();
        },
        getdata1: function(){
            $.ajax({
                url:'/chart0301',
                success:function(result){
                    chart03.display1(result);
                }
            })
        },
        getdata2: function(){
            $.ajax({
                url:'/chart0302',
                success:function(result){
                    chart03.display2(result);
                }
            })
        },
        getdata3: function(){
            $.ajax({
                url:'/chart0303',
                success:function(result){
                    chart03.display3(result)
                }
            })

        },
        display1: function(result){
            Highcharts.chart('c1', {
                chart: {
                    type: 'pie',
                    options3d: {
                        enabled: true,
                        alpha: 45
                    }
                },
                title: {
                    text: 'Beijing 2022 gold medals by country',
                    align: 'left'
                },
                subtitle: {
                    text: '3D donut in Highcharts',
                    align: 'left'
                },
                plotOptions: {
                    pie: {
                        innerSize: 100,
                        depth: 45
                    }
                },
                series: [{
                    name: 'Medals',
                    data: result
                }]
            });
        },
        display2: function(result){
            Highcharts.chart('c2', {
                chart: {
                    type: 'cylinder',
                    options3d: {
                        enabled: true,
                        alpha: 15,
                        beta: 15,
                        depth: 50,
                        viewDistance: 25
                    }
                },
                title: {
                    text: 'Number of confirmed COVID-19'
                },
                subtitle: {
                    text: 'Source: ' +
                        '<a href="https://www.fhi.no/en/id/infectious-diseases/coronavirus/daily-reports/daily-reports-COVID19/"' +
                        'target="_blank">FHI</a>'
                },
                xAxis: {
                    categories: result.weight,
                    title: {
                        text: 'Age groups'
                    }
                },
                yAxis: {
                    title: {
                        margin: 20,
                        text: 'Reported cases'
                    }
                },
                tooltip: {
                    headerFormat: '<b>Age: {point.x}</b><br>'
                },
                plotOptions: {
                    series: {
                        depth: 25,
                        colorByPoint: true
                    }
                },
                series: [{
                    data: result.bmi,
                    name: 'Cases',
                    showInLegend: false
                }]
            });
        },

        display3: function(result){
            Highcharts.chart('c3', {
                chart: {
                    type: 'column'
                },
                title: {
                    text: 'World\'s largest cities per 2021'
                },
                subtitle: {
                    text: 'Source: <a href="https://worldpopulationreview.com/world-cities" target="_blank">World Population Review</a>'
                },
                xAxis: {
                    type: 'category',
                    labels: {
                        rotation: -45,
                        style: {
                            fontSize: '13px',
                            fontFamily: 'Verdana, sans-serif'
                        }
                    }
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: 'Population (millions)'
                    }
                },
                legend: {
                    enabled: false
                },
                tooltip: {
                    pointFormat: 'Population in 2021: <b>{point.y:.1f} millions</b>'
                },
                series: [{
                    name: 'Population',
                    data: result,
                    dataLabels: {
                        enabled: true,
                        rotation: -90,
                        color: '#FFFFFF',
                        align: 'right',
                        format: '{point.y:.1f}', // one decimal
                        y: 10, // 10 pixels down from the top
                        style: {
                            fontSize: '13px',
                            fontFamily: 'Verdana, sans-serif'
                        }
                    }
                }]
            });
        }

    };
    $(function(){
        chart03.init();
    })
</script>

<div class="col-sm-8 text-left">
    <div class="container">
        <h3 > CHART 03 </h3>
        <div class="row">
            <div class="col-sm-4" id="c1"></div>
            <div class="col-sm-4" id="c2"></div>
            <div class="col-sm-4" id="c3"></div>
        </div>
    </div>
</div>

