document.addEventListener("DOMContentLoaded", function () {
  let uislider = document.getElementById("uislider");
  let min = document.getElementById("min-slider");
  let max = document.getElementById("max-slider");

  noUiSlider.create(uislider, {
    start: [30, 85], 
    step: 1,
    margin: 0,
    connect: true, 
    orientation: 'horizontal', // Orient the slider vertically
    behaviour: 'tap-drag', // Move handle on tap, bar is draggable
    range: { 
      min: 15,
      max: 100
    },
  });

  uislider.noUiSlider.on('update', function (values, handle) {
    min.textContent = "$" + values[0];
    max.textContent = "$" + values[1];
  });
});
