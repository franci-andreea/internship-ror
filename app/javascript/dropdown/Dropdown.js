/* When the user clicks on the button, 
toggle between hiding and showing the dropdown content */
document.addEventListener("DOMContentLoaded", (event) => {

  const category = document.getElementById("dropdown-category");
  category.addEventListener(
    'click',
    (event) => {
      category.getElementsByClassName('dropdown-content')[0].classList.toggle("show");
    } 
  );

  const sorting = document.getElementById("dropdown-sorting")
  sorting.addEventListener(
    'click',
    (event) => {
      sorting.getElementsByClassName('dropdown-content')[0].classList.toggle("show");
    } 
  );

  const vegetarian = document.getElementById("dropdown-vegetarian")
  vegetarian.addEventListener(
    'click',
    (event) => {
      vegetarian.getElementsByClassName('dropdown-content')[0].classList.toggle("show");
    } 
  );

  // Close the dropdown if the user clicks outside of it
  window.addEventListener(
    'click',
    (event) => {
      if (!event.target.matches(".drop-button")) {
        var dropdowns = document.getElementsByClassName("dropdown-content");
  
        for (let i = 0; i < dropdowns.length; i++) {
          var openDropdown = dropdowns[i];
          if (openDropdown.classList.contains("show")) {
            openDropdown.classList.toggle("show");
          }
        }
      }
    }
  );
});