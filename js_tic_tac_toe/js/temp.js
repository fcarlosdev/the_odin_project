const DisplayController = (() => {

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

  return { changeObjectVisibility, registerObjectEvent}

})();

DisplayController.changeObjectVisibility("#board", "none");
DisplayController.registerObjectEvent("#btn-playerx","click",function(){
  DisplayController.changeObjectVisibility("#board", "flex");
  DisplayController.changeObjectVisibility(".opt-players", "none");
});
