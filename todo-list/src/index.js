import './css/main.css';
import * as Images from './util/loadImages.js';
import * as Factory from './factories/todoFactory.js';
import {todoController} from './controllers/todocontroller.js';

Images.importImages();

let todoId  = 1;
let appView = document.querySelector('.container');

let addTodo     = appView.querySelector('#add-todo');
let todoTxtName = appView.querySelector('#txt-n-list');
let todos       = appView.querySelector('.projects-container');
let todoTasks   = appView.querySelector('#todo-tasks');

let controller = null;

addTodo.addEventListener('click', function() {
  newTodo(todoTxtName.value);
});

todoTxtName.addEventListener('keydown', function(event) {
  if (event.key === "Enter") {
    newTodo(todoTxtName.value);
  }
});

// let taskData = {
//
//   taskone : {
//     title: "Learn fundamentals",
//     description: "Knowing the data types, the math operator, etc",
//     dueDate: "30/11/2018",
//     priority: "medium"
//   },
//   tasktwo: {
//     title: "Loop structures",
//     description: "for-loop, forEach loop, while, etc",
//     dueDate: "01/12/2018",
//     priority: "medium"
//   }
// }
//
// todo.addTask(controller.newTask(taskData['taskone']));
// todo.addTask(controller.newTask(taskData['tasktwo']));
//
// appView.querySelector('.projects-container').append(todoDiv);
//
// todoDiv.addEventListener('click', function(e) {
//
//   todo.getTasks().forEach(function(task) {
//     let taskItem = document.createElement('li');
//
//     let checkCircle = document.createElement('img');
//     checkCircle.setAttribute('status','not-done');
//     checkCircle.src = 'images/circle-regular.svg';
//     checkCircle.classList.add('img');
//     checkCircle.addEventListener('click', function(e) {
//         e.preventDefault();
//         if (checkCircle.getAttribute('status') === 'not-done') {
//           checkCircle.src = 'images/circle-solid.svg'
//           checkCircle.setAttribute('status','done');
//         } else {
//           checkCircle.src = 'images/circle-regular.svg';
//           checkCircle.setAttribute('status','not-done');
//         }
//     });
//
//     taskItem.appendChild(checkCircle);
//     taskItem.append(task.getTitle());
//
//     taskList.appendChild(taskItem);
//
//   });
//   todoTasks.appendChild(taskList);
//
// })

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
      let contentTodoTitle           = document.querySelector('#todo-title');
      contentTodoTitle.textContent   = todo.getName();
      contentTodoTitle.style.display = 'block';

      if (todo.hasAnyTask()) {
        let taskList             = document.createElement('ul');
        taskList.style.listStyle = 'none';
        taskList.style.margin    = '0';
        taskList.style.padding   = '0';
        taskList.style.display   = '';

        todo.getTasks().forEach(function(task) {

            let taskItem = document.createElement('li');
            let checkCircle = document.createElement('img');
            checkCircle.setAttribute('status','not-done');
            checkCircle.src = 'images/circle-regular.svg';
            checkCircle.classList.add('img');

            checkCircle.addEventListener('click', function() {

              if (checkCircle.getAttribute('status') === 'not-done') {
                checkCircle.src = 'images/circle-solid.svg'
                checkCircle.setAttribute('status','done');
              } else {
                checkCircle.src = 'images/circle-regular.svg';
                checkCircle.setAttribute('status','not-done');
              }
            });

            taskItem.appendChild(checkCircle);
            taskItem.append(task.getTitle());
            taskList.appendChild(taskItem);
        });
        todoTasks.appendChild(taskList);
      }
  });
}

// const showTodoDetails = (selectedTodo) => {
//
// }
