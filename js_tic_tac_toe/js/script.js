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
var gridItems = document.querySelectorAll('.grid-item');


var GameBoard = (function() {

  var board = [["","",""],["","",""],["","",""]];

  var fillSpace = function(mark, row, col) {
    board[row][col] = mark;
  }

  var emptySpace = function(row, col) {
    return (board[row][col] == "");
  }

  var boardFilled = function() {

    let hasEmptySpace = false;

    for (var row = 0; row < board.length; row++) {
      if (board[row].indexOf("")) {
        hasEmptySpace = true;
        break;
      }
    }
    return hasEmptySpace;
  }

  return {
    fillSpace, boardFilled
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

  var resetGameObjects = function() {
    board.style.display                = "none";
    ctnBts.style.display               = "none";
    btnStartGame.disabled              =  true;
    menuPlayers.style.display          = "block";
    btnNewGame.style.display           = "none";
    btnStartGame.style.backgroundColor = "#ccc";
    changeBtnPlayerStatus(optPlayerX, optPlayer0, "unSelectAll");
  }

  var showBoard = function() {
    board.style.display='grid';
    menuPlayers.style.display='none';
    ctnBts.style.display="flex";
  }


  return {
    changeBtnPlayerStatus, enableStartButton, btnIsSelected, resetGameObjects,
    showBoard
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

    var _setUpBoardEvents = function() {

      gridItems.forEach(function(item){
        item.addEventListener('click',function(e) {
          e.preventDefault();
          this.textContent = currPlayer.mark;
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
          currPlayer = (currPlayer === players[0]) ? players[1] : players[0];
        });
      });
    }

    var _loadGame = function() {

      players = [PlayerFactory("Player X", "X"),
                 PlayerFactory("Player 0","0")];

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
      });

      btnStartGame.addEventListener('click',function(e) {
        e.preventDefault();
        DisplayController.showBoard();
        _setUpBoardEvents();

        // gridItems.forEach(function(item){
        //   item.addEventListener('click',function(e) {
        //     e.preventDefault();
        //     this.textContent = currPlayer.mark;
        //     if (item.getAttribute("id") === "cell-one") {
        //       GameBoard.fillSpace(this.textContent, 0, 0);
        //     } else if (item.getAttribute("id") === "cell-two") {
        //       GameBoard.fillSpace(this.textContent, 0, 1);
        //     } else if (item.getAttribute("id") === "cell-three") {
        //       GameBoard.fillSpace(this.textContent, 0, 2);
        //     } else if (item.getAttribute("id") === "cell-four") {
        //       GameBoard.fillSpace(this.textContent, 1, 0);
        //     } else if (item.getAttribute("id") === "cell-five") {
        //       GameBoard.fillSpace(this.textContent, 1, 1);
        //     } else if (item.getAttribute("id") === "cell-six") {
        //       GameBoard.fillSpace(this.textContent, 1, 2);
        //     } else if (item.getAttribute("id") === "cell-seven") {
        //       GameBoard.fillSpace(this.textContent, 2, 0);
        //     } else if (item.getAttribute("id") === "cell-eight") {
        //       GameBoard.fillSpace(this.textContent, 2, 1);
        //     } else if (item.getAttribute("id") === "cell-nine") {
        //       GameBoard.fillSpace(this.textContent, 2, 2);
        //     }
        //     currPlayer = (currPlayer === players[0]) ? players[1] : players[0];
        //   });
        // });

      });

    }


    var startGame = function() {
      _loadGame();
    }

    return {
      startGame
    }

})();


Game.startGame();


// document.querySelector('#bt-start-game').addEventListener('click',function() {
//     document.querySelector('.board-container').style.display='grid';
//     document.querySelector('.tictactoe').style.display='none';
//     document.querySelector('.footer-board').style.display="flex";
// })
