
function createGrid(size) {

    var square = $("<div />").addClass("square");
    var row    = $("<div />").addClass("row");    
    var dimension = ($("#container").width() / size);

    $(square).width(dimension);
    $(square).height(dimension);
    $Column = $(square);

    for(var i = 0; i < size; i++) {
      row.append($Column.clone());
    }

   for (var j = 0; j < size; j++) {
     $("#container").append(row.clone());
   }
}

function paintCell() {
    $(".square").hover(function() {
        $(this).css("background-color", "green");
    }, function() {
      $(this).css("background-color", "red");
	});
}

function paintCellWithRandomColors() {
    $(".square").hover(function() {
        $(this).css("background-color", generateColor());
    }, function() {
      $(this).css("background-color", generateColor());
	});
}

function generateColor() {

    var red = Math.floor((Math.random() * 255) + 1);
    var green = Math.floor((Math.random() * 255) + 1);
    var blue = Math.floor((Math.random() * 255) + 1);

	return "rgb(" + red + "," + green + "," + blue + ")";
}

function createDefaultGrid() {
    $("#default").click(function(){
        clearGrid();
        paintCell();
    });
}

function createGradientGrid() {
   $("#gradient").click(function(){
    	clearGrid();
   		paintCellWithRandomColors();
   });
}


function clearGrid() {
    $("#container").empty();
    newSize = prompt("Enter the new size of 1 to 100 the new grid ");
    if ( newSize <= 100) {
      createGrid(newSize);
    } else {
      alert("Too big large. Ente a number up to 100.");
    }
}

$(document).ready(function(){
    createGrid(16);
    paintCell();
    createDefaultGrid();
    createGradientGrid();

    $("#clear").on( "click", function() {
        clearGrid();
        paintCell();
    });
});
