import { Todo } from "./models/todo";
import { Task } from "./models/task";

import TodoController from "./controllers/todo-controller";
import TaskController from "./controllers/task-controller";
import TaskFrmCtrl from "./controllers/task-form-controller";

import { TaskHeader } from './elements/task-header';
import { TaskDetails } from './elements/task-details';

import { AuxiliarLib } from "./util/auxiliar-lib";

import DOMElement from "./libs/dom-element-lib";

const TodoApp = (todosList, tasksList) => {

  let todoModel;

  let todoController = TodoController();
  let taskController = TaskController();

  let selectedTodo = null;
  let firstProjectTodo = null;

  const createTodoModel = (id, todoName) => {
    todoModel = todoController.saveTodo(Todo(id, todoName));
  }

  const newTodo = (params) => {
    createTodoModel(params.attributes.id, params.textNode);
    if (firstProjectTodo == undefined) {
      firstProjectTodo = createItemListTodo(params);
      return firstProjectTodo;
    } else {
      return createItemListTodo(params);
    }
  }

  const loadTodo = (params) => {
    return createItemListTodo(params);
  }

  const createItemListTodo = (params) => {
    return DOMElement(params.type).setContent(params.textNode)
                                  .addClasses(params.classes)
                                  .addAttributes(params.attributes);
  }

  const selectTodo = (e) => {
    higlihtTodoSelected(e.target);
    showSelectedTodo(selectDomElement(".todo-title"),e.target.textContent,"flex");
    updateTasksList(e.target.textContent);
    selectDomElement(".bt-remove").addEventListener("click", removeTodo);
    selectDomElement(".add-task").addEventListener("click", createTask);
  }

  const showSelectedTodo = (todoSelected, content, displayType) => {    
    selectChildDOMElement("h1", todoSelected).textContent = content;
    todoSelected.style.display = displayType;
  }

  const higlihtTodoSelected = (project) => {
    if (selectedTodo == null) {
      selectedTodo = project;
    } else {
      selectedTodo.style.removeProperty('background-color');
      selectedTodo = project;
    }
    selectedTodo.style.backgroundColor = "cornflowerblue";
  }

  const removeTodo = (e) => {
    let todoSelected = e.target.parentElement.parentElement;
    AuxiliarLib.removeNodeElement(
      findTodo(selectChildDOMElement("h1", todoSelected).textContent.trim())
    );

    todoController.deleteTodo(todoModel);
    updateTasksList(todoModel.getName());

    if (todosList.children.length > 0)
      firstProjectTodo.element.click();
    else  
      showSelectedTodo(todoSelected,"", "none")
  }

  const createTask = (e) => {
    TaskFrmCtrl.showForm(saveTask);
  }

  const saveTask = () => {
    let task = Task(generateTaskId(), TaskFrmCtrl.getTaskTitle(), TaskFrmCtrl.getTaskDescription(), 
                    TaskFrmCtrl.getTaskDueDate(), TaskFrmCtrl.getTaskPripority(), todoModel.getId());
    taskController.save(task,todoModel);
    createTaskElement(task);
    TaskFrmCtrl.closeForm();
  }

  const createTaskElement = (task) => {
    let taskHeaderElement = TaskHeader.create(task.getId(), task.getName());
    let taskDetailsElement = TaskDetails.create(task,removeTask.bind(null,task));

    let taskItem = DOMElement("li").addAttributes({ id: "taskItem" + task.getId() })
                                   .addChildren([taskHeaderElement, taskDetailsElement]);                                                                                  
    setTaskColorBasedOnPriority(taskItem, task.getPriority());
    tasksList.appendChild(taskItem.element);
  }

  const setTaskColorBasedOnPriority = (taskItem, taskPriority) => {
    if (taskPriority == "Low") {
      taskItem.addClasses("low-priority");
    } else if (taskPriority == "Medium") {
      taskItem.addClasses("medium-priority");
    } else {
      taskItem.addClasses("high-priority");
    }
  }

  const removeTask = (task) => {
    AuxiliarLib.removeNodeElement(
      document.getElementById("task"+task.getId()).parentElement
    );
    TaskController().deleteTask(task);    
  }


  const selectDomElement = (selector) => {
    return document.querySelector(selector);
  }

  const selectChildDOMElement = (child, parent) => {
    return parent.querySelector(child);
  }

  const findTodo = (withName) => {
    let todo = Array.from(todosList.children)
                    .filter(todo => todo.textContent == withName);
    return (todo.length > 0) ? todo[0] : undefined;
  }

  const generateTaskId = () => {
    return tasksList.children.length + 1;
  }

  const updateTasksList = (name) => {

    AuxiliarLib.removeChildNodesFrom(selectDomElement("#tasks"));

     todoModel = todoController.findTodoByName(name)
     if (todoModel !== undefined && todoModel !== null) {
       todoModel.getTasks().forEach(task => {
         createTaskElement(task);
       });
     }
  }

  const getTodos = () => {
    return todoController.listTodos();
  }

  return { newTodo, selectTodo, getTodos, loadTodo }
}

export { TodoApp };
