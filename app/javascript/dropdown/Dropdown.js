/* When the user clicks on the button, 
toggle between hiding and showing the dropdown content */
function dropDownCategory() {
  document.getElementById("dropdown-category").classList.toggle("show");
}

function dropDownSorting() {
    document.getElementById("dropdown-sorting").classList.toggle("show");
}

function dropDownVegetarian() {
    document.getElementById("dropdown-vegetarian").classList.toggle("show");
}

// Close the dropdown if the user clicks outside of it
window.onclick = function(event) {
  if (!event.target.matches('.drop-button')) {
    var dropdowns = document.getElementsByClassName("dropdown-content");

    for (let i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}
