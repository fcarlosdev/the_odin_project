import {ViewElements} from "./view-elements.js";
import {AuxiliarLib} from "../util/auxiliar-lib.js";
import newTaskForm from "../partials/new-task-form.html";
import {Task} from "../models/task.js";

const TodoElement = (() => {

  const createTodoElement = (name) => {
    let todoElement = ViewElements.newElement("li", name);
        ViewElements.addAttributes(todoElement,{"id": generateId()});
        attachSelectTodoEvent(todoElement);
    return todoElement;

  }

  const attachSelectTodoEvent = (todoItem, content) => {

    ViewElements.attachEvent(todoItem, "click", e => {

      let todoHeader = ViewElements.getElement(".todo-title");
      ViewElements.applyStyles(todoHeader, {"display:":"flex"});
      AuxiliarLib.removeChildNodesFrom(todoHeader);

      let btAddTask = ViewElements.newElement("div","Add Task");
      ViewElements.addClass(btAddTask,["add-task"]);
      attachNewTodoTaskEvent(btAddTask, todoItem);

      let removeTodo = ViewElements.newElement("div","Remove");
      ViewElements.addClass(removeTodo, ["bt-remove"]);
      ViewElements.attachEvent(removeTodo, "click", e => {
        AuxiliarLib.removeChildNodesFrom(todoHeader);
        AuxiliarLib.removeChildNodesFrom(todoItem);
        ViewElements.applyStyles(todoHeader, {"display:":"none"});
      })

      let todoActions = ViewElements.newElement("div");
      ViewElements.addClass(todoActions,["todo-actions"]);

      todoActions.appendChild(ViewElements.newElement("h1",todoItem.textContent));
      todoActions.appendChild(removeTodo);

      todoHeader.appendChild(todoActions);
      todoHeader.appendChild(btAddTask);
    });

  }

  const attachNewTodoTaskEvent = (btAddTask, todoItem) => {
    ViewElements.attachEvent(btAddTask, "click", e => {
      let form = showFormNewTask();
      attachCloseEventTo(form);
      attachSaveEventTo(form,todoItem);
    });
  }

  const showFormNewTask = () => {
    return ViewElements.applyStyles(
              ViewElements.setContent(
                ViewElements.getElement('#myModal'),newTaskForm
              ),{"display:": "block"}
           );
  }

  const attachCloseEventTo = (form) => {
    [form.querySelector(".close"),
     form.querySelector("#modal-cancel-button")].forEach(function(element){
       ViewElements.attachEvent(element,"click", e => {
         form.style.display = "none";
       })
     });
  }

  const attachSaveEventTo = (form, todoItem) => {

    ViewElements.attachEvent(form.querySelector("#modal-save-button"),"click", e => {

      let task = createTaskWith(form);
      let wrapperTitle = ViewElements.newElement("div");
                         ViewElements.addClass(wrapperTitle,["task-title"]);
                         ViewElements.addAttributes(wrapperTitle,{"id:":generateId()});
                         ViewElements.addChildrenTo(wrapperTitle, [
                           ViewElements.newElement("h2",todoItem.textContent)
                         ])

      let taskLine = ViewElements.newElement("li");
      ViewElements.addChildrenTo(taskLine,[wrapperTitle]);

      let tasks = ViewElements.getElement("#tasks");
      ViewElements.addChildrenTo(tasks,[taskLine]);

      form.style.display = "none";
    });

  }

  const createTaskWith = (dataOfForm) => {
    return Task(dataOfForm.querySelector("#task-title").value,
                dataOfForm.querySelector("#task-desc").value,
                dataOfForm.querySelector("#task-due-date").value,
                dataOfForm.querySelector("#task-priority").value);
  }


  const generateId = () => {
    return ViewElements.getElement("#tasks").children.length + 1;
  }

  return { createTodoElement }

})();

export { TodoElement }
