import {TaskDetailsFooter} from './task-details-footer.js';
import DOMElement from "../libs/dom-element-lib";

const TaskDetails = (() => {

  const create = (task, removeTaskEventImpl) => {

    let taskIinfo = createTaskInfoEl([ createDueDateEl(task.getDueDate()), 
                                       createPriorityEl(task.getPriority()) ]);

    return createDetailsWrapperEl(
              [ taskIinfo,
                createDescriptionEl(task.getDescription()), 
                TaskDetailsFooter.create(task, removeTaskEventImpl) ]
           );

  }

  const createDetailsWrapperEl = (withChidren) => {
    return DOMElement("div").addClasses(["task-details"])
                            .addChildren(withChidren)
                            .element;
  }

  const createDueDateEl = (withDueDate) => {
    return DOMElement("div").setContent("Due Date " + withDueDate) 
                            .addClasses(["due-date"])
                            .element;
  }

  const createPriorityEl = (withPriority) => {
    return DOMElement("div").setContent(withPriority + " Priority")
                            .addClasses(["priority"])
                            .element;
  }

  const createTaskInfoEl = (withChildren) => {
    return DOMElement("div").addClasses(["task-details-top"])
                            .addChildren(withChildren)
                            .element;
  }

  const createDescriptionEl = (withDescription) => {
    return DOMElement("div").setContent(withDescription)
                            .addClasses(["desc"])
                            .element;
  }

  return {create};

})();

export {TaskDetails}