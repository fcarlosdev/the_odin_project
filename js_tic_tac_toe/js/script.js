var players        = [];
var currPlayer     = null;
var choosedPlayer  = null;
var opponentPlayer = null
var optPlayerX     = document.querySelector('#px');
var optPlayer0     = document.querySelector('#p0');
var menuPlayers    = document.querySelector('.tictactoe');
var board          = document.querySelector('.board-container');
var ctnBts         = document.querySelector('.container-buttons');
var btnStartGame   = document.querySelector('#bt-start-game');
var btnCancelGame  = document.querySelector('#bt-cancel-game');
var btnNewGame     = document.querySelector('#bt-new-game');
var gridItems      = document.querySelectorAll('.grid-item');
var playerTurn     = document.querySelector('#player-turn');


var GameBoard = (function() {

  var board;

  var initializeBoard = function() {
    board = [["","",""],["","",""],["","",""]];
  }

  var fillSpace = function(mark, row, col) {
    board[row][col] = mark;
  }

  var emptySpace = function(row, col) {
    return (board[row][col] == "");
  }

  var boardFilled = function() {

    let hasEmptySpace = false;

    for (var row = 0; row < board.length; row++) {
      if (board[row].indexOf("") > -1) {
        hasEmptySpace = true;
        break;
      }
    }
    return hasEmptySpace;
  }

  var getBoard = function() {
    return board;
  }

  return {
    fillSpace, boardFilled, initializeBoard, getBoard
  };

})();

const PlayerFactory = function(name, mark) {
  var markedSpot = [];
  return {name, mark, markedSpot};
};

var DisplayController = (function () {

  var btnIsSelected = function(btn) {
    return (btn.getAttribute('selected') != null);
  }

  var _deselectButton = function(btn) {
    btn.style.backgroundColor='#23c0c6';
    btn.removeAttribute('selected');
  }

  var _selectButton = function(btn) {
    btn.style.backgroundColor='#345678';
    btn.setAttribute('selected', "true");
  }

  var _anyPlayerSelected = function(players) {
    return (btnIsSelected(players[0]) || btnIsSelected(players[1]) );
  }

  var changeBtnPlayerStatus = function(btnClicked, btnNotClicked, deSelectAll) {

    if (deSelectAll === "unSelectAll")  {
      _deselectButton(btnClicked);
      _deselectButton(btnNotClicked);
    } else {

      (btnIsSelected(btnClicked)) ? _deselectButton(btnClicked)
                                  : _selectButton(btnClicked);

      if (btnIsSelected(btnNotClicked) ) {
        _deselectButton(btnNotClicked);
      }
    }

  }

  var enableStartButton = function(btnStartGame,playersBtnChoose) {

    if (_anyPlayerSelected(playersBtnChoose)) {
      btnStartGame.disabled=false;
      btnStartGame.style.backgroundColor = "#216b4a";
    } else {
      btnStartGame.disabled= true;
      btnStartGame.style.backgroundColor = "#ccc";
    }

  }

  var _clearGrid = function() {
    gridItems.forEach(function(item) {
      item.textContent = "";
    });
    GameBoard.initializeBoard();
  }

  var resetGameObjects = function() {
    _clearGrid();
    board.style.display                = "none";
    ctnBts.style.display               = "none";
    btnStartGame.disabled              =  true;
    menuPlayers.style.display          = "block";
    btnNewGame.style.display           = "none";
    playerTurn.style.display           = "none";
    btnStartGame.style.backgroundColor = "#ccc";
    changeBtnPlayerStatus(optPlayerX, optPlayer0, "unSelectAll");
  }

  var showBoard = function() {
    board.style.display       = "grid";
    menuPlayers.style.display = "none";
    ctnBts.style.display      = "flex";
    playerTurn.style.display  = "flex";
  }

  var showMessage = function(message) {
    playerTurn.firstChild.textContent = message;
  }

  var fillSpot = function(spot, value) {
      spot.textContent = currPlayer.mark;
      if (spot.getAttribute("id") === "cell-one") {
        GameBoard.fillSpace(spot.textContent, 0, 0);
      } else if (spot.getAttribute("id") === "cell-two") {
        GameBoard.fillSpace(spot.textContent, 0, 1);
      } else if (spot.getAttribute("id") === "cell-three") {
        GameBoard.fillSpace(spot.textContent, 0, 2);
      } else if (spot.getAttribute("id") === "cell-four") {
        GameBoard.fillSpace(spot.textContent, 1, 0);
      } else if (spot.getAttribute("id") === "cell-five") {
        GameBoard.fillSpace(spot.textContent, 1, 1);
      } else if (spot.getAttribute("id") === "cell-six") {
        GameBoard.fillSpace(spot.textContent, 1, 2);
      } else if (spot.getAttribute("id") === "cell-seven") {
        GameBoard.fillSpace(spot.textContent, 2, 0);
      } else if (spot.getAttribute("id") === "cell-eight") {
        GameBoard.fillSpace(spot.textContent, 2, 1);
      } else if (spot.getAttribute("id") === "cell-nine") {
        GameBoard.fillSpace(spot.textContent, 2, 2);
      }
  }


  return {
    changeBtnPlayerStatus, enableStartButton, btnIsSelected, resetGameObjects,
    showBoard, showMessage, fillSpot
  }

})();

