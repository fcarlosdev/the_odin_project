import './css/main.css';
// import * Todo from './modules/todoFactory.js';
import {todoFactory} from './modules/todoFactory.js'

const todoOne = todoFactory("Todo 1", "Teste of todo", "12/11/2018", "media");

var div = document.createElement('div');

div.innerHTML += "Todo list <br>";
div.innerHTML += "<hr>";
div.innerHTML += "Title: " + todoOne.getTitle() +"<br>";
div.innerHTML += "Description: " + todoOne.getDescription() +"<br>";
div.innerHTML += "DueDate: " + todoOne.getDueDate() +"<br>";
div.innerHTML += "Priority: " + todoOne.getPriority();

document.querySelector("body").appendChild(div);
