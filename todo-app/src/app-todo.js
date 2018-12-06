import {ViewElements} from "../src/view-elements.js";

const App = (() => {

  const createTodo = (name, todoItemView, todoItemContainer) => {
    let todoItem      = ViewElements.newElement(todoItemView);
    let spanTodoName  = ViewElements.newElement("span");
    let spanDel       = ViewElements.newElement("span");
    let todosList     = ViewElements.getElement(todoItemContainer);
    let todoId        = generateTodoId(todosList);

    ViewElements.setContent(spanTodoName,name);
    ViewElements.setContent(spanDel, "x");
    ViewElements.addClass(spanDel,["bt-remove"]);
    ViewElements.addAttribute(spanDel,{"removeId": todoId});

    ViewElements.addAttribute(todoItem, {"id": todoId});
    todoItem.appendChild(spanTodoName);
    todoItem.appendChild(spanDel);

    todosList.appendChild(todoItem);
  }

  const generateTodoId = (todosList) => {
    return todosList.children.length + 1;
  }

  return { createTodo }

})();

export { App };