var Game = (function () {

    var _choosePlayers = function(playersOptions) {

      if (DisplayController.btnIsSelected(playersOptions[0])) {
        choosedPlayer  = players[0];
        opponentPlayer = players[1];
      } else if (DisplayController.btnIsSelected(playersOptions[1])) {
        choosedPlayer  = players[1];
        opponentPlayer = players[0];
      } else {
        choosedPlayer  = null;
        opponentPlayer = null;
      }
      currPlayer = choosedPlayer;
    }

    var changeCurrentPlayer = function() {
      return (currPlayer === players[0]) ? players[1] : players[0];
    }

    var gameOver = function(player, board) {
      if (!GameBoard.boardFilled()) {
         DisplayController.showMessage("It's a draw");
      } else if (_hasRowWithWinner(player, board) ||
                 _hasColumnWithWinner(player, board) ||
                 _hasDiagonalWithWinner(player, board)) {
        alert("Game over");
      } else {
        DisplayController.showMessage("Your turn  " + currPlayer.name);
      }

    }

    var _setUpBoardEvents = function() {

      gridItems.forEach(function(item){
        item.addEventListener('click',function(e) {
          e.preventDefault();
          if (item.textContent == "") {
            DisplayController.fillSpot(item,currPlayer.mark);
            gameOver(currPlayer,GameBoard.getBoard());
            currPlayer = changeCurrentPlayer();
          } else {
            return;
          }
        });
      });
    }

    var _loadGame = function() {

      players = [PlayerFactory("Player X", "X"),
                 PlayerFactory("Player 0","0")];
      GameBoard.initializeBoard();

      DisplayController.resetGameObjects();

      optPlayerX.addEventListener('click',function(e) {
        e.preventDefault();
        DisplayController.changeBtnPlayerStatus(optPlayerX, optPlayer0);
        DisplayController.enableStartButton(btnStartGame,[optPlayer0, optPlayerX]);
        _choosePlayers([optPlayerX, optPlayer0]);
      });

      optPlayer0.addEventListener('click',function(e) {
        e.preventDefault();
        DisplayController.changeBtnPlayerStatus(optPlayer0, optPlayerX);
        DisplayController.enableStartButton(btnStartGame,
                                                [optPlayer0, optPlayerX]);
        _choosePlayers([optPlayerX, optPlayer0]);

      });

      btnCancelGame.addEventListener('click', function(e) {
        e.preventDefault();
        DisplayController.resetGameObjects();
        _setUpBoardEvents();
      });

      btnStartGame.addEventListener('click',function(e) {
        e.preventDefault();
        DisplayController.showBoard();
        DisplayController.showMessage("Your turn  " + currPlayer.name);
        _setUpBoardEvents();
      });

    }

    var _hasRowWithWinner = function(player, board) {
      let result = false;
      for (var i = 0; (i < 3 && result == false); i++) {
        result = board[i].every(function(value){
          return value === player.mark;
        });
      }
      return result;
    }

    var _hasColumnWithWinner = function(player, board) {

      let result = false;
      for(var col = 0; (col < 3 && result == false); col++) {
        let columns = [];
        for (var row = 0; (row < 3 && result == false); row++) {
          columns.push(board[row][col]);
        }
        result = columns.every(function(value){
          return value == player.mark;
        });
      }
      return result;
    }

    var _hasDiagonalWithWinner = function(player, board) {
      let result = [board[0][0],board[1][1],board[2][2]].every(function(value){
            return value === player.mark;
          });

      if (result == false) {
          result = [board[2][0],board[1][1],board[2][0]].every(function(value){
            return value === player.mark;
          });
      }
      return result;
    }

    var startGame = function() {
      _loadGame();
    }

    return {
      startGame
    }

})();


Game.startGame();
