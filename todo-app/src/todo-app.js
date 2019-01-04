import { Todo } from "./models/todo";
import { Task } from "./models/task";

import TodoController from "./controllers/todo-controller";
import TaskController from "./controllers/task-controller";
import TaskFormController from "./controllers/task-form-controller";

import { TaskHeader } from './elements/task-header';
import { TaskDetails } from './elements/task-details';

import { AuxiliarLib } from "./util/auxiliar-lib";

import ElementFactory from "./elements/dom-element-lib";

const TodoApp = (todosList, tasksList) => {

  let todoModel;

  let todoController = TodoController();
  let taskController = TaskController();


  const createTodoModel = (id, todoName) => {
    todoModel = todoController.saveTodo(Todo(id, todoName));
  }

  const newTodo = (params) => {
    createTodoModel(params.attributes.id, params.textNode);

    return ElementFactory(params.type).setContent(params.textNode)
                                      .addClasses(params.classes)
                                      .addAttributes(params.attributes);
  }

  const selectTodo = (e) => {
    showSelectedTodo(selectDomElement(".todo-title"),e.target);
    updateTasksList(e.target.textContent);
    selectDomElement(".bt-remove").addEventListener("click", removeTodo);
    selectDomElement(".add-task").addEventListener("click", createTask);
  }

  const showSelectedTodo = (todoSelected, todoEl) => {
    let titleTodoSelected = selectChildDOMElement("h1", todoSelected);
    // titleTodoSelected.setAttribute("id","Todo"+todoEl.getAttribute("id"));    
    titleTodoSelected.textContent = todoEl.textContent;

    todoSelected.style.display = "flex";
  }

  const removeTodo = (e) => {
    let todoSelected = e.target.parentElement.parentElement;
    AuxiliarLib.removeNodeElement(
      findTodo(selectChildDOMElement("h1", todoSelected).textContent.trim())
    );

    todoController.deleteTodo(todoModel);
    updateTasksList(todoModel.getName());

    selectChildDOMElement("h1", todoSelected).textContent = "";
    todoSelected.style.display = "none";
  }

  const createTask = (e) => {
    TaskFormController.showForm(saveTask);
  }

  const saveTask = () => {
    //REPLACE THIS CREATION OF TASK BY A PARAMETERS OBJECT AND LET THE CONTROLLER TAKE CARE OF
    //THIS CREATION.
    let task = Task(generateTaskId(), TaskFormController.getTaskTitle(),
                    TaskFormController.getTaskDescription(), TaskFormController.getTaskDueDate(),
                    TaskFormController.getTaskPripority(), todoModel.getId());
      taskController.save(task,todoModel);
      createTaskElement(task);
      TaskFormController.closeForm();
  }

  const createTaskElement = (task) => {
    let taskHeaderElement = TaskHeader.create(task.getId(), task.getName());
    let taskDetailsElement = TaskDetails.create(task.getId(), task.getDueDate(), task.getPriority(),
                                                task.getDescription());

    let taskItem = ElementFactory("li").addAttributes({ id: "taskItem" + task.getId() })
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

    if (todoModel.getName() !== name) {
      todoModel = todoController.findTodoByName(name)
      if (todoModel !== undefined && todoModel !== null) {
        todoModel.getTasks().forEach(task => {
          createTaskElement(task);
        });
      }
    }

  }

  return { newTodo, selectTodo }
}

export { TodoApp };
