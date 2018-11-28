import './css/main.css';
import * as Factory from './factories/todoFactory.js';
import {TodoController} from './controllers/todocontroller.js';

const app = { factory: Factory};

const controller = TodoController(app);
console.log(project);



// console.log(controller.addItemTo({'Item 1', 'Teste','12/11/2018','medium'}, project));

// const todoOne = todoFactory("Todo 1", "Teste of todo", "12/11/2018", "medium");
// const todoTwo = todoFactory("Todo 2", "JavaScript OO", "15/11/2018", "medium");
//
// const myTodoProject = projectFactory("Todo List");
// myTodoProject.addTodoItem(todoOne);
// myTodoProject.addTodoItem(todoTwo);
//
// let projects = document.querySelector('.projects-container');
// let project = document.createElement('div');
// project.setAttribute('id','1');
// project.classList.add('project');
// project.append(myTodoProject.getName());
// projects.appendChild(project);

// var div = document.createElement('div');
// listTodoItems();
// document.querySelector("body").appendChild(div);
//
// var messageDiv = document.createElement('div');
//
// if (myTodoProject.removeTodoItem(todoOne)) {
//   messageDiv.innerHTML += "Todo: " + todoOne.getTitle() + " removed <br>";
// } else {
//   messageDiv.innerHTML += "Error to remove " + todoOne.getTitle() + "<br>";
// }
// div.innerHTML = "";
// messageDiv.innerHTML += "<hr>";
// document.querySelector("body").appendChild(messageDiv);
// listTodoItems();
//
//
// function listTodoItems() {
//   div.innerHTML += "Project: " + myTodoProject.getName() + "<br>";
//   div.innerHTML += "<hr>";
//   myTodoProject.getTodoList().forEach(function(item) {
//     div.innerHTML += "Title: " + item.getTitle() + "<br>";
//     div.innerHTML += "Description: " + todoOne.getDescription() +"<br>";
//     div.innerHTML += "DueDate: " + todoOne.getDueDate() +"<br>";
//     div.innerHTML += "Priority: " + todoOne.getPriority() +"<br>";
//     div.innerHTML += "<hr>";
//   });
// }
