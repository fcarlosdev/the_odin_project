import {ViewElements} from "./view-elements.js";
import {TaskController} from "../controllers/taskController.js";
import {TaskForm} from "./task-form.js";

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
      TaskForm.show();      

      ViewElements.attachEvent(ViewElements.getElement("#modal-save-button"),"click", e => {

        let tasks = ViewElements.getElement("#tasks");

        let taskTitle = ViewElements.getElement("#task-title");
        let task = TaskController.createTask(taskTitle.value,"Desc","01/01/2018","Low");

        let taskHeader = ViewElements.newElement("h2",task.getName());

        let elementTaskDetails = ViewElements.newElement("div");
        ViewElements.addClass(elementTaskDetails,["task-details"]);
        ViewElements.applyStyles(elementTaskDetails,{"display:":"none"});

        let taskShowDetails = ViewElements.newElement("a","Show Details");
        ViewElements.addAttributes(taskShowDetails,{"href":"#"});
        ViewElements.addClass(taskShowDetails,["bt-details"]);
        ViewElements.attachEvent(taskShowDetails,"click", e => {
          if (elementTaskDetails.style.display == "none") {
            elementTaskDetails.style.display = "flex";
            taskShowDetails.textContent = "Hide details";
          } else {
            elementTaskDetails.style.display = "none";
            taskShowDetails.textContent = "Show details";
          }

        });

        let elementTitle = ViewElements.newElement("div");
        ViewElements.addAttributes("id", tasks.children.length + 1);
        ViewElements.addClass(elementTitle,["task-title"]);
        elementTitle.appendChild(taskHeader);
        elementTitle.appendChild(taskShowDetails);

        let taskLine = ViewElements.newElement("li");
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
