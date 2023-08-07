/* When the user clicks on the button, 
toggle between hiding and showing the dropdown content */
document.addEventListener("DOMContentLoaded", (event) => {

  console.log('content loaded');

  const category = document.getElementById("dropdown-category")
  category.addEventListener(
    'click',
    (event) => {
      category.classList.toggle('show');
    } 
  );

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
});