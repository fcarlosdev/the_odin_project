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

/***/ "./src/elements/app-todo.js":
/*!**********************************!*\
  !*** ./src/elements/app-todo.js ***!
  \**********************************/
/*! exports provided: App */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"App\", function() { return App; });\n/* harmony import */ var _todo_element_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./todo-element.js */ \"./src/elements/todo-element.js\");\n\n\nconst App = (() => {\n\n  const newTodoViewElement = (todoName, tagType, todoListTag) => {\n    _todo_element_js__WEBPACK_IMPORTED_MODULE_0__[\"TodoElement\"].generateTodo(todoName,tagType, todoListTag);\n  }\n\n  const newTodoTaskElement = (todo, task) => {\n    let taskList = ViewElements.getElement(\"#tasks\");\n    let taskLine = ViewElements.createElement(\"li\");\n    ViewElements.addClass(taskLine,[\"task-title\"]);\n\n    let taskNameWrapper = ViewElements.createElement(\"div\");\n    ViewElements.addAttributes(taskNameWrapper, {\"id\": generteTaskId(taskList)})\n\n    let taskName = ViewElements.createElement(\"h2\",task.getName());\n\n    let taskDetailsLink = ViewElements.createElement(\"a\",\"Show details\");\n  }\n\n  const generteTaskId = (tasklList) => {\n    taskList.children.length + 1;\n  }\n\n  return { newTodoViewElement, newTodoTaskElement }\n\n})();\n\n\n\n\n//# sourceURL=webpack:///./src/elements/app-todo.js?");

/***/ }),

/***/ "./src/elements/todo-element.js":
/*!**************************************!*\
  !*** ./src/elements/todo-element.js ***!
  \**************************************/
