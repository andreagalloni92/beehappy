// GET request handler
var getJSON = function (url, callback) {
    var xhr = new XMLHttpRequest();
    xhr.open('GET', url, true);
    xhr.responseType = 'json';
    xhr.onload = function () {
        var status = xhr.status;
        if (status === 200) {
            callback(null, xhr.response);
        } else {
            callback(status, xhr.response);
        }
    };
    xhr.send();
};

// actual chart builder
function build_charts(labels, temp, humidity) {
    var chart = new Chart(document.getElementById("line-chart"), {
        type: 'line',
        data: {
            labels: labels,
            datasets: [{
                data: temp,
                label: "Temperature",
                borderColor: "#3e95cd",
                fill: false,
                borderWidth: 1.5,
            }, {
                data: humidity,
                label: "Humidity",
                borderColor: "#8e5ea2",
                fill: false,
                borderWidth: 1.5,
            },
            ]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                title: {
                    display: true,
                    text: 'BeeHappy Stats!'
                }
            }
        }
    });

}
// ================
// == Main Call ==
// ================

getJSON("/api/data",
    function (err, data) {
        // Data manipulation 4 charting
        var labels = data.map(({ datetime }) => datetime);
        var temp = data.map(({ temperature }) => temperature);
        // stupid fx to keep a decent visualization with (bad) testing data. 
        var humidity = data.map(({ humidity }) => (humidity < 3000) ? humidity : humidity / 50);

        // Actual call to create the chart(s)
        build_charts(labels, temp, humidity)

    });
