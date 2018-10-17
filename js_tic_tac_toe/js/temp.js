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

  const checkWinMove = () => {

    let result = board.slice(0,3).every(function(value) {
      return value === currentPlayer.mark;
    });
    if (result == false) {
      result = board.slice(3,6).every(function(value) {
        return value === currentPlayer.mark;
      });
    }

    if (result == false) {
      result = board.slice(6,9).every(function(value) {
        return value === currentPlayer.mark;
      });
    }

    return result;

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

   DisplayController.registerObjectEvent(cell,"click",function() {
     GameBoard.fillSpot(DisplayController.fillCell(cell,currentPlayer.mark));
     DisplayController.changeCurrentPlayer(currentPlayer);
     if (GameBoard.checkWinMove()) {
       alert("You won!!!");
     }
   })
 });
