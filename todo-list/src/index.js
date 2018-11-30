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

// todo.addTask(controller.newTask(taskData['taskone']));
// todo.addTask(controller.newTask(taskData['tasktwo']));
//

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

      let lkNewTask = document.createElement('a');
      lkNewTask.setAttribute('ur','#');
      lkNewTask.style.cursor = 'pointer';
      lkNewTask.textContent = "+";

      lkNewTask.addEventListener('click',function() {
        let newTaskDiv                   = document.createElement('div');
        newTaskDiv.style.width           = "100%";
        newTaskDiv.style.display         = "flex";
        newTaskDiv.justifyContent        = "space-between";


        let newTaskDiv1                  = document.createElement('div');
        newTaskDiv1.style.width          = "100%";
        let taskTitleInput               = document.createElement('input');
        taskTitleInput.placeholder       = "Task Title";
        taskTitleInput.style.width       = "100%";
        // taskTitleInput.style.marginRight = "5px";
        taskTitleInput.classList.add("input-data");
        newTaskDiv1.appendChild(taskTitleInput);

        let newTaskDiv2                   = document.createElement('div');
        newTaskDiv2.style.width          = "100%";
        let taskDescTextArea               = document.createElement('input');
        taskDescTextArea.placeholder       = "Task description";
        taskDescTextArea.style.width       = "75%";
        // taskDescTextArea.style.marginRight = "5px";
        taskDescTextArea.classList.add("input-data");
        newTaskDiv2.appendChild(taskDescTextArea);
        //
        // let newTaskDiv3                   = document.createElement('div');
        // let taskDueDateInput               = document.createElement('input');
        // taskDueDateInput.placeholder       = "Due Date";
        // taskDueDateInput.style.width       = "auto";
        // // taskDueDateInput.style.marginRight = "5px";
        // taskDueDateInput.classList.add("input-data");
        //
        // let taskPrioritSelect               = document.createElement('select');
        // taskPrioritSelect.style.width       = "auto";
        // taskPrioritSelect.classList.add("input-data");

        // let optionDefault = document.createElement("option");
        // let optionLow = document.createElement("option");
        // let optionMedium = document.createElement("option");
        // let optionHight = document.createElement("option");

        // optionDefault.text = "Priority";
        // optionLow.text     = "Low";
        // optionMedium.text  = "Medium";
        // optionHight.text   = "Hight";
        //
        // taskPrioritSelect.add(optionDefault);
        // taskPrioritSelect.add(optionLow);
        // taskPrioritSelect.add(optionMedium);
        // taskPrioritSelect.add(optionHight);

        newTaskDiv.appendChild(newTaskDiv1);
        newTaskDiv.appendChild(newTaskDiv2);
        // newTaskDiv.appendChild(taskTitleInput);
        // newTaskDiv.appendChild(taskDescTextArea);
        // newTaskDiv.appendChild(taskDueDateInput);
        // newTaskDiv.appendChild(taskPrioritSelect);
        todoTasks.appendChild(newTaskDiv);
      })

    tdName.textContent = todo.getName();
    tdNewTask.appendChild(lkNewTask);
    todoTitle.appendChild(tdName);
    todoTitle.appendChild(tdNewTask);
    todoTitle.style.display ='flex';

    if (todo.hasAnyTask()) {
        let taskList             = document.createElement('ul');
        taskList.style.listStyle = 'none';
        taskList.style.margin    = '0';
        taskList.style.padding   = '0';
        taskList.style.display   = '';

        todo.getTasks().forEach(function(task) {

            let taskItem    = document.createElement('li');
            let checkCircle = document.createElement('img');
            checkCircle.src = 'images/circle-regular.svg';
            checkCircle.setAttribute('status','not-done');
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
