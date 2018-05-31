<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://code.highcharts.com/stock/highstock.js"></script>
<script src="https://code.highcharts.com/stock/modules/exporting.js"></script>

<script type="text/javascript">


    $.getJSON('https://cdn.rawgit.com/highcharts/highcharts/057b672172ccc6c08fe7dbb27fc17ebca3f5b770/samples/data/large-dataset.json', function (data) {

        // Create a timer
        var start = +new Date();

        // Create the chart
        Highcharts.stockChart('container', {
            chart: {
                events: {
                    load: function () {
                        if (!window.TestController) {
                            this.setTitle(null, {
                                text: 'Built chart in ' + (new Date() - start) + 'ms'
                            });
                        }
                    }
                },
                zoomType: 'x'
            },

            rangeSelector: {

                buttons: [{
                    type: 'day',
                    count: 3,
                    text: '3d'
                }, {
                    type: 'week',
                    count: 1,
                    text: '1w'
                }, {
                    type: 'month',
                    count: 1,
                    text: '1m'
                }, {
                    type: 'month',
                    count: 6,
                    text: '6m'
                }, {
                    type: 'year',
                    count: 1,
                    text: '1y'
                }, {
                    type: 'all',
                    text: 'All'
                }],
                selected: 3
            },

            yAxis: {
                title: {
                    text: 'Temperature (°C)'
                }
            },

            title: {
                text: 'Hourly temperatures in Vik i Sogn, Norway, 2009-2017'
            },

            subtitle: {
                text: 'Built chart in ...' // dummy text to reserve space for dynamic subtitle
            },

            series: [{
                name: 'Temperature',
                data: data.data,
                pointStart: data.pointStart,
                pointInterval: data.pointInterval,
                tooltip: {
                    valueDecimals: 1,
                    valueSuffix: '°C'
                }
            }]

        });
    });

</script>

<div id="container" style="height: 400px; min-width: 400px"></div>
    <div class="jumbotron">
        <h1>ASP.NET</h1>
        <p class="lead">ASP.NET is a free web framework for building great Web sites and Web applications using HTML, CSS, and JavaScript.</p>
        <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Getting started</h2>
            <p>
                ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
            A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Get more libraries</h2>
            <p>
                NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Web Hosting</h2>
            <p>
                You can easily find a web hosting company that offers the right mix of features and price for your applications.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
