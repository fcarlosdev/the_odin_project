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

  todoElement.element.click();
  clearTextField(txtNomeTodo);
}

const generateTodoId = () => {
  return todosList.children.length + 1;
}

const clearTextField = (field) => {
  field.value = "";
}

let storagedTodos = appTodo.getTodos();

if (storagedTodos.length == 0) {
  let tdEl = appTodo.newTodo(TodoElementParams("li","Project One")
                    .withAttributes({id: 1}))
                    .attachEvent("click", appTodo.selectTodo).element;
  todosList.appendChild(tdEl);
  tdEl.element.click();
} else {
    storagedTodos.forEach((todo, index) => {
      let tdEl = appTodo.loadTodo(TodoElementParams("li",todo.getName())
                        .withAttributes({id: todo.getId()}))
                        .attachEvent("click", appTodo.selectTodo)
                        .element;
      todosList.appendChild(tdEl);
      if (index == 0) {
        tdEl.element.click();
      }
    })
}