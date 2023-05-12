<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--<style>--%>
<%--    #c1, #c2, #c3{--%>
<%--        width : 250px;--%>
<%--        height : 300px;--%>
<%--        border : 2px solid blue;--%>
<%--        margin : 0 10px--%>
<%--    }--%>
<%--    .row{--%>
<%--        display : flex;--%>
<%--        /*align-items: center;*/--%>
<%--        justify-content: center;--%>
<%--    }--%>
<%--</style>--%>
<script>
    let chart03 = {
        init: function(){
            this.getdata1();
            this.getdata2();
            this.getdata3();
            this.getdata4();
        },
        getdata1: function(){
            $.ajax({
                url:'/chart0301',
                success: (result) => {
                    chart03.display1(result);
                }
            });
        },
        getdata2: function(){
            $.ajax({
               url:'/chart0302',
               success: (result) => {
                   chart03.display2(result);
               }
            });
        },
        getdata3: function(){
            $.ajax({
                url:'/chart0303',
                success: (result) => {
                    chart03.display3(result);
                }
            });
        },
        getdata4: function(){
            $.ajax({
                url:'/chart0304',
                success: (result) => {
                    console.log(result)
                    chart03.display4(result);
                }
            })
        },
        display1 : function(result){
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
                    //     [
                    //     ['Norway', 16],
                    //     ['Japan', 3]
                    // ]
                }]
            });
        },//display1 end

        display2 : function(result){
            Highcharts.setOptions({
                colors: Highcharts.getOptions().colors.map(function (color) {
                    return {
                        radialGradient: {
                            cx: 0.4,
                            cy: 0.3,
                            r: 0.5
                        },
                        stops: [
                            [0, color],
                            [1, Highcharts.color(color).brighten(-0.2).get('rgb')]
                        ]
                    };
                })
            });

// Set up the chart
            var chart = new Highcharts.Chart({
                chart: {
                    renderTo: 'c2',
                    margin: 100,
                    type: 'scatter3d',
                    animation: false,
                    options3d: {
                        enabled: true,
                        alpha: 10,
                        beta: 30,
                        depth: 250,
                        viewDistance: 5,
                        fitToPlot: false,
                        frame: {
                            bottom: { size: 1, color: 'rgba(0,0,0,0.02)' },
                            back: { size: 1, color: 'rgba(0,0,0,0.04)' },
                            side: { size: 1, color: 'rgba(0,0,0,0.06)' }
                        }
                    }
                },
                title: {
                    text: 'Draggable box'
                },
                subtitle: {
                    text: 'Click and drag the plot area to rotate in space'
                },
                plotOptions: {
                    scatter: {
                        width: 10,
                        height: 10,
                        depth: 10
                    }
                },
                yAxis: {
                    min: 0,
                    max: 10,
                    title: null
                },
                xAxis: {
                    min: 0,
                    max: 10,
                    gridLineWidth: 1
                },
                zAxis: {
                    min: 0,
                    max: 10,
                    showFirstLabel: false
                },
                legend: {
                    enabled: false
                },
                series: [{
                    name: 'Data',
                    colorByPoint: true,
                    accessibility: {
                        exposeAsGroupOnly: true
                    },
                    data: result
                        // [
                        // [1, 6, 5], [8, 7, 9], [1, 3, 4], [4, 6, 8], [5, 7, 7], [6, 9, 6]
                }]
            });


// Add mouse and touch events for rotation
            (function (H) {
                function dragStart(eStart) {
                    eStart = chart.pointer.normalize(eStart);

                    var posX = eStart.chartX,
                        posY = eStart.chartY,
                        alpha = chart.options.chart.options3d.alpha,
                        beta = chart.options.chart.options3d.beta,
                        sensitivity = 5,  // lower is more sensitive
                        handlers = [];

                    function drag(e) {
                        // Get e.chartX and e.chartY
                        e = chart.pointer.normalize(e);

                        chart.update({
                            chart: {
                                options3d: {
                                    alpha: alpha + (e.chartY - posY) / sensitivity,
                                    beta: beta + (posX - e.chartX) / sensitivity
                                }
                            }
                        }, undefined, undefined, false);
                    }

                    function unbindAll() {
                        handlers.forEach(function (unbind) {
                            if (unbind) {
                                unbind();
                            }
                        });
                        handlers.length = 0;
                    }

                    handlers.push(H.addEvent(document, 'mousemove', drag));
                    handlers.push(H.addEvent(document, 'touchmove', drag));


                    handlers.push(H.addEvent(document, 'mouseup', unbindAll));
                    handlers.push(H.addEvent(document, 'touchend', unbindAll));
                }
                H.addEvent(chart.container, 'mousedown', dragStart);
                H.addEvent(chart.container, 'touchstart', dragStart);
            }(Highcharts));
        },
        display3 : function(result){
            const chart = Highcharts.chart('c3', {
                title: {
                    text: 'Unemployment rates in engineering and ICT subjects, 2021',
                    align: 'left'
                },
                subtitle: {
                    text: 'Chart option: Plain | Source: ' +
                        '<a href="https://www.nav.no/no/nav-og-samfunn/statistikk/arbeidssokere-og-stillinger-statistikk/helt-ledige"' +
                        'target="_blank">NAV</a>',
                    align: 'left'
                },
                colors: [
                    '#4caefe',
                    '#3fbdf3',
                    '#35c3e8',
                    '#2bc9dc',
                    '#20cfe1',
                    '#16d4e6',
                    '#0dd9db',
                    '#03dfd0',
                    '#00e4c5',
                    '#00e9ba',
                    '#00eeaf',
                    '#23e274'
                ],
                xAxis: {
                    categories: result.category
                },
                series: [{
                    type: 'column',
                    name: 'Unemployed',
                    borderRadius: 5,
                    colorByPoint: true,
                    data: result.data,
                    showInLegend: false
                }]
            });

            document.getElementById('plain').addEventListener('click', () => {
                chart.update({
                    chart: {
                        inverted: false,
                        polar: false
                    },
                    subtitle: {
                        text: 'Chart option: Plain | Source: ' +
                            '<a href="https://www.nav.no/no/nav-og-samfunn/statistikk/arbeidssokere-og-stillinger-statistikk/helt-ledige"' +
                            'target="_blank">NAV</a>'
                    }
                });
            });

            document.getElementById('inverted').addEventListener('click', () => {
                chart.update({
                    chart: {
                        inverted: true,
                        polar: false
                    },
                    subtitle: {
                        text: 'Chart option: Inverted | Source: ' +
                            '<a href="https://www.nav.no/no/nav-og-samfunn/statistikk/arbeidssokere-og-stillinger-statistikk/helt-ledige"' +
                            'target="_blank">NAV</a>'
                    }
                });
            });

            document.getElementById('polar').addEventListener('click', () => {
                chart.update({
                    chart: {
                        inverted: false,
                        polar: true
                    },
                    subtitle: {
                        text: 'Chart option: Polar | Source: ' +
                            '<a href="https://www.nav.no/no/nav-og-samfunn/statistikk/arbeidssokere-og-stillinger-statistikk/helt-ledige"' +
                            'target="_blank">NAV</a>'
                    }
                });
            });

        },
        display4 : function(result){
            Highcharts.chart('c4', {
                chart: {
                    type: 'area',
                    options3d: {
                        enabled: true,
                        alpha: 15,
                        beta: 30,
                        depth: 200
                    }
                },
                title: {
                    text: 'Visual comparison of Mountains Panorama'
                },
                accessibility: {
                    description: 'The chart is showing the shapes of three mountain ranges as three area line series laid out in 3D behind each other.',
                    keyboardNavigation: {
                        seriesNavigation: {
                            mode: 'serialize'
                        }
                    }
                },
                lang: {
                    accessibility: {
                        axis: {
                            xAxisDescriptionPlural: 'The chart has 3 unlabelled X axes, one for each series.'
                        }
                    }
                },
                yAxis: {
                    title: {
                        text: 'Height Above Sea Level',
                        x: -40
                    },
                    labels: {
                        format: '{value:,.0f} MAMSL'
                    },
                    gridLineDashStyle: 'Dash'
                },
                xAxis: [{
                    visible: false
                }, {
                    visible: false
                }, {
                    visible: false
                }],
                plotOptions: {
                    area: {
                        depth: 100,
                        marker: {
                            enabled: false
                        },
                        states: {
                            inactive: {
                                enabled: false
                            }
                        }
                    }
                },
                tooltip: {
                    valueSuffix: ' MAMSL'
                },
                series: [{
                    name: 'Tatra Mountains visible from Rusinowa polana',
                    lineColor: 'rgb(180,90,50)',
                    color: 'rgb(200,110,50)',
                    fillColor: 'rgb(200,110,50)',
                    data: result.ja1
                }, {
                    xAxis: 1,
                    lineColor: 'rgb(120,160,180)',
                    color: 'rgb(140,180,200)',
                    fillColor: 'rgb(140,180,200)',
                    name: 'Dachstein panorama seen from Krippenstein',
                    data: result.ja2
                }, {
                    xAxis: 2,
                    lineColor: 'rgb(200, 190, 140)',
                    color: 'rgb(200, 190, 140)',
                    fillColor: 'rgb(230, 220, 180)',
                    name: 'Panorama from Col Des Mines',
                    data: result.ja3
                }]
            });
        }

    }
    $(function(){
        chart03.init();
    })

</script>
<div class="col-sm-8 text-left">
    <div class="container">
        <h3>Chart03</h3>
        <div class="row">
            <div id = "c4" class="col-sm-4">
            </div>
            <div id = "c2" class="col-sm-4">
            </div>
            <div class="col-sm-4">
            <div id = "c3">
            </div>
                <button id="plain">Plain</button>
                <button id="inverted">Inverted</button>
                <button id="polar">Polar</button>
            </div>
        </div>
    </div>
</div>