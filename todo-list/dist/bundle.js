/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/css/main.css":
/*!**************************!*\
  !*** ./src/css/main.css ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("// extracted by mini-css-extract-plugin\n\n//# sourceURL=webpack:///./src/css/main.css?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _css_main_css__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./css/main.css */ \"./src/css/main.css\");\n/* harmony import */ var _css_main_css__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(_css_main_css__WEBPACK_IMPORTED_MODULE_0__);\n/* harmony import */ var _modules_todoFactory_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./modules/todoFactory.js */ \"./src/modules/todoFactory.js\");\n/* harmony import */ var _modules_project_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./modules/project.js */ \"./src/modules/project.js\");\n\n// import * Todo from './modules/todoFactory.js';\n\n\n\nconst todoOne = Object(_modules_todoFactory_js__WEBPACK_IMPORTED_MODULE_1__[\"todoFactory\"])(\"Todo 1\", \"Teste of todo\", \"12/11/2018\", \"medium\");\nconst todoTwo = Object(_modules_todoFactory_js__WEBPACK_IMPORTED_MODULE_1__[\"todoFactory\"])(\"Todo 2\", \"JavaScript OO\", \"15/11/2018\", \"medium\");\n\nconst myTodoProject = Object(_modules_project_js__WEBPACK_IMPORTED_MODULE_2__[\"projectFactory\"])(\"Learning JavasScript\");\nmyTodoProject.addTodoItem(todoOne);\nmyTodoProject.addTodoItem(todoTwo);\n\nvar div = document.createElement('div');\nlistTodoItems();\ndocument.querySelector(\"body\").appendChild(div);\n\nvar messageDiv = document.createElement('div');\n\nif (myTodoProject.removeTodoItem(todoOne)) {\n  messageDiv.innerHTML += \"Todo: \" + todoOne.getTitle() + \" removed <br>\";\n} else {\n  messageDiv.innerHTML += \"Error to remove \" + todoOne.getTitle() + \"<br>\";\n}\ndiv.innerHTML = \"\";\nmessageDiv.innerHTML += \"<hr>\";\ndocument.querySelector(\"body\").appendChild(messageDiv);\nlistTodoItems();\n\n\nfunction listTodoItems() {\n  div.innerHTML += \"Project: \" + myTodoProject.getName() + \"<br>\";\n  div.innerHTML += \"<hr>\";\n  myTodoProject.getTodoList().forEach(function(item) {\n    div.innerHTML += \"Title: \" + item.getTitle() + \"<br>\";\n    div.innerHTML += \"Description: \" + todoOne.getDescription() +\"<br>\";\n    div.innerHTML += \"DueDate: \" + todoOne.getDueDate() +\"<br>\";\n    div.innerHTML += \"Priority: \" + todoOne.getPriority() +\"<br>\";\n    div.innerHTML += \"<hr>\";\n  });\n}\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/modules/project.js":
/*!********************************!*\
  !*** ./src/modules/project.js ***!
  \********************************/
/*! exports provided: projectFactory */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"projectFactory\", function() { return projectFactory; });\nconst projectFactory = (name) => {\n\n  let todoList = [];\n\n  const getName = () => name;\n\n  const addTodoItem = (item) => {\n    todoList.push(item);\n  }\n\n  const getTodoList = () => {\n    return todoList;\n  }\n\n  const removeTodoItem = (item) => {\n\n    let pos = todoList.indexOf(item);\n\n    if (pos != null) {\n      todoList.splice(pos,1);\n      return true;\n    }\n    return false;\n\n  }\n\n\n  return {\n    getName, getTodoList, addTodoItem, removeTodoItem\n  }\n\n}\n\n\n\n\n//# sourceURL=webpack:///./src/modules/project.js?");

/***/ }),

/***/ "./src/modules/todoFactory.js":
/*!************************************!*\
  !*** ./src/modules/todoFactory.js ***!
  \************************************/
/*! exports provided: todoFactory */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"todoFactory\", function() { return todoFactory; });\n\nconst todoFactory = (title, description, dueDate, priority) => {\n\n  const getTitle = () => title;\n  const getDescription = () => description;\n  const getDueDate = () => dueDate;\n  const getPriority = () => priority;\n\n  return {\n    getTitle, getDescription, getDueDate, getPriority\n  }\n\n}\n\n\n\n\n//# sourceURL=webpack:///./src/modules/todoFactory.js?");

/***/ })

/******/ });