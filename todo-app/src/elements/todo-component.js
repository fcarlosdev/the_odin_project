import {ViewElements} from "./view-elements.js";
import {ButtonAddTask} from "./button-add-task.js";
import {AuxiliarLib} from "../util/auxiliar-lib.js";

const TodoComponent = (() => {

  const create = (id, name) => {

    return attachSelectTodoEvent(
              ViewElements.addAttributes(
                ViewElements.addClass(
                  ViewElements.newElement("li",name), ["task-title"]), id
              )
           );
  }

  const attachSelectTodoEvent = (todoElement) => {

    let todoTitleBar = ViewElements.getElement(".todo-title");

    ViewElements.attachEvent(todoElement, "click", e => {
        ViewElements.applyStyles(todoTitleBar, {"display:":"flex"});
        ViewElements.addChildrenTo(todoTitleBar,[
          createWrapperTitleArea(todoElement),
          createButtonAddTask()
        ]);
    });

    return todoElement;
  }

  const createButtonAddTask = () => {
    return ButtonAddTask.create();
  }

  const createWrapperTitleArea = (todoElement) => {

    let wrapperTitleArea = ViewElements.addClass(
                            ViewElements.newElement("div"),["todo-actions"]
                           );

    ViewElements.addChildrenTo(
      wrapperTitleArea, [
        ViewElements.newElement("h1",todoElement.textContent),
        createRemoveTodoElement(todoElement)
      ]
    );

    return wrapperTitleArea;
  }


  const createRemoveTodoElement = (todoElement) => {

    let removeTodo = ViewElements.addClass(
                       ViewElements.newElement("div","Remove"), ["bt-remove"]
                     );

    ViewElements.attachEvent(removeTodo, "click", e => {
      AuxiliarLib.removeChildNodesFrom(todoElement);
      AuxiliarLib.removeChildNodesFrom(ViewElements.getElement(".todo-container"));
      ViewElements.applyStyles(todoElement, {"display:":"none"});
    });

    return removeTodo;

  }

  return { create }

})();

export {TodoComponent}
