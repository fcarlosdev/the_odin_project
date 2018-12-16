import "./util/imports.js";
import {Task} from "./models/task.js";
import {Todo} from "./models/todo.js";
import {AuxiliarLib} from "./util/auxiliar-lib.js";
import FrmTaskBody from "./partials/new-task-form.html";
import {TaskHeader} from './elements/task-header.js';
import {TaskDetails} from './elements/task-details.js';

let txtNomeTodo  = document.querySelector("#txt-todo-name");
let todosList    = document.querySelector(".lst-todos");
let tasksList    = document.getElementById("tasks");
let todoSelected = document.querySelector(".todo-title");

document.querySelector("#new-todo").addEventListener("click", function() {
  newTodo();
});

txtNomeTodo.addEventListener('keydown', function(event) {
  if (event.key === "Enter") {
    newTodo();
  }
});

const newTodo = () => {
  let todo = Todo(txtNomeTodo.value);
  let todoListElement = document.createElement("li");
  todoListElement.setAttribute("id",generateTodoId());
  todoListElement.textContent = todo.getName();

  todoListElement.addEventListener("click", showSelectedTodo);
  todoSelected.querySelector(".bt-remove").addEventListener("click",removeTodo);
  todoSelected.querySelector(".add-task").addEventListener("click", e => {
    let taskForm = document.getElementById("myModal");
    taskForm.innerHTML = FrmTaskBody;
    taskForm.style.display  = "flex";
    closeForm(taskForm);

    document.getElementById("save-button").addEventListener("click",e => {
      let task = Task(getFieldValue("task-title"), getFieldValue("task-desc"),
                      getFieldValue("task-due-date"), getFieldValue("task-priority"));
      todo.addTask(task);

      let taskId = generateTaskId();

      let taskItem = document.createElement("li");
      taskItem.setAttribute("id","taskItem"+taskId);
      taskItem.appendChild(TaskHeader.create(taskId, task.getName()));
      taskItem.appendChild(TaskDetails.create(taskId, task.getDueDate(),
                                    task.getPriority(), task.getDescription()));
      if (task.getPriority() == "Low") {
        taskItem.classList.add("low-priority");
      } else if (task.getPriority() == "Medium") {
        taskItem.classList.add("medium-priority");
      } else {
        taskItem.classList.add("high-priority");
      }
      tasksList.appendChild(taskItem);

      taskForm.style.display  = "none";
    });

  });

  todosList.appendChild(todoListElement);

  clearTextField(txtNomeTodo);
}

const clearTextField = (textField) => {
  textField.value = "";
}

const showSelectedTodo = (e) => {

  todoSelected.querySelector("h1").textContent = e.target.textContent;
  todoSelected.style.display = "flex";
}

const removeTodo = (e) => {

  if (e.target.textContent.trim() == "Remove") {
    AuxiliarLib.removeNodeElement(findTodo(todoSelected.querySelector("h1")
                                                       .textContent.trim()));
    todoSelected.querySelector("h1").textContent = "";
    todoSelected.style.display = "none";
  }
}

const closeForm = (form) => {
  ["#cancel-button",".close"].forEach((elem) => {
    document.querySelector(elem).addEventListener("click",f => {
      form.style.display = "none";
    });
  })
}

const findTodo = (withName) => {
  let todo = Array.from(todosList.children)
                  .filter(todo => todo.textContent == withName);
  return (todo.length > 0) ? todo[0] : undefined;
}

const generateTodoId = () => {
  return todosList.children.length + 1;
}

const generateTaskId = () => {
  return tasksList.children.length + 1;
}

const getFieldValue = (fieldId) => {
  return document.getElementById(fieldId).value;
}
