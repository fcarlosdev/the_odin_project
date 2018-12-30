import { Todo } from "./models/todo";
import { Task } from "./models/task";

import TodoController from "./controllers/todo-controller";
import TaskFormController from "./controllers/task-form-controller";

import { TaskHeader } from './elements/task-header';
import { TaskDetails } from './elements/task-details';

import { AuxiliarLib } from "./util/auxiliar-lib";

import ElementFactory from "./elements/dom-element-lib";

const TodoApp = (todosList, tasksList) => {

  let todoModel;

  let todoController = TodoController();


  const createTodoModel = (id, todoName) => {
    todoModel = todoController.saveTodo(Todo(id, todoName));
  }

  const newTodo = (params) => {
    // init();
    createTodoModel(params.attributes.id, params.textNode);

    return ElementFactory(params.type).setContent(params.textNode)
                                      .addClasses(params.classes)
                                      .addAttributes(params.attributes);
  }

  const selectTodo = (e) => {
    showSelectedTodo(selectDomElement(".todo-title"),e.target.textContent);
    updateTasksList(Number(e.target.getAttribute("id")));
    selectDomElement(".bt-remove").addEventListener("click", removeTodo);
    selectDomElement(".add-task").addEventListener("click", createTask);
  }

  const showSelectedTodo = (todoSelected, name) => {    
    selectChildDOMElement("h1", todoSelected).textContent = name;
    todoSelected.style.display = "flex";
  }

  const removeTodo = (e) => {
    let todoSelected = e.target.parentElement.parentElement;
    AuxiliarLib.removeNodeElement(
      findTodo(selectChildDOMElement("h1", todoSelected).textContent.trim())
    );

    todoController.deleteTodo(todoModel);
    updateTasksList(todoModel.getId());

    selectChildDOMElement("h1", todoSelected).textContent = "";
    todoSelected.style.display = "none";
  }

  const createTask = (e) => {
    TaskFormController.showForm(saveTask);
  }

  const saveTask = () => {
    let task = Task(generateTaskId(), TaskFormController.getTaskTitle(),   
                    TaskFormController.getTaskDescription(), TaskFormController.getTaskDueDate(), 
                    TaskFormController.getTaskPripority(), todoModel.getId());
      todoModel.addTask(task);
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

  const updateTasksList = (todoId) => {

    AuxiliarLib.removeChildNodesFrom(selectDomElement("#tasks"));

    if (todoModel.getId() !== todoId) {
      todoModel = todoController.findTodo(todoId)
      if (todoModel !== undefined) {
        todoModel.getTasks().forEach(task => {
          createTaskElement(task);
        });
      }
    }

  }

  return { newTodo, selectTodo }
}

export { TodoApp };
