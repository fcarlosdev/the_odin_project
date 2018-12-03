import './css/main.css';
import * as Images from './util/loadImages.js';
import * as Factory from './factories/todoFactory.js';
import {todoController} from './controllers/todocontroller.js';
// import {taskForm} from './components/taskForm.js';
import {linkNewTask} from './components/linkNewTask.js';
import {tasks} from './components/taskList.js';

Images.importImages();

let todoId  = 1;
let taskId  = 1;
let numberOfTaskForms = 0;
let appView = document.querySelector('.container');

let addTodo     = appView.querySelector('#add-todo');
let todoTxtName = appView.querySelector('#txt-n-list');
let todos       = appView.querySelector('.projects-container');
let todoTasks   = appView.querySelector('#todo-tasks');
let todoTitle   = appView.querySelector('#todo-title');
let tdName      = appView.querySelector('#title-name');
let tdNewTask   = appView.querySelector('#new-task');

let controller = null;

addTodo.addEventListener('click', function() {
  newTodo(todoTxtName.value);
});

todoTxtName.addEventListener('keydown', function(event) {
  if (event.key === "Enter") {
    newTodo(todoTxtName.value);
  }
});


const newTodo = (todoName) => {
  controller = todoController( { todoFactory: Factory } );
  let todo = controller.newTodo(todoName);

  let todoDiv = document.createElement('div');
  todoDiv.setAttribute('id',todoId++);
  todoDiv.classList.add('project');
  todoDiv.textContent = todo.getName();
  todos.appendChild(todoDiv);
  todoTxtName.value = '';

  todoDiv.addEventListener('click',function() {

    todoTasks.innerHTML = "";
    tdNewTask.innerHTML = "";

    tdName.textContent = todo.getName();
    tdNewTask.appendChild(linkNewTask(document,controller).create(numberOfTaskForms,todoTasks,taskId));
    todoTitle.appendChild(tdName);
    todoTitle.appendChild(tdNewTask);
    todoTitle.style.display ='flex';

    if (todo.hasAnyTask()) {
      todoTasks.appendChild(task(document).showTasks(todo));
      }
   });
}

// const showTodoDetails = (selectedTodo) => {
//
// }