/*! exports provided: TodoElement */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"TodoElement\", function() { return TodoElement; });\n/* harmony import */ var _view_elements_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./view-elements.js */ \"./src/elements/view-elements.js\");\n\n\nconst TodoElement = (() => {\n\n  const generateTodo = (name, todoItemTag, todoListTag) => {\n    let todoItem = _view_elements_js__WEBPACK_IMPORTED_MODULE_0__[\"ViewElements\"].newElement(todoItemTag);\n    let todoList = _view_elements_js__WEBPACK_IMPORTED_MODULE_0__[\"ViewElements\"].getElement(todoListTag);\n    _view_elements_js__WEBPACK_IMPORTED_MODULE_0__[\"ViewElements\"].addAttributes(todoItem, {\"id\": generateTodoId(todoList)});\n    setTodoIdentification(name,todoItem, todoList);\n    attachShowTodoDetaisEvent(todoItem);\n    todoList.appendChild(todoItem);\n  }\n\n  const setTodoIdentification = (name,todoItem, todoList) => {\n\n    let todoName  = _view_elements_js__WEBPACK_IMPORTED_MODULE_0__[\"ViewElements\"].newElement(\"span\");\n    let btRemove  = _view_elements_js__WEBPACK_IMPORTED_MODULE_0__[\"ViewElements\"].newElement(\"span\");\n\n    _view_elements_js__WEBPACK_IMPORTED_MODULE_0__[\"ViewElements\"].setContent(todoName,name);\n    _view_elements_js__WEBPACK_IMPORTED_MODULE_0__[\"ViewElements\"].setContent(btRemove, \"x\");\n    _view_elements_js__WEBPACK_IMPORTED_MODULE_0__[\"ViewElements\"].addClass(btRemove,[\"bt-remove\"]);\n\n    _view_elements_js__WEBPACK_IMPORTED_MODULE_0__[\"ViewElements\"].attachEvent(btRemove, \"click\", e => {\n      todoList.removeChild(todoItem);\n    });\n\n    todoItem.appendChild(todoName);\n    todoItem.appendChild(btRemove);\n  }\n\n  const attachShowTodoDetaisEvent = (todoItem) => {\n\n    _view_elements_js__WEBPACK_IMPORTED_MODULE_0__[\"ViewElements\"].attachEvent(todoItem, \"click\", e => {\n\n      if (e.target.tagName === \"LI\" || e.target.textContent != \"x\") {\n\n        todoHeader = _view_elements_js__WEBPACK_IMPORTED_MODULE_0__[\"ViewElements\"].getElement(\".todo-title\");\n        _view_elements_js__WEBPACK_IMPORTED_MODULE_0__[\"ViewElements\"].applyStyles(todoHeader, {\"display:\":\"flex\"});\n        clearElementChildNodes(todoHeader);\n\n        let btAddTask = _view_elements_js__WEBPACK_IMPORTED_MODULE_0__[\"ViewElements\"].newElement(\"div\",\"Add Task\");\n        _view_elements_js__WEBPACK_IMPORTED_MODULE_0__[\"ViewElements\"].addClass(btAddTask,[\"add-task\"]);\n\n        let removeTodo = _view_elements_js__WEBPACK_IMPORTED_MODULE_0__[\"ViewElements\"].newElement(\"div\",\"Remove\");\n        _view_elements_js__WEBPACK_IMPORTED_MODULE_0__[\"ViewElements\"].addClass(removeTodo, [\"bt-remove\"]);\n        _view_elements_js__WEBPACK_IMPORTED_MODULE_0__[\"ViewElements\"].attachEvent(removeTodo, \"click\", e => {\n          clearElementChildNodes(todoHeader);\n          _view_elements_js__WEBPACK_IMPORTED_MODULE_0__[\"ViewElements\"].applyStyles(todoHeader, {\"display:\":\"none\"});\n        })\n\n        let todoActions = _view_elements_js__WEBPACK_IMPORTED_MODULE_0__[\"ViewElements\"].newElement(\"div\");\n        _view_elements_js__WEBPACK_IMPORTED_MODULE_0__[\"ViewElements\"].addClass(todoActions,[\"todo-actions\"]);\n\n        todoActions.appendChild(_view_elements_js__WEBPACK_IMPORTED_MODULE_0__[\"ViewElements\"].newElement(\"h1\",name));\n        todoActions.appendChild(removeTodo);\n\n        todoHeader.appendChild(todoActions);\n        todoHeader.appendChild(btAddTask);\n\n        _view_elements_js__WEBPACK_IMPORTED_MODULE_0__[\"ViewElements\"].getElement(\".todo-container\").appendChild(todoHeader);\n      }\n    });\n  }\n\n  const clearElementChildNodes = (element) => {\n    while(element.hasChildNodes()) {\n      element.removeChild(element.lastChild);\n    }\n  }\n\n  const generateTodoId = (todosList) => {\n    return todosList.children.length + 1;\n  }\n\n  return { generateTodo }\n\n})();\n\n\n\n\n//# sourceURL=webpack:///./src/elements/todo-element.js?");

/***/ }),

/***/ "./src/elements/view-elements.js":
/*!***************************************!*\
  !*** ./src/elements/view-elements.js ***!
  \***************************************/
