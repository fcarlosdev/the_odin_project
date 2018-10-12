var GameBoard = (function() {

  var board = [["","",""],["","",""],["","",""]];

  const fillSpace = function(mark, row, col) {
    board[row][col] = mark;
  }

  const emptySpace = function(row, col) {
    return (board[row][col] == "");
  }

  return {
    fillSpace
  };
})();

const PlayerFactory = function(name, mark) {
  var markedSpot = [];
  return {name, mark, markedSpot};
};

var GameController = (function() {

  var players = [];

  const registerPlayers = function(listOfPlayers) {
    listOfPlayers.forEach(function(player) {
      players.push(player);
    })
  }

  const makeMove = function(player) {
    GameBoard.fillSpace(player.mark, player.markedSpot[0], player.markedSpot[1]);
  }

  return { registerPlayers, makeMove };

})();

GameController.registerPlayers(
  [ PlayerFactory("Player X", "X"),
    PlayerFactory("Player 0", "0") ]
);


let gridItems = document.querySelectorAll('.grid-item');

gridItems.forEach(function(item){

  item.addEventListener('click',function(e) {
    e.preventDefault();
    this.textContent = (this.textContent == "X") ? "0" : "X";

    if (item.getAttribute("id") === "cell-one") {
      GameBoard.fillSpace(this.textContent, 0, 0);
    } else if (item.getAttribute("id") === "cell-two") {
      GameBoard.fillSpace(this.textContent, 0, 1);
    } else if (item.getAttribute("id") === "cell-three") {
      GameBoard.fillSpace(this.textContent, 0, 2);
    } else if (item.getAttribute("id") === "cell-four") {
      GameBoard.fillSpace(this.textContent, 1, 0);
    } else if (item.getAttribute("id") === "cell-five") {
      GameBoard.fillSpace(this.textContent, 1, 1);
    } else if (item.getAttribute("id") === "cell-six") {
      GameBoard.fillSpace(this.textContent, 1, 2);
    } else if (item.getAttribute("id") === "cell-seven") {
      GameBoard.fillSpace(this.textContent, 2, 0);
    } else if (item.getAttribute("id") === "cell-eight") {
      GameBoard.fillSpace(this.textContent, 2, 1);
    } else if (item.getAttribute("id") === "cell-nine") {
      GameBoard.fillSpace(this.textContent, 2, 2);
    }
  });

})
