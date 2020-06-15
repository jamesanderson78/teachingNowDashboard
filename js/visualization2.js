Plotly.newPlot('myDiv', {
    data: [{
        x: [1, 2, 3],
        y: [2, 12, 3],
    }],
    layout: {
        sliders: [{
            pad: {t: 30},
            x: 0.05,
            len: 0.95,
            currentvalue: {
                xanchor: 'right',
                prefix: 'Week: ',
                font: {
                    color: '#888',
                    size: 20
                }   
            },
            transition: {duration: 500},
            // By default, animate commands are bound to the most recently animated frame:
            steps: [{
                label: '20', // week number
                method: 'animate',
                args: [['redish'], { // frame name
                    mode: 'immediate',
                    frame: {redraw: false, duration: 500},
                    transition: {duration: 500}
                }]
            }, {
                label: '21',
                method: 'animate',
                args: [['green'], {
                    mode: 'immediate',
                    frame: {redraw: false, duration: 500},
                    transition: {duration: 500}
                }]
            }, {
                label: '22',
                method: 'animate',
                args: [['blue'], {
                    mode: 'immediate',
                    frame: {redraw: false, duration: 500},
                    transition: {duration: 500}
                }]
            }]
        }],
        updatemenus: [{
            type: 'buttons',
            showactive: false,
            x: 0.05,
            y: 0,
            xanchor: 'right',
            yanchor: 'top',
            pad: {t: 60, r: 20},
            buttons: [{
                label: 'Play',
                method: 'animate',
                args: [null, {
                    fromcurrent: true,
                    frame: {redraw: false, duration: 1000},
                    transition: {duration: 500}
                }]
            }]
        }]
    },
    // The slider itself does not contain any notion of timing, so animating a slider
    // must be accomplished through a sequence of frames. Here we'll change the color
    // and the data of a single trace:
    frames: [{
        name: 'redish',
        data: [{
            y: [2, 1, 3],
        }]
    }, {
        name: 'green',
        data: [{
            y: [3, 2, 1],
        }]
    }, {
        name: 'blue',
        data: [{
            y: [1, 3, 2],
        }]
    }]
});



// Plotly.d3.csv('data/WeeklyClassCounts.csv', function (err, data) {
//     // Create a lookup table to sort and regroup the columns of data,
//     var lookup = {};

//     function getData(year, continent) {
//         var byYear, trace;
//         if (!(byYear = lookup[year])) {;
//             byYear = lookup[year] = {};
//         }
//         // If a container for this year + continent doesn't exist yet,
//         // then create one:
//         if (!(trace = byYear[continent])) {
//             trace = byYear[continent] = {
//                 x: [],
//                 y: [],
//                 id: [],
//                 text: [],
//                 marker: {size: []}
//             };
//         }
//         return trace;
//     }

//     // Create the main traces (data): one for each week
//     var traces = [];
//     for (i = 0; i < continents.length; i++) {
//         var data = firstYear[continents[i]];
//         // One small note. We're creating a single trace here, to which
//         // the frames will pass data for the different years. It's
//         // subtle, but to avoid data reference problems, we'll slice
//         // the arrays to ensure we never write any new data into our
//         // lookup table:
//         traces.push({
//             name: continents[i],
//             x: data.x.slice(),
//             y: data.y.slice(),
//             id: data.id.slice(),
//             text: data.text.slice(),
//             mode: 'markers',
//             marker: {
//                 size: data.marker.size.slice(),
//                 sizemode: 'area',
//                 sizeref: 200000
//             }
//         });
//     }

//     // Create a frame for each year. Frames are effectively just
//     // traces, except they don't need to contain the *full* trace
//     // definition (for example, appearance). The frames just need
//     // the parts the traces that change (here, the data).
//     var frames = [];
//     for (i = 0; i < years.length; i++) {
//         frames.push({
//             name: years[i],
//             data: continents.map(function (continent) {
//                 return getData(years[i], continent);
//             })
//         })
//     }

//     // Now create slider steps, one for each frame. The slider
//     // executes a plotly.js API command (here, Plotly.animate).
//     // In this example, we'll animate to one of the named frames
//     // created in the above loop.
//     var sliderSteps = [];
//     for (i = 0; i < years.length; i++) {
//         sliderSteps.push({
//             method: 'animate',
//             label: years[i],
//             args: [[years[i]], {
//                 mode: 'immediate',
//                 transition: {duration: 300},
//                 frame: {duration: 300, redraw: false},
//             }]
//         });
//     }

//     var layout = {
//         xaxis: {
//             title: 'Life Expectancy',
//             range: [30, 85]
//         },
//         yaxis: {
//             title: 'GDP per Capita',
//             type: 'log'
//         },
//         hovermode: 'closest',
//             // We'll use updatemenus (whose functionality includes menus as
//             // well as buttons) to create a play button and a pause button.
//             // The play button works by passing `null`, which indicates that
//             // Plotly should animate all frames. The pause button works by
//             // passing `[null]`, which indicates we'd like to interrupt any
//             // currently running animations with a new list of frames. Here
//             // The new list of frames is empty, so it halts the animation.
//         updatemenus: [{
//             x: 0,
//             y: 0,
//             yanchor: 'top',
//             xanchor: 'left',
//             showactive: false,
//             direction: 'left',
//             type: 'buttons',
//             pad: {t: 87, r: 10},
//             buttons: [{
//                 method: 'animate',
//                 args: [null, {
//                     mode: 'immediate',
//                     fromcurrent: true,
//                     transition: {duration: 300},
//                     frame: {duration: 500, redraw: false}
//                 }],
//                 label: 'Play'
//             }, {
//                 method: 'animate',
//                 args: [[null], {
//                     mode: 'immediate',
//                     transition: {duration: 0},
//                     frame: {duration: 0, redraw: false}
//                 }],
//                 label: 'Pause'
//             }]
//         }],
//             // Finally, add the slider and use `pad` to position it
//             // nicely next to the buttons.
//         sliders: [{
//             pad: {l: 130, t: 55},
//             currentvalue: {
//                 visible: true,
//                 prefix: 'Year:',
//                 xanchor: 'right',
//                 font: {size: 20, color: '#666'}
//             },
//             steps: sliderSteps
//         }]
//     };

//     // Create the plot:
//     Plotly.newPlot('myDiv', {
//         data: traces,
//         layout: layout,
//         frames: frames,
//     });
// });