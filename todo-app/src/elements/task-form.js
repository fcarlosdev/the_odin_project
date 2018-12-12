import newTaskForm from "../partials/new-task-form.html";
import {ViewElements} from "./view-elements.js";

const TaskForm = (() => {

  const createAddTaskForm = () => {
    return attachCloseEventTo(
             attacheDisplayEventTo(
               ViewElements.setContent(
                 ViewElements.getElement('#myModal'),newTaskForm
               )
             )
           );
  }

  const attacheDisplayEventTo = (form) => {
    return ViewElements.applyStyles(form, {"display:":"block"});
  }

  const attachCloseEventTo = (form) => {
    console.log(form);
    ViewElements.attachEvent(ViewElements.getElement(".close"),"click", e => {
      ViewElements.applyStyles(form,{"display:" :"none"});
    });
    return form;
  }

  return { createAddTaskForm }

})();

export {TaskForm}
