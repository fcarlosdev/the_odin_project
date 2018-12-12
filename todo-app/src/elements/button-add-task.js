import {ViewElements} from "./view-elements.js";
import {TaskForm} from "./task-form.js";

const ButtonAddTask = (() => {

  const create = () => {
    return attachNewTodoTaskEvent(
              ViewElements.addClass(
                ViewElements.newElement("div","Add Task"),["add-task"]
              )
          );
  }

  const attachNewTodoTaskEvent = (element) => {
    ViewElements.attachEvent(element, "click", e => {
      TaskForm.createAddTaskForm();            
    });
    return element;
  }

  return { create }

})();

export { ButtonAddTask }
