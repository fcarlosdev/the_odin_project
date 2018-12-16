import {TaskDetailsFooter} from './task-details-footer.js';

const TaskDetails = (() => {

  const create = (taskId, dueDate, priority, description) => {

    let dueDateElem = document.createElement("div");
    dueDateElem.classList.add("due-date");
    dueDateElem.textContent = ("Due Date " + dueDate);

    let priorityElem = document.createElement("div");
    priorityElem.classList.add("priority");
    priorityElem.textContent = (priority + " Priority");

    let taskIinfo = document.createElement("div");
    taskIinfo.classList.add("task-details-top");
    taskIinfo.appendChild(dueDateElem);
    taskIinfo.appendChild(priorityElem);

    let descriptionElem = document.createElement("div");
    descriptionElem.classList.add("desc");
    descriptionElem.textContent = description;

    let taskDetailsWrapper = document.createElement("div");
    taskDetailsWrapper.classList.add("task-details");

    taskDetailsWrapper.appendChild(taskIinfo);
    taskDetailsWrapper.appendChild(descriptionElem);
    taskDetailsWrapper.appendChild(TaskDetailsFooter.create(taskId));

    return taskDetailsWrapper;

  }

  return {create};


})();

export {TaskDetails}
