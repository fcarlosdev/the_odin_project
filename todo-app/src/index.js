import "./util/imports";
import {Task} from "./models/task";
import {Todo} from "./models/todo";
import {AuxiliarLib} from "./util/auxiliar-lib";
import FrmTaskBody from "./partials/new-task-form.html";
import {TaskHeader} from './elements/task-header';
import {TaskDetails} from './elements/task-details';
import ElementFactory from './elements/dom-element-lib';

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
  let todoListElement = ElementFactory("li").setContent(todo.getName())
                                            .addAttributes({id:generateTodoId()})                                            
                                            .attachEvent("click", showSelectedTodo);

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

      let taskItem = ElementFactory("li")
                        .addAttributes({id:"taskItem"+taskId})
                        .addChildren(TaskHeader.create(taskId, task.getName()),
                                     TaskDetails.create(taskId, task.getDueDate(), task.getPriority(), task.getDescription())                                     
                                    );
      if (task.getPriority() == "Low") {
        taskItem.addClasses("low-priority");
      } else if (task.getPriority() == "Medium") {
        taskItem.addClasses("medium-priority");
      } else {
        taskItem.addClasses("high-priority");
      }
      tasksList.appendChild(taskItem.element);

      taskForm.style.display  = "none";
    });

  });

  todosList.appendChild(todoListElement.element);

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
