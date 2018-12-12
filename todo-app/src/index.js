import "./util/imports.js";
import "./util/window-events.js";
import {TodoController} from "./controllers/todoController.js";
// import {TaskController} from "./controllers/taskController.js";
import {App} from "./elements/app-todo.js";

import {TodoComponent} from "./elements/todo-component.js";


let txtNomeTodo = document.querySelector("#txt-todo-name");
let todosList   = document.querySelector(".lst-todos");

document.querySelector("#new-todo").addEventListener("click", function() {
  newTodo();
});

txtNomeTodo.addEventListener('keydown', function(event) {
  if (event.key === "Enter") {
    newTodo();
  }
});

const newTodo = () => {
  let todo = TodoController.createTodo(txtNomeTodo.value);
  let todoComponent = TodoComponent.create((todosList.children.length + 1), todo.getName());
  todosList.appendChild(todoComponent);  
  clearTextField(txtNomeTodo);
}

const newTask = (todo) => {
  let task = TaskController.createTask("Task One", "Task of tests", "01/01/2019", "low");
  // todo.addTask(todo,"Task One");
  // todo.addTask(todo,"Task Two");
  App.newTodoTaskElement(todo, task);
}

const clearTextField = (textField) => {
  textField.value = "";
}
