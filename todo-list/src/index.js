import './css/main.css';
// import * Todo from './modules/todoFactory.js';
import {todoFactory} from './modules/todoFactory.js'

const todoOne = todoFactory("Todo 1", "Teste of todo", "12/11/2018", "media");

console.log(todoOne.getTitle());
