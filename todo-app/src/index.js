import "./util/imports";
import {TodoApp} from './todo-app';
import TodoElementParams from './elements/todo-element-params';

let txtNomeTodo  = document.querySelector("#txt-todo-name");
let todosList    = document.querySelector(".lst-todos");

let appTodo = TodoApp(todosList, document.querySelector("#tasks"));

document.querySelector("#new-todo").addEventListener("click", function() {
  createTodo();
});

txtNomeTodo.addEventListener('keydown', function(event) {
  if (event.key === "Enter") {
    createTodo();
  }
});


const createTodo = () => {
  let todoElement = appTodo.newTodo(
    TodoElementParams("li",txtNomeTodo.value).withAttributes({id:generateTodoId()})
  );

  todoElement.attachEvent("click", appTodo.selectTodo);

  todosList.appendChild(todoElement.element);
  clearTextField(txtNomeTodo);
}

const generateTodoId = () => {
  return todosList.children.length + 1;
}

const clearTextField = (field) => {
  field.value = "";
}
