var GameBoard = (function() {

})();


let gridItems = document.querySelectorAll('.grid-item');

gridItems.forEach(function(item){

  item.addEventListener('click',function(e) {
    e.preventDefault();
    this.textContent = (this.textContent == "X") ? "0" : "X";
  });

})
