var optPlayerX = document.querySelector('#px');
var optPlayer0 = document.querySelector('#p0');

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

var DisplayController = (function () {

  const _btnIsSelected = function(btn) {
    return (btn.getAttribute('selected') != null)
  }

  const _deselectButton = function(btn) {
    btn.style.backgroundColor='#23c0c6';
    btn.removeAttribute('selected');
  }

  const _selectButton = function(btn) {
    btn.style.backgroundColor='#345678';
    btn.setAttribute('selected', "true");
  }

  const changeBtnColor = function(btnClicked, btnNotClicked) {
    (_btnIsSelected(btnClicked)) ? _deselectButton(btnClicked)
                                 : _selectButton(btnClicked);

    if (_btnIsSelected(btnNotClicked) ) {
      _deselectButton(btnNotClicked);
    }

  }

  const changeStartGameButton = function(btnStartGame,playersBtnChoose) {

    if (_btnIsSelected(playersBtnChoose[0]) || _btnIsSelected(playersBtnChoose[1]) ) {
      btnStartGame.disabled=false;
      btnStartGame.style.backgroundColor = "#216b4a";
    } else {
      btnStartGame.disabled= true;
      btnStartGame.style.backgroundColor = "#ccc";
    }

  }

  return { changeBtnColor, changeStartGameButton }

})();

var Game = (function () {

    var players = [PlayerFactory("Player X", "X"),
                   PlayerFactory("Player 0","0")];

    let choosedPlayer = null;
    let menuPlayers = document.querySelector('.tictactoe');
    let board  = document.querySelector('.board-container');
    let ctnBts = document.querySelector('.container-buttons');
    let btnStartGame = document.querySelector('#bt-start-game');

    var _loadGame = function() {
      board.style.display="none";
      ctnBts.style.display="none";
      btnStartGame.disabled= true;
      btnStartGame.style.backgroundColor = "#ccc";

      optPlayerX.addEventListener('click',function(e) {
        e.preventDefault();
        DisplayController.changeBtnColor(optPlayerX, optPlayer0);
        DisplayController.changeStartGameButton(btnStartGame,
                                                [optPlayer0, optPlayerX]);
      });

      optPlayer0.addEventListener('click',function(e) {
        e.preventDefault();
        DisplayController.changeBtnColor(optPlayer0, optPlayerX);
        DisplayController.changeStartGameButton(btnStartGame,
                                                [optPlayer0, optPlayerX]);
      });


    }

    // const _chooseAPlayer = function() {
    //   console.log("Choose a player");
    // }

    var startGame = function() {

      _loadGame();
      // _chooseAPlayer();

      btnStartGame.addEventListener('click',function() {
          board.style.display='grid';
          menuPlayers.style.display='none';
          ctnBts.style.display="flex";
      })
    }

    return {
      startGame
    }

})();


Game.startGame();



// var px = document.querySelector('#px');
// var p0 = document.querySelector('#p0');

// px.addEventListener('click',function(e) {
//   e.preventDefault();
//
//   if (p0.getAttribute('selected') !== null) {
//     p0.style.backgroundColor='#23c0c6';
//     p0.removeAttribute('selected');
//   }
//
//   if (px.getAttribute('selected') == null) {
//     px.style.backgroundColor='#345678';
//     px.setAttribute('selected', "true");
//   } else {
//     px.style.backgroundColor='#23c0c6';
//     px.removeAttribute('selected');
//   }
// });
//
// p0.addEventListener('click',function(e) {
//   e.preventDefault();
//
//   if (px.getAttribute('selected') !== null) {
//     px.style.backgroundColor='#23c0c6';
//     px.removeAttribute('selected');
//   }
//
//   if (p0.getAttribute('selected') == null) {
//     p0.style.backgroundColor='#345678';
//     p0.setAttribute('selected', "true");
//   } else {
//     p0.style.backgroundColor='#23c0c6';
//     p0.removeAttribute('selected');
//   }
// });
//
// document.querySelector('.board-container').style.display="none";
// document.querySelector('.footer-board').style.display="none";
//
// document.querySelector('#bt-start-game').addEventListener('click',function() {
//     document.querySelector('.board-container').style.display='grid';
//     document.querySelector('.tictactoe').style.display='none';
//     document.querySelector('.footer-board').style.display="flex";
// })


// let gridItems = document.querySelectorAll('.grid-item');
//
// gridItems.forEach(function(item){
//
//   item.addEventListener('click',function(e) {
//     e.preventDefault();
//     this.textContent = (this.textContent == "X") ? "0" : "X";
//
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
//   });
//
// })
