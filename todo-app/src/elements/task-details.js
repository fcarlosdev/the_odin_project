import {TaskDetailsFooter} from './task-details-footer.js';

const TaskDetails = (() => {

  const create = (task) => {

    let dueDateElem = document.createElement("div");
    dueDateElem.classList.add("due-date");
    dueDateElem.textContent = ("Due Date " + task.getDueDate());

    let priorityElem = document.createElement("div");
    priorityElem.classList.add("priority");
    priorityElem.textContent = (task.getPriority() + " Priority");

    let taskIinfo = document.createElement("div");
    taskIinfo.classList.add("task-details-top");
    taskIinfo.appendChild(dueDateElem);
    taskIinfo.appendChild(priorityElem);

    let descriptionElem = document.createElement("div");
    descriptionElem.classList.add("desc");
    descriptionElem.textContent = task.getDescription();

    let taskDetailsWrapper = document.createElement("div");
    taskDetailsWrapper.classList.add("task-details");

    taskDetailsWrapper.appendChild(taskIinfo);
    taskDetailsWrapper.appendChild(descriptionElem);
    taskDetailsWrapper.appendChild(TaskDetailsFooter.create(task));

    return taskDetailsWrapper;

  }

  return {create};


})();

export {TaskDetails}
