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

/***/ "./src/controllers/taskController.js":
/*!*******************************************!*\
  !*** ./src/controllers/taskController.js ***!
  \*******************************************/
/*! exports provided: TaskController */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"TaskController\", function() { return TaskController; });\n/* harmony import */ var _models_task_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ../models/task.js */ \"./src/models/task.js\");\n\n\nconst TaskController = (() => {\n\n  const createTask = (name, description, dueDate, priority) => {\n    return Task(name,description, dueDate, priority);\n  }\n\n  return { createTask }\n\n})();\n\n\n\n\n//# sourceURL=webpack:///./src/controllers/taskController.js?");

/***/ }),

/***/ "./src/controllers/todoController.js":
/*!*******************************************!*\
  !*** ./src/controllers/todoController.js ***!
  \*******************************************/
/*! exports provided: TodoController */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"TodoController\", function() { return TodoController; });\n/* harmony import */ var _models_todo_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ../models/todo.js */ \"./src/models/todo.js\");\n\n\nconst TodoController = (() => {\n\n  const createTodo = (name) => {\n    return Object(_models_todo_js__WEBPACK_IMPORTED_MODULE_0__[\"Todo\"])(name);\n  }\n\n  return { createTodo };\n})();\n\n\n\n\n//# sourceURL=webpack:///./src/controllers/todoController.js?");

/***/ }),

/***/ "./src/css sync \\.css$":
/*!******************************************!*\
  !*** ./src/css sync nonrecursive \.css$ ***!
  \******************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("var map = {\n\t\"./content.css\": \"./src/css/content.css\",\n\t\"./main.css\": \"./src/css/main.css\",\n\t\"./sidebar.css\": \"./src/css/sidebar.css\"\n};\n\n\nfunction webpackContext(req) {\n\tvar id = webpackContextResolve(req);\n\treturn __webpack_require__(id);\n}\nfunction webpackContextResolve(req) {\n\tvar id = map[req];\n\tif(!(id + 1)) { // check for number or string\n\t\tvar e = new Error(\"Cannot find module '\" + req + \"'\");\n\t\te.code = 'MODULE_NOT_FOUND';\n\t\tthrow e;\n\t}\n\treturn id;\n}\nwebpackContext.keys = function webpackContextKeys() {\n\treturn Object.keys(map);\n};\nwebpackContext.resolve = webpackContextResolve;\nmodule.exports = webpackContext;\nwebpackContext.id = \"./src/css sync \\\\.css$\";\n\n//# sourceURL=webpack:///./src/css_sync_nonrecursive_\\.css$?");

/***/ }),

/***/ "./src/css/content.css":
/*!*****************************!*\
  !*** ./src/css/content.css ***!
  \*****************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("// extracted by mini-css-extract-plugin\n\n//# sourceURL=webpack:///./src/css/content.css?");

/***/ }),

/***/ "./src/css/main.css":
/*!**************************!*\
  !*** ./src/css/main.css ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("// extracted by mini-css-extract-plugin\n\n//# sourceURL=webpack:///./src/css/main.css?");

/***/ }),

