import {TodoElement} from "./todo-element.js";

const App = (() => {

  const newTodoViewElement = (todoName, tagType, todoListTag) => {
    TodoElement.generateTodo(todoName,tagType, todoListTag);
  }

  const newTodoTaskElement = (todo, task) => {
    let taskList = ViewElements.getElement("#tasks");
    let taskLine = ViewElements.createElement("li");
    ViewElements.addClass(taskLine,["task-title"]);

    let taskNameWrapper = ViewElements.createElement("div");
    ViewElements.addAttributes(taskNameWrapper, {"id": generteTaskId(taskList)})

    let taskName = ViewElements.createElement("h2",task.getName());

    let taskDetailsLink = ViewElements.createElement("a","Show details");
    taskNameWrapper.appendChild();
  }

  const generteTaskId = (tasklList) => {
    taskList.children.length + 1;
  }

  return { newTodoViewElement, newTodoTaskElement }

})();

export { App };
