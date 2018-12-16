import {DomElement} from "./dom-element.js";

const ListOfTask = (() => {
  
  const showListTo = (todo) => {
    return DomElement.applyStyles(
             DomElement.addClass(
               DomElement.newElement("div"),["task-details"]
             ),{"display:":"none"}
           );
  }
  
  return { showListTo }
  
})();

export {ListOfTask}