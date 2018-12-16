import {Task} from "../models/task.js";
import {DomElement} from "./dom-element.js";
import FrmTaskBody from "../partials/new-task-form.html";

const TaskForm = (() => {

  const addTaskTo = (todoModel) => {
    createTaskElement();
    attachCloseEvent();
    attachSaveEvent(todoModel);
  }

  const attachCloseEvent = () => {
    [DomElement.getElement(".close"),
     DomElement.getElement("#cancel-button")].forEach(function(element){
       DomElement.attachEvent(element,"click", e => {
         closeForm();
       })
     });
  }

  const attachSaveEvent = (todoModel) => {
    DomElement.attachEvent(DomElement.getElement("#save-button"),"click", e => {
      let tasks           = DomElement.getElement("#tasks");
      let task            = createTaskModel();
      let taskDetails     = createTaskDetails();
      let taskShowDetails = createShowDetailsLink();
      associateTaskToTodo(task,todoModel);
      attachShowDetailsEventTo(taskShowDetails,taskDetails);

      let elementTitle = createElementTaskTitle(tasks,
                    [DomElement.newElement("h2",task.getName()),taskShowDetails]);

      let taskLine = DomElement.addChildrenTo(
                       DomElement.newElement("li"),[elementTitle,taskDetails]
                     );

      tasks.append(taskLine);
      closeForm();
    });
  }

  const createTaskElement = () => {
    DomElement.applyStyles(
      DomElement.setContent(
        DomElement.getElement('#myModal'), FrmTaskBody
      ), {"display:": "block"}
    );
  }

  const createTaskModel = () => {
    return Task(getFieldValue("#task-title"), getFieldValue("#task-desc"),
                getFieldValue("#task-due-date"), getFieldValue("#task-priority"));
  }

  const associateTaskToTodo = (task,todoModel) => {
    todoModel.addTask(task);
  }

  const createTaskDetails = () => {
    return DomElement.applyStyles(
             DomElement.addClass(
               DomElement.newElement("div"),["task-details"]
             ),{"display:":"none"}
           );
  }

  const createShowDetailsLink = () => {
    return DomElement.addClass(
             DomElement.addAttributes(
               DomElement.newElement("a","Show Details"),{"href":"#"}
             ),["bt-details"]
           );
  }

  const attachShowDetailsEventTo = (taskShowDetails, taskDetails) => {
    DomElement.attachEvent(taskShowDetails,"click", e => {
      if (taskDetails.style.display == "none") {
        taskDetails.style.display = "flex";
        taskShowDetails.textContent = "Hide details";
      } else {
        taskDetails.style.display = "none";
        taskShowDetails.textContent = "Show details";
      }
    })
  }

  const createElementTaskTitle = (tasks, children) => {
    return DomElement.addChildrenTo(
             DomElement.addClass(
               DomElement.addAttributes(
                 DomElement.newElement("div"),{"id": tasks.children.length + 1}
               ),["task-title"]
             ),children
           );
  }

  const getFieldValue = (fieldId) => {
    return DomElement.getElement(fieldId).value;
  }

  const closeForm = () => {
    DomElement.getElement("#myModal").style.display = "none";
  }


  return { addTaskTo };

})();

export { TaskForm }
