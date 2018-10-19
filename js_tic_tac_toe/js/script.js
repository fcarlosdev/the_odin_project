var currentPlayer = null;
var playerSelected = null;
var opponentPlayer = null;

const playerFactory = (name, mark) => {
  return { name, mark };
};

const GameBoard = ( () => {

  let board = [];

  const initializeBoard = () => {
    return board = [];
  }

  const fillSpot = (cell) => {
    board.push(cell);
  }

  const _getCells = (cellsFilter) => {
    return board.filter(cell => (cellsFilter.includes(cell.id)));
  }

  const _hasWinMove = (row) => {
    return row.every(function(spot){
        return (spot.value === currentPlayer.mark);
    });
  }

  const checkWinMove = () => {

    let foundWinMove = false;
    let winMoves = [
      _getCells(["#cell-one"  , "#cell-two"  , "#cell-three"]),
      _getCells(["#cell-four" , "#cell-five" , "#cell-six"  ]),
      _getCells(["#cell-seven", "#cell-eight", "#cell-nine" ]),
      _getCells(["#cell-one"  , "#cell-four" , "#cell-seven"]),
      _getCells(["#cell-two"  , "#cell-five" , "#cell-eight"]),
      _getCells(["#cell-three", "#cell-six"  , "#cell-nine" ]),
      _getCells(["#cell-one", "#cell-five"  , "#cell-nine" ]),
      _getCells(["#cell-three", "#cell-five"  , "#cell-seven" ])
    ];

    for (let index = 0; (index < winMoves.length && !foundWinMove); index++) {
      foundWinMove = (winMoves[index].length == 3) ? _hasWinMove(winMoves[index])
                                                   : foundWinMove;
    }
    return foundWinMove;
  }

  const checkDrawGame = () => {
    return board.every(function(spot) {
      return (board.length == 9 && spot.value != "");
    });
  }

  return { initializeBoard, fillSpot, checkWinMove, checkDrawGame }

})();


const DisplayController = (() => {

  var players = [playerFactory("Player X", "X"), playerFactory("Player 0", "0")];

  const changeObjectVisibility = (object, visibility) => {
    document.querySelector(object).style.display = visibility;
  }

  const registerObjectEvent = (object, eventName, functionBody) => {
    if (object != null) {
      document.querySelector(object).addEventListener(eventName, function(e){
        functionBody();
      });
    }
  }

  const fillCell = (spot, content) => {
    let cell = {id: spot, value: content};
    document.querySelector(cell.id).textContent = cell.value;
    return cell;
  }

  const selectPlayer =(type) => {
    playerSelected = (type.toUpperCase() == "X") ? players[0] : players[1];
    currentPlayer = playerSelected;
  }

  const changeCurrentPlayer = (player) => {
    currentPlayer = (currentPlayer.mark == "X") ? players[1] : players[0];
  }

  const clearGrid = () => {
    document.querySelectorAll(".grid-item").forEach(function(cell){
      DisplayController.fillCell("#" + cell.getAttribute("id"),"");
    })
  }

  const showMessage = (text) => {
    document.querySelector("#message").textContent = text;
  }

  const changeCellClick = (status) => {
    document.querySelectorAll(".grid-item").forEach(function(cell) {
      cell.style.pointerEvents = status;
    });
  }

  return { changeObjectVisibility, registerObjectEvent, fillCell,
           changeCurrentPlayer, selectPlayer, clearGrid, showMessage,
           changeCellClick }

})();

const Game = (() => {

  const _addPlayerChoiceEvents = () => {

    ["#btn-playerx","#btn-player0"].forEach(function(btn){
      DisplayController.registerObjectEvent(btn,"click",function(){
        DisplayController.selectPlayer(btn[11]);
        DisplayController.changeObjectVisibility("#board", "flex");
        DisplayController.changeObjectVisibility(".opt-players", "none");
        DisplayController.changeObjectVisibility("#message-game", "flex");
        DisplayController.showMessage("Your turn " + currentPlayer.name);
      })
    });

  }

  const _addBoardCellsEvents = () =>  {
    document.querySelectorAll(".grid-item").forEach(function(cell){
      let idCell = ("#"+cell.getAttribute("id"));
      DisplayController.registerObjectEvent(idCell,"click",function(e) {
       GameBoard.fillSpot(DisplayController.fillCell(idCell,currentPlayer.mark));
       if (GameBoard.checkWinMove()) {
         DisplayController.showMessage(currentPlayer.name + " won the game!!!");
         DisplayController.changeCellClick("none");
         return;
       } else if (GameBoard.checkDrawGame()) {
         DisplayController.showMessage("It's a draw");
         DisplayController.changeCellClick("none");
         return;
       }
       DisplayController.changeCurrentPlayer(currentPlayer);
       DisplayController.showMessage("Your turn " + currentPlayer.name);
     });
    });
  }

  const _addGameButtonsControllersEvent = () => {

    DisplayController.registerObjectEvent("#btn-nw-game","click",function(e){
      GameBoard.initializeBoard();
      DisplayController.clearGrid();
      DisplayController.changeCellClick("");
      DisplayController.changeObjectVisibility("#board", "none");
      DisplayController.changeObjectVisibility(".opt-players", "flex");
      DisplayController.changeObjectVisibility("#message-game", "none");
    });

    DisplayController.registerObjectEvent("#btn-reset-game","click",function(e){
      GameBoard.initializeBoard();
      DisplayController.clearGrid();
      DisplayController.changeCellClick("");
      DisplayController.selectPlayer(playerSelected.mark);
      DisplayController.showMessage("Your turn " + playerSelected.name);
    });

  }

  const startGame = () => {
    _addPlayerChoiceEvents();
    _addBoardCellsEvents();
    _addGameButtonsControllersEvent()
    DisplayController.changeObjectVisibility("#board", "none");
    DisplayController.changeObjectVisibility("#message-game", "none");
  }

  return {startGame}

})();

Game.startGame();
