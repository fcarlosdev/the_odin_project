import "./util/imports.js";
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
  todosList.appendChild(App.newTodoElement("li", txtNomeTodo.value));
  clearTextField(txtNomeTodo);
}

const clearTextField = (textField) => {
  textField.value = "";
}
