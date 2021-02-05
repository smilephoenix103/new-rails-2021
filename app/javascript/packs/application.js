// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

//= require reports_kit/application
//= require_tree
// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

const Chart = require('chart.js')

document.addEventListener('turbolinks:load', () => {


    const myReport = document.querySelector("#myChart").dataset.chart;
    // const chartUrl =  "http://localhost:3000/reports_kit/reports.json?report_params[key]=my_reports&properties={}";
    const chartUrl = "http://localhost:3000/reports_kit/reports.json?report_params[key]=" + myReport + "&properties={}";

    fetch(chartUrl)
        .then(function(response) {
             response.json().then(data => {
                // do something with your data
                var chartData = data.data.chart_data;
                //var datasets = chartData.datasets;
                // var labels = chartData.labels;
                // var options = chartData.options;

                var ctx = document.getElementById('myChart').getContext('2d');
                var chart = new Chart(ctx, {
                    type: 'bar',
                    data: chartData,
                    //options: options
                });
            });
        })
        .catch(function() {
            // This is where you run code if the server returns any errors
            });
})