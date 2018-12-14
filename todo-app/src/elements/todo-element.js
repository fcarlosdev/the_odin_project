import {ViewElements} from "./view-elements.js";
// import {TaskController} from "../controllers/taskController.js";
import {TaskForm} from "./task-form.js";

const TodoElement = (() => {

  const generateTodo = (name, todoItemTag, todoListTag) => {
    let todoItem = ViewElements.newElement(todoItemTag, name);
    let todoList = ViewElements.getElement(todoListTag);
    ViewElements.addAttributes(todoItem, {"id": generateTodoId(todoList)});
    attachSelectTodoEvent(todoItem,name);
    todoList.appendChild(todoItem);
  }

  const attachSelectTodoEvent = (todoItem, content) => {

    ViewElements.attachEvent(todoItem, "click", e => {

      if (e.target.tagName === "LI" || e.target.textContent != "x") {

        let todoHeader = ViewElements.getElement(".todo-title");
        ViewElements.applyStyles(todoHeader, {"display:":"flex"});
        clearElementChildNodes(todoHeader);

        let btAddTask = ViewElements.newElement("div","Add Task");
        ViewElements.addClass(btAddTask,["add-task"]);
        attachNewTodoTaskEvent(btAddTask);

        let removeTodo = ViewElements.newElement("div","Remove");
        ViewElements.addClass(removeTodo, ["bt-remove"]);
        ViewElements.attachEvent(removeTodo, "click", e => {
          clearElementChildNodes(todoHeader);
          clearElementChildNodes(ViewElements.getElement("#tasks"));
          ViewElements.applyStyles(todoHeader, {"display:":"none"});
        })

        let todoActions = ViewElements.newElement("div");
        ViewElements.addClass(todoActions,["todo-actions"]);

        todoActions.appendChild(ViewElements.newElement("h1",content));
        todoActions.appendChild(removeTodo);

        todoHeader.appendChild(todoActions);
        todoHeader.appendChild(btAddTask);
      }
    });
  }

  const attachNewTodoTaskEvent = (btAddTask) => {
    ViewElements.attachEvent(btAddTask, "click", e => {
      TaskForm.show();
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
