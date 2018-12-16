import {ViewElements} from "./view-elements.js";
import {TaskController} from "../controllers/taskController.js";


const TaskElement = (() => {


  let taskId;

  const newTask = (formFields) => {

    taskId = "task"+generateTaskId();

    let task = TaskController.createTask(formFields.title, formFields.description,
                                         formFields.dueDate, formFields.priority);

    ViewElements.addChildrenTo(
      ViewElements.getElement("#tasks"),[createTaskItem(task)]
    );

    attachShowDetailsTo(ViewElements.getElement("#"+taskId).querySelector("a"));

    return task;
  }

  const createTaskItem = (task) => {

    return ViewElements.addChildrenTo(
             ViewElements.addAttributes(
               ViewElements.newElement("li"), {"id": taskId}),
             [createTitleElement(task), createTaskDetails(task)]
           );
  }

  const createTitleElement = (task) => {
    return ViewElements.addChildrenTo(
             ViewElements.addClass(
               ViewElements.newElement("div"),["task-title"]
             ),[ViewElements.newElement("h2",task.getName()),
                createShowTaskDetails()]
           );
  }

  const createShowTaskDetails = () => {

    return ViewElements.addClass(
             ViewElements.addAttributes(
               ViewElements.newElement("a","Show details"),{"href":"#"}
             ),["bt-details"]
           );
  }

  const createTaskDetails = (task) => {

    return ViewElements.applyStyles(
            ViewElements.addClass(
              ViewElements.newElement("div"),["task-details"]
            ), {"display:":"none"}
          )
  }

  const attachShowDetailsTo = (button) => {

    let taskDetailsElement = ViewElements.getElement("#"+taskId).children[1];

    ViewElements.attachEvent(button,"click", e => {
      if (taskDetailsElement.style.display == "none") {
        taskDetailsElement.style.display = "flex";
        button.textContent = "Hide details";
      } else {
        taskDetailsElement.style.display = "none";
        button.textContent = "Show details";
      }
    });
  }

  const generateTaskId = () => {
    return ViewElements.getElement("#tasks").children.length + 1;
  }

  return { newTask }

})();

export {TaskElement}