/*! exports provided: ViewElements */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"ViewElements\", function() { return ViewElements; });\nconst ViewElements = (() => {\n\n    const newElement = (type,content) => {\n      let element = document.createElement(type);\n          element.textContent = content;\n      return element;\n    }\n\n    const addAttributes = (element, attributes) => {\n      if (element !== \"\" || attributes !== undefined) {\n        Object.keys(attributes).forEach(function(key) {\n          element.setAttribute(key,attributes[key]);\n        });\n        return element;\n      }\n      return null;\n    }\n\n    const addClass = (element, classes) => {\n      element.classList = classes;\n    }\n\n    const getElement = (element) => {\n      return document.querySelector(element);\n    }\n\n    const setContent = (element, value) => {\n      element.textContent = value;\n      return element;\n    }\n\n    const attachEvent = (element, type, behavior) => {\n      element.addEventListener(type, behavior);\n    }\n\n    const applyStyles = (element, styles) => {\n\n      if (styles != undefined) {\n        Object.keys(styles).forEach(function(styleName){\n          element.style.cssText += styleName+styles[styleName];\n        });\n      }\n    }\n\n    return {\n      newElement, addAttributes, getElement, setContent,\n      addClass, attachEvent, applyStyles\n    }\n\n})();\n\n\n\n\n//# sourceURL=webpack:///./src/elements/view-elements.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _util_imports_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./util/imports.js */ \"./src/util/imports.js\");\n/* harmony import */ var _util_imports_js__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(_util_imports_js__WEBPACK_IMPORTED_MODULE_0__);\n/* harmony import */ var _controllers_todoController_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./controllers/todoController.js */ \"./src/controllers/todoController.js\");\n/* harmony import */ var _controllers_taskController_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./controllers/taskController.js */ \"./src/controllers/taskController.js\");\n/* harmony import */ var _elements_app_todo_js__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ./elements/app-todo.js */ \"./src/elements/app-todo.js\");\n\n\n\n\n\nlet txtNomeTodo = document.querySelector(\"#txt-todo-name\");\nlet todosList   = document.querySelector(\".lst-todos\");\n\ndocument.querySelector(\"#new-todo\").addEventListener(\"click\", function() {\n  newTodo();\n});\n\ntxtNomeTodo.addEventListener('keydown', function(event) {\n  if (event.key === \"Enter\") {\n    newTodo();\n  }\n});\n\nconst newTodo = () => {\n  let todo = _controllers_todoController_js__WEBPACK_IMPORTED_MODULE_1__[\"TodoController\"].createTodo(txtNomeTodo.value);\n  _elements_app_todo_js__WEBPACK_IMPORTED_MODULE_3__[\"App\"].newTodoViewElement(todo.getName(),\"li\",\".lst-todos\");\n  // todo.addTask(todo,\"Task One\");\n  // todo.addTask(todo,\"Task Two\");\n  clearTextField(txtNomeTodo);\n}\n\nconst newTask = (todo) => {\n  let task = _controllers_taskController_js__WEBPACK_IMPORTED_MODULE_2__[\"TaskController\"].createTask(\"Task One\", \"Task of tests\", \"01/01/2019\", \"low\");\n  _elements_app_todo_js__WEBPACK_IMPORTED_MODULE_3__[\"App\"].newTodoTaskElement(todo, task);\n}\n\nconst clearTextField = (textField) => {\n  textField.value = \"\";\n}\n\n\n\n// let detailsStatus = \"closed\";\n// const todoView = document.querySelector(\".container\");\n//\n//\n//\n// const btDetails = todoView.querySelector(\".bt-details\");\n//\n// btDetails.addEventListener('click',function() {\n//   let taskTitle = todoView.querySelector(\".task-title\");\n//   let taskDetails = todoView.querySelector(\".task-details\");\n//   if (detailsStatus === \"closed\") {\n//     detailsStatus = \"opened\";\n//     taskDetails.style.display = \"flex\";\n//     taskDetails.style.flexDirection = \"column\";\n//     taskTitle.querySelector(\"a\").textContent = \"Hide details\";\n//   } else {\n//     detailsStatus = \"closed\";\n//     taskDetails.style.display = \"none\";\n//     taskTitle.querySelector(\"a\").textContent = \"Show details\";\n//   }\n// });\n//\n// todoView.querySelector(\"#tsk-done\").addEventListener('click',function(c) {\n//   if (this.checked) {\n//     todoView.querySelector(\".task-done\").style.color = \"#1b7bdf\";\n//     todoView.querySelector(\"#tsk-one\").querySelector('h2').style.textDecoration=\"line-through\";\n//   } else {\n//     todoView.querySelector(\".task-done\").style.color = \"#000\";\n//     todoView.querySelector(\"#tsk-one\").querySelector('h2').style.textDecoration=\"none\";\n//   }\n// })\n\n\n//# sourceURL=webpack:///./src/index.js?");

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

/***/ })

/******/ });