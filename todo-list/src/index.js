import './css/main.css';
import * as Images from './util/loadImages.js';
import * as Factory from './factories/todoFactory.js';
import {todoController} from './controllers/todocontroller.js';

Images.importImages();

let todoId  = 1;
let taskId  = 1;
let taskForm = 0;
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

    tdNewTask.innerHTML = "";

    let lkNewTask = document.createElement('a');
    lkNewTask.setAttribute('ur','#');
    lkNewTask.style.cursor = 'pointer';
    lkNewTask.textContent = "+";
    lkNewTask.addEventListener('click',function() {
      if (taskForm == 0) { //Only one form at time.
        let newTaskDiv                   = document.createElement('div');
        newTaskDiv.classList.add("task-form");

        let newTaskDiv1                  = document.createElement('div');
        newTaskDiv1.style.width          = "20%";
        newTaskDiv1.style.marginRight    = "20px";

        let taskTitleInput               = document.createElement('input');
        taskTitleInput.placeholder       = "Task Title";
        taskTitleInput.style.width       = "100%";
        taskTitleInput.classList.add("input-data");
        taskTitleInput.setAttribute("id","task-title");
        newTaskDiv1.appendChild(taskTitleInput);

        let newTaskDiv2                    = document.createElement('div');
        newTaskDiv2.style.width            = "45%";
        newTaskDiv2.style.marginRight      = "20px";

        let taskDescTextArea               = document.createElement('input');
        taskDescTextArea.placeholder       = "Task description";
        taskDescTextArea.style.width       = "100%";
        taskDescTextArea.classList.add("input-data");
        newTaskDiv2.appendChild(taskDescTextArea);

        let newTaskDiv3                    = document.createElement('div');
        newTaskDiv3.style.width            = "10%";
        newTaskDiv3.style.marginRight      = "20px";

        let taskDueDateInput               = document.createElement('input');
        taskDueDateInput.placeholder       = "Due Date";
        taskDueDateInput.style.width       = "100%";
        taskDueDateInput.classList.add("input-data");
        newTaskDiv3.appendChild(taskDueDateInput);

        let newTaskDiv4                     = document.createElement('div');
        newTaskDiv4.style.width             = "10%";
        newTaskDiv4.style.marginRight      = "10px";

        let taskPrioritSelect               = document.createElement('select');
        taskPrioritSelect.setAttribute("id","sel-priority");
        taskPrioritSelect.style.width       = "100%";
        taskPrioritSelect.classList.add("input-data");
        taskPrioritSelect.style.backgroundColor = "#fff";
        taskPrioritSelect.style.color = "#ccc";
        newTaskDiv4.appendChild(taskPrioritSelect);

        taskPrioritSelect.addEventListener('change', function() {
          taskPrioritSelect.style.color =
            (taskPrioritSelect.selectedIndex > 0) ? "black" : "#ccc";
        });

        let optionDefault = document.createElement("option");
        let optionLow     = document.createElement("option");
        let optionMedium  = document.createElement("option");
        let optionHight   = document.createElement("option");

        optionDefault.text = "Priority";
        optionLow.text     = "Low";
        optionLow.value    = "Low"
        optionMedium.text  = "Medium";
        optionMedium.value = "Medium";
        optionHight.text   = "Hight";
        optionHight.value  = "Hight";

        taskPrioritSelect.add(optionDefault);
        taskPrioritSelect.add(optionLow);
        taskPrioritSelect.add(optionMedium);
        taskPrioritSelect.add(optionHight);

        newTaskDiv.appendChild(newTaskDiv1);
        newTaskDiv.appendChild(newTaskDiv2);
        newTaskDiv.appendChild(newTaskDiv3);
        newTaskDiv.appendChild(newTaskDiv4);

        let btnSaveDiv               = document.createElement('div');
        btnSaveDiv.style.width       = "auto";
        btnSaveDiv.style.marginRight = "10px";

        let btnCancelDiv         = document.createElement('div');
        btnCancelDiv.style.width = "auto";

        let btnSave           = document.createElement('button');
        btnSave.style.width   = "100%";
        btnSave.style.height  = "100%";
        btnSave.textContent   = "Save";
        btnSave.classList.add("button-blue");

        btnSave.addEventListener('click',function() {

          let taskData  = {
            title: taskTitleInput.value,
            description: taskDescTextArea.value,
            dueDate: taskDueDateInput.value,
            priority: taskPrioritSelect.value
          }

          let task = controller.newTask(taskData);

          let tasksLine = document.createElement('div');
          tasksLine.style.display = "flex";
          tasksLine.style.justifyContent = "space-between";

          let taskTitleDiv = document.createElement('div');
          taskTitleDiv.setAttribute('id',taskId++);
          taskTitleDiv.textContent = task.getTitle();

          let taskDescDiv = document.createElement('div');
          taskDescDiv.textContent = task.getDescription();

          let taskDueDateDiv = document.createElement('div');
          taskDueDateDiv.textContent = task.getDueDate();

          let taskPriorityDiv = document.createElement('div');
          taskPriorityDiv.textContent = task.getPriority();

          tasksLine.appendChild(taskTitleDiv);
          tasksLine.appendChild(taskDescDiv);
          tasksLine.appendChild(taskDueDateDiv);
          tasksLine.appendChild(taskPriorityDiv);

          Array.from(document.querySelectorAll(".task-form")).forEach(function(line){
            line.remove();
          })
          todoTasks.appendChild(tasksLine);
          todo.addTask(tasksLine);
          taskForm  = 0;
        })

        let btnCancel = document.createElement('button');
        btnCancel.style.width = "100%";
        btnCancel.style.height = "100%";
        btnCancel.textContent = "Cancel";
        btnCancel.classList.add("button-red");

        btnCancel.addEventListener('click', function() {
          Array.from(document.querySelectorAll(".task-form")).forEach(function(line){
            line.remove();
          })
          taskForm = 0;
        })

        btnSaveDiv.appendChild(btnSave);
        btnCancelDiv.appendChild(btnCancel);

        newTaskDiv.appendChild(btnSaveDiv);
        newTaskDiv.appendChild(btnCancelDiv);

        todoTasks.appendChild(newTaskDiv);

         taskForm += 1;
        }

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
