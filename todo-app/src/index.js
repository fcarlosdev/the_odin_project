import "./util/imports.js";
import {TodoController} from "./controllers/todoController.js";
// import {TaskController} from "./controllers/taskController.js";
import {App} from "./elements/app-todo.js";


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
  App.newTodoViewElement(todo.getName(), "li", ".lst-todos");
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



// let detailsStatus = "closed";
// const todoView = document.querySelector(".container");
//
//
//
// const btDetails = todoView.querySelector(".bt-details");
//
// btDetails.addEventListener('click',function() {
//   let taskTitle = todoView.querySelector(".task-title");
//   let taskDetails = todoView.querySelector(".task-details");
//   if (detailsStatus === "closed") {
//     detailsStatus = "opened";
//     taskDetails.style.display = "flex";
//     taskDetails.style.flexDirection = "column";
//     taskTitle.querySelector("a").textContent = "Hide details";
//   } else {
//     detailsStatus = "closed";
//     taskDetails.style.display = "none";
//     taskTitle.querySelector("a").textContent = "Show details";
//   }
// });
//
// todoView.querySelector("#tsk-done").addEventListener('click',function(c) {
//   if (this.checked) {
//     todoView.querySelector(".task-done").style.color = "#1b7bdf";
//     todoView.querySelector("#tsk-one").querySelector('h2').style.textDecoration="line-through";
//   } else {
//     todoView.querySelector(".task-done").style.color = "#000";
//     todoView.querySelector("#tsk-one").querySelector('h2').style.textDecoration="none";
//   }
// })
