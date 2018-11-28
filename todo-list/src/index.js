import './css/main.css';
import * as Images from './util/loadImages.js';
import * as Factory from './factories/todoFactory.js';
import {todoController} from './controllers/todocontroller.js';

Images.importImages();


let controller = todoController( { todoFactory: Factory } );
let todo = controller.newTodo("Learning Javascript");

let appView = document.querySelector('.container');

let todoDiv = document.createElement('div');
todoDiv.setAttribute('id',1);
todoDiv.classList.add('project');
todoDiv.textContent = todo.getName();

let taskData = {

  taskone : {
    title: "Learn fundamentals",
    description: "Knowing the data types, the math operator, etc",
    dueDate: "30/11/2018",
    priority: "medium"
  },
  tasktwo: {
    title: "Loop structures",
    description: "for-loop, forEach loop, while, etc",
    dueDate: "01/12/2018",
    priority: "medium"
  }
}

todo.addTask(controller.newTask(taskData['taskone']));
todo.addTask(controller.newTask(taskData['tasktwo']));

appView.querySelector('.projects-container').append(todoDiv);

todoDiv.addEventListener('click', function(e) {
  e.preventDefault();
  let contentTodoTitle           = document.querySelector('#todo-title');
  contentTodoTitle.textContent   = todo.getName();
  contentTodoTitle.style.display = 'block';

  let todoTasks = document.querySelector('#todo-tasks');
  let taskList = document.createElement('ul');
  taskList.style.listStyle = 'none';
  taskList.style.margin = '0';
  taskList.style.padding = '0';
  taskList.style.display = ''

  todo.getTasks().forEach(function(task) {
    let taskItem = document.createElement('li');

    let checkCircle = document.createElement('img');
    checkCircle.setAttribute('status','not-done');
    checkCircle.src = 'images/circle-regular.svg';
    checkCircle.classList.add('img');
    checkCircle.addEventListener('click', function(e) {
        e.preventDefault();
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

})
