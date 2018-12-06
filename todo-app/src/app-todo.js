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

    ViewElements.addAttributes(todoItem, {"id": todoId});
    todoItem.appendChild(spanTodoName);
    todoItem.appendChild(spanDel);

    ViewElements.attachEvent(todoItem, "click", e => {
      if (e.target.tagName === "LI" || e.target.textContent != "x") {
        let todoHeader   = ViewElements.getElement(".todo-title");
        let todoActions  = ViewElements.newElement("div");
        let todoTitle    = ViewElements.newElement("h1");
        let removeTodo   = ViewElements.newElement("div");
        let btAddTask    = ViewElements.newElement("div");

        ViewElements.applyStyles(todoHeader, {"display:":"flex"});

        todoTitle.textContent = name;

        ViewElements.addClass(btAddTask,["add-task"]);
        btAddTask.textContent = "Add Task";

        ViewElements.addClass(removeTodo, ["bt-remove"]);
        removeTodo.textContent = "Remove";

        ViewElements.attachEvent(removeTodo, "click", e => {
          while (todoHeader.hasChildNodes()) {
            todoHeader.removeChild(todoHeader.lastChild);
          }
          ViewElements.applyStyles(todoHeader, {"display:":"none"});
        })

        ViewElements.addClass(todoActions,["todo-actions"]);
        todoActions.appendChild(todoTitle);
        todoActions.appendChild(removeTodo);

        todoHeader.appendChild(todoActions);
        todoHeader.appendChild(btAddTask);

        ViewElements.getElement(".todo-container").appendChild(todoHeader);
      }
    });

    ViewElements.attachEvent(spanDel, "click", e => {
      todosList.removeChild(todoItem);
    });

    todosList.appendChild(todoItem);
  }

  const generateTodoId = (todosList) => {
    return todosList.children.length + 1;
  }



  return { createTodo }

})();

export { App };
