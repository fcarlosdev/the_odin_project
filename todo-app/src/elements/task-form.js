import newTaskForm from "../partials/new-task-form.html";
import {ViewElements} from "./view-elements.js";
import {TaskElement} from "./task-element.js";

const TaskForm = (() => {

  let form;

  const show = () => {

    form = ViewElements.applyStyles(
            ViewElements.setContent(
              ViewElements.getElement('#myModal'), newTaskForm
            ), {"display:": "block"}
          );

      attachCloseEvent();
      attachSaveEvent();

      return form;
  }

  const attachCloseEvent = () => {
    [ViewElements.getElement(".close"),
     ViewElements.getElement("#modal-cancel-button")].forEach(function(element){
       ViewElements.attachEvent(element,"click", e => {
         form.style.display = "none";
       })
     });
  }

  const attachSaveEvent = () => {
    let task;
    ViewElements.attachEvent(ViewElements.getElement("#modal-save-button"),"click", e => {
      TaskElement.newTask(
        { title: getFieldValue("#task-title"),
          description: getFieldValue("#task-desc"),
          dueDate: getFieldValue("#task-due-date"),
          priority: getFieldValue("#task-priority") }
      );
      form.style.display = "none";
    });
  }

  const getFieldValue = (fieldId) => {
    return form.querySelector(fieldId).value;
  }

  return { show };

})();

export { TaskForm }
