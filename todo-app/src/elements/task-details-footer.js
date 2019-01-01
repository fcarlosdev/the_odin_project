import {AuxiliarLib} from "../util/auxiliar-lib.js";

const TaskDetailsFooter = (() => {

  const create = (taskId) => {

    let labelDone = document.createElement("label");
    labelDone.setAttribute("for",taskId);
    labelDone.textContent = "Done";

    let checkboxDone = document.createElement("input");
    checkboxDone.setAttribute("type","checkbox");
    checkboxDone.setAttribute("id",taskId);
    checkboxDone.setAttribute("value","done");
    taskDone(checkboxDone,taskId);

    let taskDoneWrapper = document.createElement("div");
    taskDoneWrapper.classList.add("task-done");
    taskDoneWrapper.appendChild(checkboxDone);
    taskDoneWrapper.appendChild(labelDone);

    let removeTextElem = document.createElement("span");
    removeTextElem.textContent = "Remove";
    removeTask(removeTextElem, taskId);

    let removeTaskWrapper = document.createElement("div");
    removeTaskWrapper.classList.add("bt-remove");
    removeTaskWrapper.appendChild(removeTextElem);

    let taskDetailsFooterWrapper = document.createElement("div");
    taskDetailsFooterWrapper.classList.add("task-details-footer");
    taskDetailsFooterWrapper.appendChild(taskDoneWrapper);
    taskDetailsFooterWrapper.appendChild(removeTaskWrapper);

    return taskDetailsFooterWrapper;
  }

  const taskDone = (element,taskId) => {
    element.addEventListener("click", e => {
      let task = document.getElementById("task"+taskId);
      if (e.target.checked) {
        task.style.color = "#fff";
        task.querySelector("h2").style.textDecoration = "line-through";
      } else {
        task.querySelector("h2").style.textDecoration = "none";
      }
    });
  }

  const removeTask = (element, taskId) => {
    element.addEventListener("click", e => {
      let task = document.getElementById("task"+taskId);
      AuxiliarLib.removeNodeElement(task.parentElement);
    });

    //IMPLEMENT THE EXLCUSION OF LOCALSTOAREG
  }

  return {create}

})();

export {TaskDetailsFooter}
