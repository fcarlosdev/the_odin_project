import "./util/imports.js";
import {TodoController} from "./controllers/todoController.js";
import {TaskController} from "./controllers/taskController.js";
import {ViewManager} from "./views/viewManager.js";

let todosList   = document.querySelector(".lst-todos");
let txtNomeTodo = document.querySelector("#txt-todo-name");

document.querySelector("#new-todo").addEventListener("click", function() {
  let todo                   = TodoController.createTodo(txtNomeTodo.value);
  let todoItem               = document.createElement("li");
  let spanTodoName           = document.createElement("span");
  let spanTodoSymbol         = document.createElement("span");
  spanTodoName.textContent   = todo.getName();
  spanTodoSymbol.textContent = "x";
  todoItem.appendChild(spanTodoName);
  todoItem.appendChild(spanTodoSymbol);
  todosList.appendChild(todoItem);
  // todo.addTask(todo,"Task One");
  // todo.addTask(todo,"Task Two");
  clearTextField(txtNomeTodo);
});

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
