import {ViewElements} from "./view-elements.js";

const TodoElement = (() => {

  const generateTodo = (name, todoItemTag, todoListTag) => {
    let todoItem = ViewElements.newElement(todoItemTag);
    let todoList = ViewElements.getElement(todoListTag);
    ViewElements.addAttributes(todoItem, {"id": generateTodoId(todoList)});
    setTodoIdentification(name,todoItem, todoList);
    attachShowTodoDetaisEvent(todoItem);
    todoList.appendChild(todoItem);
  }

  const setTodoIdentification = (name,todoItem, todoList) => {

    let todoName  = ViewElements.newElement("span");
    let btRemove  = ViewElements.newElement("span");

    ViewElements.setContent(todoName,name);
    ViewElements.setContent(btRemove, "x");
    ViewElements.addClass(btRemove,["bt-remove"]);

    ViewElements.attachEvent(btRemove, "click", e => {
      todoList.removeChild(todoItem);
    });

    todoItem.appendChild(todoName);
    todoItem.appendChild(btRemove);
  }

  const attachShowTodoDetaisEvent = (todoItem) => {

    ViewElements.attachEvent(todoItem, "click", e => {

      if (e.target.tagName === "LI" || e.target.textContent != "x") {

        todoHeader = ViewElements.getElement(".todo-title");
        ViewElements.applyStyles(todoHeader, {"display:":"flex"});
        clearElementChildNodes(todoHeader);

        let btAddTask = ViewElements.newElement("div","Add Task");
        ViewElements.addClass(btAddTask,["add-task"]);

        let removeTodo = ViewElements.newElement("div","Remove");
        ViewElements.addClass(removeTodo, ["bt-remove"]);
        ViewElements.attachEvent(removeTodo, "click", e => {
          clearElementChildNodes(todoHeader);
          ViewElements.applyStyles(todoHeader, {"display:":"none"});
        })

        let todoActions = ViewElements.newElement("div");
        ViewElements.addClass(todoActions,["todo-actions"]);

        todoActions.appendChild(ViewElements.newElement("h1",name));
        todoActions.appendChild(removeTodo);

        todoHeader.appendChild(todoActions);
        todoHeader.appendChild(btAddTask);

        ViewElements.getElement(".todo-container").appendChild(todoHeader);
      }
    });
  }

  const clearElementChildNodes = (element) => {
    while(element.hasChildNodes()) {
      element.removeChild(element.lastChild);
    }
  }

  const generateTodoId = (todosList) => {
    return todosList.children.length + 1;
  }

  return { generateTodo }

})();

export { TodoElement }