/***/ "./src/css/sidebar.css":
/*!*****************************!*\
  !*** ./src/css/sidebar.css ***!
  \*****************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("// extracted by mini-css-extract-plugin\n\n//# sourceURL=webpack:///./src/css/sidebar.css?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _util_imports_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./util/imports.js */ \"./src/util/imports.js\");\n/* harmony import */ var _util_imports_js__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(_util_imports_js__WEBPACK_IMPORTED_MODULE_0__);\n/* harmony import */ var _controllers_todoController_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./controllers/todoController.js */ \"./src/controllers/todoController.js\");\n/* harmony import */ var _controllers_taskController_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./controllers/taskController.js */ \"./src/controllers/taskController.js\");\n/* harmony import */ var _views_viewManager_js__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ./views/viewManager.js */ \"./src/views/viewManager.js\");\n\n\n\n\n\nlet todosList   = document.querySelector(\".lst-todos\");\nlet txtNomeTodo = document.querySelector(\"#txt-todo-name\");\n\ndocument.querySelector(\"#new-todo\").addEventListener(\"click\", function() {\n  let todo                   = _controllers_todoController_js__WEBPACK_IMPORTED_MODULE_1__[\"TodoController\"].createTodo(txtNomeTodo.value);\n  let todoItem               = document.createElement(\"li\");\n  let spanTodoName           = document.createElement(\"span\");\n  let spanTodoSymbol         = document.createElement(\"span\");\n  spanTodoName.textContent   = todo.getName();\n  spanTodoSymbol.textContent = \"x\";\n  todoItem.appendChild(spanTodoName);\n  todoItem.appendChild(spanTodoSymbol);\n  todosList.appendChild(todoItem);\n  // todo.addTask(todo,\"Task One\");\n  // todo.addTask(todo,\"Task Two\");\n  clearTextField(txtNomeTodo);\n});\n\nconst clearTextField = (textField) => {\n  textField.value = \"\";\n}\n\n\n\n// let detailsStatus = \"closed\";\n// const todoView = document.querySelector(\".container\");\n//\n//\n//\n// const btDetails = todoView.querySelector(\".bt-details\");\n//\n// btDetails.addEventListener('click',function() {\n//   let taskTitle = todoView.querySelector(\".task-title\");\n//   let taskDetails = todoView.querySelector(\".task-details\");\n//   if (detailsStatus === \"closed\") {\n//     detailsStatus = \"opened\";\n//     taskDetails.style.display = \"flex\";\n//     taskDetails.style.flexDirection = \"column\";\n//     taskTitle.querySelector(\"a\").textContent = \"Hide details\";\n//   } else {\n//     detailsStatus = \"closed\";\n//     taskDetails.style.display = \"none\";\n//     taskTitle.querySelector(\"a\").textContent = \"Show details\";\n//   }\n// });\n//\n// todoView.querySelector(\"#tsk-done\").addEventListener('click',function(c) {\n//   if (this.checked) {\n//     todoView.querySelector(\".task-done\").style.color = \"#1b7bdf\";\n//     todoView.querySelector(\"#tsk-one\").querySelector('h2').style.textDecoration=\"line-through\";\n//   } else {\n//     todoView.querySelector(\".task-done\").style.color = \"#000\";\n//     todoView.querySelector(\"#tsk-one\").querySelector('h2').style.textDecoration=\"none\";\n//   }\n// })\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/models/task.js":
/*!****************************!*\
  !*** ./src/models/task.js ***!
  \****************************/
/*! exports provided: Task */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"Task\", function() { return Task; });\nconst Task = (() => {\n\n  const getName = () => name;\n  const getDescription = () => description;\n  const getDueDate = () => dueDate;\n  const getPriority = () => priority;\n\n  return { getName, getDescription, getDueDate, getPriority };\n\n})();\n\n\n\n\n//# sourceURL=webpack:///./src/models/task.js?");

/***/ }),

/***/ "./src/models/todo.js":
/*!****************************!*\
  !*** ./src/models/todo.js ***!
  \****************************/
/*! exports provided: Todo */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"Todo\", function() { return Todo; });\nconst Todo = (name) => {\n\n  let tasks = [];\n\n  const getName = () => name;\n\n  const addTask = (todo, task) => {\n    todo.getTasks().push(task);\n  }\n\n  const getTasks = (fromTodo) => {\n    return tasks;\n  }\n\n  return { getName, addTask, getTasks }\n\n};\n\n\n\n\n//# sourceURL=webpack:///./src/models/todo.js?");

/***/ }),

/***/ "./src/util/imports.js":
/*!*****************************!*\
  !*** ./src/util/imports.js ***!
  \*****************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const importCssFiles = () => {\n  let req = __webpack_require__(\"./src/css sync \\\\.css$\");\n  req.keys().forEach(function(key){\n    req(key);\n  });\n}\n\n// const importImagesFiles = () => {\n//   let req = require.context(\"../images\", false, /\\.(png|svg|jpg|gif|jpeg)$/);\n//   req.keys().forEach(function(key){\n//     req(key);\n//   });\n// }\n\n// export { importFiles };\n\n\n//# sourceURL=webpack:///./src/util/imports.js?");

/***/ }),

/***/ "./src/views/viewManager.js":
/*!**********************************!*\
  !*** ./src/views/viewManager.js ***!
  \**********************************/
/*! exports provided: ViewManager */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"ViewManager\", function() { return ViewManager; });\nconst ViewManager = ((appView) => {\n\n  const createElement = (type, value=\"\") => {\n    let element = appView.createElement(type);\n    if (value !== \"\") {\n      element.textContent = value;\n    }\n    return element;\n  }\n\n  const createTodo = (todoList, todoName) => {\n      let todoItem             = document.createElement(\"li\");\n      let spanTdName           = document.createElement(\"span\");\n      let spanTdSymbol         = document.createElement(\"span\");\n      spanTdName.textContent   = todo.getName();\n      spanTdSymbol.textContent = \"x\";\n      todoItem.appendChild(spanTdName);\n      todoItem.appendChild(spanTdSymbol);\n      todosList.appendChild(todoItem);\n  }\n\n})();\n\n\n\n\n//# sourceURL=webpack:///./src/views/viewManager.js?");

/***/ })

/******/ });