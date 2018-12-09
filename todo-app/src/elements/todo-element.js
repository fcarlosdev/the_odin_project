import newTaskForm from "../partials/new-task-form.html";
import taskMenu from "../partials/task-menu.html";
import {ViewElements} from "./view-elements.js";
import {TaskController} from "../controllers/taskController.js";

const TodoElement = (() => {

  const generateTodo = (name, todoItemTag, todoListTag) => {
    let todoItem = ViewElements.newElement(todoItemTag);
    let todoList = ViewElements.getElement(todoListTag);
    ViewElements.addAttributes(todoItem, {"id": generateTodoId(todoList)});
    setTodoIdentification(name,todoItem, todoList);
    attachSelectTodoEvent(todoItem,name);
    todoList.appendChild(todoItem);
  }

  const setTodoIdentification = (name,todoItem, todoList) => {

    let todoName  = ViewElements.newElement("span");
    let btRemove  = ViewElements.newElement("span");

    ViewElements.setContent(todoName,name);
    ViewElements.setContent(btRemove, "x");
    ViewElements.addClass(btRemove,["bt-remove"]);

    ViewElements.attachEvent(btRemove, "click", e => {
      todoList.removeChild(todoItem);
    });

    todoItem.appendChild(todoName);
    todoItem.appendChild(btRemove);
  }

  const attachSelectTodoEvent = (todoItem, content) => {

    ViewElements.attachEvent(todoItem, "click", e => {

      if (e.target.tagName === "LI" || e.target.textContent != "x") {

        let todoHeader = ViewElements.getElement(".todo-title");
        ViewElements.applyStyles(todoHeader, {"display:":"flex"});
        clearElementChildNodes(todoHeader);

        let btAddTask = ViewElements.newElement("div","Add Task");
        ViewElements.addClass(btAddTask,["add-task"]);
        attachNewTodoTaskEvent(btAddTask);

        let removeTodo = ViewElements.newElement("div","Remove");
        ViewElements.addClass(removeTodo, ["bt-remove"]);
        ViewElements.attachEvent(removeTodo, "click", e => {
          clearElementChildNodes(todoHeader);
          clearElementChildNodes(ViewElements.getElement("#tasks"));
          ViewElements.applyStyles(todoHeader, {"display:":"none"});
        })

        let todoActions = ViewElements.newElement("div");
        ViewElements.addClass(todoActions,["todo-actions"]);

        todoActions.appendChild(ViewElements.newElement("h1",content));
        todoActions.appendChild(removeTodo);

        todoHeader.appendChild(todoActions);
        todoHeader.appendChild(btAddTask);
      }
    });
  }

  const attachNewTodoTaskEvent = (btAddTask) => {
    ViewElements.attachEvent(btAddTask, "click", e => {
      let modal = ViewElements.getElement('#myModal');
          modal.innerHTML = newTaskForm;
          modal.style.display = "block";

      ViewElements.attachEvent(ViewElements.getElement(".close"),"click", e => {
        modal.style.display = "none";
      });

      ViewElements.attachEvent(ViewElements.getElement("#modal-cancel-button"),"click", e => {
        modal.style.display = "none";
      });

      ViewElements.attachEvent(ViewElements.getElement("#modal-save-button"),"click", e => {

        let tasks = ViewElements.getElement("#tasks");

        let id = generateTodoId(tasks);
        let taskLine = ViewElements.newElement("li");
        ViewElements.addAttributes(taskLine,{"id": "Task"+id});
        ViewElements.applyStyles(taskLine,{"position:": "relative"});


        let taskTitle = ViewElements.getElement("#task-title");
        let taskDesc = ViewElements.getElement("#task-desc");
        let taskDueDate = ViewElements.getElement("#task-due-date");
        let taskPriority = ViewElements.getElement("#task-priority");
        let task = TaskController.createTask(taskTitle.value,taskDesc.value,
                                      taskDueDate.value, taskPriority.value);

        let taskHeader = ViewElements.newElement("h2",task.getName());

        //Task Details Header
        let dueDateElement = ViewElements.newElement("div", "Due date " + task.getDueDate());
        ViewElements.addClass(dueDateElement,["due-date"]);

        let priorityElement = ViewElements.newElement("div", task.getPriority() + " priority");
        ViewElements.addClass(priorityElement,["priority"]);

        let taskDetailsTop = ViewElements.newElement("div");
        ViewElements.addClass(taskDetailsTop,["task-details-top"]);

        taskDetailsTop.appendChild(dueDateElement);
        taskDetailsTop.appendChild(priorityElement);

        let taskActions = ViewElements.newElement("div","...");
        ViewElements.addClass(taskActions,["dropdown"]);
        ViewElements.addAttributes(taskActions,{"width:": "84px"});
        ViewElements.applyStyles(taskActions,{"display:": "flex",
                                              "flex-direction:": "column"});
        taskActions.innerHTML = taskMenu;

        ViewElements.attachEvent(taskActions,"click", e => {
          taskActions.querySelector("#taskMenu").classList.toggle("show");
        });

        ViewElements.attachEvent(taskActions.querySelector("#removeTask"),"click", e => {
          tasks.removeChild(taskLine);
        });

        let taskShowDetails = taskActions.querySelector("#taskDetails");
        ViewElements.attachEvent(taskShowDetails,"click", e => {
          if (elementTaskDetails.style.display == "none") {
            elementTaskDetails.style.display = "flex";
            taskShowDetails.textContent = "Hide details";
          } else {
            elementTaskDetails.style.display = "none";
            taskShowDetails.textContent = "Show details";
          }
        });

        //Task Description
        let taskDescElement = ViewElements.newElement("div", task.getDescription());
        ViewElements.addClass(taskDescElement,["desc"]);

        //Task Details footer
        let checkBoxDoneElement = ViewElements.newElement("input")
        ViewElements.addAttributes(checkBoxDoneElement,{"id":"tsk-done",
                                                       "type":"checkbox",
                                                       "value": "done"});
        ViewElements.attachEvent(checkBoxDoneElement,"click",e => {
          let taskElement = ViewElements.getElement("#"+taskLine.getAttribute("id"));
          if (checkBoxDoneElement.checked) {
            ViewElements.applyStyles(taskElement.querySelector("h2"),{"text-decoration:":"line-through"});
            ViewElements.applyStyles(taskActions.querySelector(".dropbtn"),{"background-color:": "#f60f0f"});
            ViewElements.applyStyles(taskElement,{"background-color:": "#f60f0f"});
          } else {
            ViewElements.applyStyles(taskElement.querySelector("h2"),{"text-decoration:":"none"});
            ViewElements.applyStyles(taskActions.querySelector(".dropbtn"),{"background-color:": "#0656a0"});
            ViewElements.applyStyles(taskElement,{"background-color:": "#0656a0"});
          }
        });
        let spanDoneText = ViewElements.newElement("span","Done");
        ViewElements.applyStyles(spanDoneText,{"padding-left:": "10px;"});

        let taskDoneElement = ViewElements.newElement("div");
        ViewElements.addClass(taskDoneElement,["task-done"]);
        taskDoneElement.appendChild(checkBoxDoneElement);
        taskDoneElement.appendChild(spanDoneText);

        let taskFooterElement = ViewElements.newElement("div");
        ViewElements.addClass(taskFooterElement,["task-details-footer"]);
        taskFooterElement.appendChild(taskDoneElement);

        let elementTaskDetails = ViewElements.newElement("div");
        ViewElements.addClass(elementTaskDetails,["task-details"]);
        ViewElements.applyStyles(elementTaskDetails,{"display:":"none"});

        elementTaskDetails.appendChild(taskDetailsTop);
        elementTaskDetails.appendChild(taskDescElement);
        elementTaskDetails.appendChild(taskFooterElement);

        let elementTitle = ViewElements.newElement("div");
        ViewElements.addAttributes("id", id);
        ViewElements.addClass(elementTitle,["task-title"]);
        elementTitle.appendChild(taskHeader);
        elementTitle.appendChild(taskActions);

        taskLine.appendChild(elementTitle);
        taskLine.appendChild(elementTaskDetails);

        tasks.append(taskLine);

        ViewElements.getElement('#myModal').style.display = "none";

      });
    });
  }

  const clearElementChildNodes = (element) => {
    while(element.hasChildNodes()) {
      element.removeChild(element.lastChild);
    }
  }

  const generateTodoId = (todosList) => {
    return todosList.children.length + 1;
  }

  return { generateTodo }

})();

export { TodoElement }
