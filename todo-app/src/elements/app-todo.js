import {TodoElement} from "./todo-element.js";

const App = (() => {

  const newTodoElement = (elementType, content) => {
    return TodoElement.createTodoElement(elementType, content);
  }

  const newTodoTaskElement = (todo, task) => {
    let taskList = DomElement.getElement("#tasks");
    let taskLine = DomElement.createElement("li");
    DomElement.addClass(taskLine,["task-title"]);

    let taskNameWrapper = DomElement.createElement("div");
    DomElement.addAttributes(taskNameWrapper, {"id": generteTaskId(taskList)})

    let taskName = DomElement.createElement("h2",task.getName());

    let taskDetailsLink = DomElement.createElement("a","Show details");
    taskNameWrapper.appendChild();
  }

  const generteTaskId = (tasklList) => {
    taskList.children.length + 1;
  }

  return { newTodoTaskElement, newTodoElement }

})();

export { App };
