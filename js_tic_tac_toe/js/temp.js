var currentPlayer = null;
var playerSelected = null;
var opponentPlayer = null;

const playerFactory = (name, mark) => {
  return { name, mark };
};

const GameBoard = ( () => {

  let board = [];

  const getBoard = () => {
    return board;
  }

  const fillSpot = (cell) => {
    board.push(cell);
  }

  const _getCells = (cellsFilter) => {
    return board.filter(cell => (cellsFilter.includes(cell.id)));
  }

  const _rowHasWinMove = (row) => {
    return row.every(function(spot){
        return (spot.value === currentPlayer.mark);
    });
  }

  const checkWinMove = () => {

    let foundWinMove = false;

    if (board.length >=3 ) {

      let winMoves = [
        _getCells(["#cell-one"  , "#cell-two"  , "#cell-three"]),
        _getCells(["#cell-four" , "#cell-five" , "#cell-six"  ]),
        _getCells(["#cell-seven", "#cell-eight", "#cell-nine" ]),
        _getCells(["#cell-one"  , "#cell-four" , "#cell-seven"]),
        _getCells(["#cell-two"  , "#cell-five" , "#cell-eight"]),
        _getCells(["#cell-three", "#cell-six"  , "#cell-nine" ])
      ];

      for (let index = 0; (index < winMoves.length && !foundWinMove); index++) {
        if (winMoves[index].length == 3) {
          foundWinMove = _rowHasWinMove(winMoves[index]);
        }
      }

    }
    return foundWinMove;

  }

  return { getBoard, fillSpot, checkWinMove }

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
    playerSelected = (type == "x") ? players[0] : players[1];
    currentPlayer = playerSelected;
  }

  const changeCurrentPlayer = (player) => {
    currentPlayer = (currentPlayer.mark == "X") ? players[1] : players[0];
  }

  return { changeObjectVisibility, registerObjectEvent, fillCell,
           changeCurrentPlayer, selectPlayer }

})();


DisplayController.changeObjectVisibility("#board", "none");

["#btn-playerx","#btn-player0"].forEach(function(btn){
  DisplayController.registerObjectEvent(btn,"click",function(){
    DisplayController.selectPlayer(btn[11]);
    DisplayController.changeObjectVisibility("#board", "flex");
    DisplayController.changeObjectVisibility(".opt-players", "none");
  })
});

["#cell-one","#cell-two","#cell-three","#cell-four","#cell-five","#cell-six",
 "#cell-seven","#cell-eight","#cell-nine"].forEach(function(cell){

   DisplayController.registerObjectEvent(cell,"click",function(e) {
     GameBoard.fillSpot(DisplayController.fillCell(cell,currentPlayer.mark));
     if (GameBoard.checkWinMove()) {
       alert("You won!!!");
     }
     DisplayController.changeCurrentPlayer(currentPlayer);
   })
 });
