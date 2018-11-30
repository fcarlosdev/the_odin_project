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

/***/ "./src/controllers/todocontroller.js":
/*!*******************************************!*\
  !*** ./src/controllers/todocontroller.js ***!
  \*******************************************/
/*! exports provided: todoController */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"todoController\", function() { return todoController; });\nconst todoController = (app) => {\n\n  let todoFactory = app.todoFactory;\n\n  const newTodo = (title) => {\n    return todoFactory.Todo(title);\n  }\n\n  const newTask = (taskData) => {\n    return todoFactory.Task(taskData.title, taskData.description,\n       taskData.dueDate, taskData.priority);\n  }\n\n  return { newTodo, newTask };\n\n};\n\n\n\n\n//# sourceURL=webpack:///./src/controllers/todocontroller.js?");

/***/ }),

/***/ "./src/css/main.css":
/*!**************************!*\
  !*** ./src/css/main.css ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("// extracted by mini-css-extract-plugin\n\n//# sourceURL=webpack:///./src/css/main.css?");

/***/ }),

/***/ "./src/factories/todoFactory.js":
/*!**************************************!*\
  !*** ./src/factories/todoFactory.js ***!
  \**************************************/
/*! exports provided: Todo, Task */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"Todo\", function() { return Todo; });\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"Task\", function() { return Task; });\nconst Todo = (name) => {\n\n  let tasks = [];\n\n  const getName = () => name;\n\n  const addTask = (task) => {\n    tasks.push(task);\n  }\n\n  const getTasks = () => {\n    return tasks;\n  }\n\n  const hasAnyTask = () => {\n    return (tasks.length > 0);\n  }\n\n  const removeTask = (task) => {\n\n    let pos = tasks.indexOf(task);\n\n    if (pos != null) {\n      tasks.splice(pos,1);\n      return true;\n    }\n    return false;\n  }\n  return {\n    getName, getTasks, addTask, removeTask,\n    hasAnyTask\n  }\n}\n\nconst Task = (title, description, dueDate, priority) => {\n\n  const getTitle = () => title;\n  const getDescription = () => description;\n  const getDueDate = () => dueDate;\n  const getPriority = () => priority;\n\n  return {\n    getTitle, getDescription, getDueDate, getPriority\n  }\n\n}\n\n\n\n\n//# sourceURL=webpack:///./src/factories/todoFactory.js?");

/***/ }),

/***/ "./src/images sync \\.(png|svg|jpg|gif|jpeg)$":
/*!****************************************************************!*\
  !*** ./src/images sync nonrecursive \.(png|svg|jpg|gif|jpeg)$ ***!
  \****************************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("var map = {\n\t\"./circle-regular.svg\": \"./src/images/circle-regular.svg\",\n\t\"./circle-solid.svg\": \"./src/images/circle-solid.svg\"\n};\n\n\nfunction webpackContext(req) {\n\tvar id = webpackContextResolve(req);\n\treturn __webpack_require__(id);\n}\nfunction webpackContextResolve(req) {\n\tvar id = map[req];\n\tif(!(id + 1)) { // check for number or string\n\t\tvar e = new Error(\"Cannot find module '\" + req + \"'\");\n\t\te.code = 'MODULE_NOT_FOUND';\n\t\tthrow e;\n\t}\n\treturn id;\n}\nwebpackContext.keys = function webpackContextKeys() {\n\treturn Object.keys(map);\n};\nwebpackContext.resolve = webpackContextResolve;\nmodule.exports = webpackContext;\nwebpackContext.id = \"./src/images sync \\\\.(png|svg|jpg|gif|jpeg)$\";\n\n//# sourceURL=webpack:///./src/images_sync_nonrecursive_\\.(png%7Csvg%7Cjpg%7Cgif%7Cjpeg)$?");

/***/ }),

/***/ "./src/images/circle-regular.svg":
/*!***************************************!*\
  !*** ./src/images/circle-regular.svg ***!
  \***************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("module.exports = __webpack_require__.p + \"images/circle-regular.svg\";\n\n//# sourceURL=webpack:///./src/images/circle-regular.svg?");

/***/ }),

/***/ "./src/images/circle-solid.svg":
/*!*************************************!*\
  !*** ./src/images/circle-solid.svg ***!
  \*************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("module.exports = __webpack_require__.p + \"images/circle-solid.svg\";\n\n//# sourceURL=webpack:///./src/images/circle-solid.svg?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _css_main_css__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./css/main.css */ \"./src/css/main.css\");\n/* harmony import */ var _css_main_css__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(_css_main_css__WEBPACK_IMPORTED_MODULE_0__);\n/* harmony import */ var _util_loadImages_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./util/loadImages.js */ \"./src/util/loadImages.js\");\n/* harmony import */ var _factories_todoFactory_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./factories/todoFactory.js */ \"./src/factories/todoFactory.js\");\n/* harmony import */ var _controllers_todocontroller_js__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ./controllers/todocontroller.js */ \"./src/controllers/todocontroller.js\");\n\n\n\n\n\n_util_loadImages_js__WEBPACK_IMPORTED_MODULE_1__[\"importImages\"]();\n\nlet todoId  = 1;\nlet appView = document.querySelector('.container');\n\nlet addTodo     = appView.querySelector('#add-todo');\nlet todoTxtName = appView.querySelector('#txt-n-list');\nlet todos       = appView.querySelector('.projects-container');\nlet todoTasks   = appView.querySelector('#todo-tasks');\nlet todoTitle   = appView.querySelector('#todo-title');\nlet tdName      = appView.querySelector('#title-name');\nlet tdNewTask   = appView.querySelector('#new-task');\n\nlet controller = null;\n\naddTodo.addEventListener('click', function() {\n  newTodo(todoTxtName.value);\n});\n\ntodoTxtName.addEventListener('keydown', function(event) {\n  if (event.key === \"Enter\") {\n    newTodo(todoTxtName.value);\n  }\n});\n\n\nconst newTodo = (todoName) => {\n  controller = Object(_controllers_todocontroller_js__WEBPACK_IMPORTED_MODULE_3__[\"todoController\"])( { todoFactory: _factories_todoFactory_js__WEBPACK_IMPORTED_MODULE_2__ } );\n  let todo = controller.newTodo(todoName);\n\n  let todoDiv = document.createElement('div');\n  todoDiv.setAttribute('id',todoId++);\n  todoDiv.classList.add('project');\n  todoDiv.textContent = todo.getName();\n  todos.appendChild(todoDiv);\n  todoTxtName.value = '';\n\n  todoDiv.addEventListener('click',function() {\n\n      let lkNewTask = document.createElement('a');\n      lkNewTask.setAttribute('ur','#');\n      lkNewTask.style.cursor = 'pointer';\n      lkNewTask.textContent = \"+\";\n\n      lkNewTask.addEventListener('click',function() {\n        let newTaskDiv                   = document.createElement('div');\n        newTaskDiv.style.width           = \"100%\";\n        newTaskDiv.style.display         = \"flex\";\n        newTaskDiv.justifyContent        = \"space-between\";\n        newTaskDiv.style.paddingTop      = \"10px\";\n\n\n        let newTaskDiv1                  = document.createElement('div');\n        newTaskDiv1.style.width          = \"20%\";\n        newTaskDiv1.style.marginRight    = \"20px\";\n\n        let taskTitleInput               = document.createElement('input');\n        taskTitleInput.placeholder       = \"Task Title\";\n        taskTitleInput.style.width       = \"100%\";\n        taskTitleInput.classList.add(\"input-data\");\n        newTaskDiv1.appendChild(taskTitleInput);\n\n        let newTaskDiv2                    = document.createElement('div');\n        newTaskDiv2.style.width            = \"45%\";\n        newTaskDiv2.style.marginRight      = \"20px\";\n\n        let taskDescTextArea               = document.createElement('input');\n        taskDescTextArea.placeholder       = \"Task description\";\n        taskDescTextArea.style.width       = \"100%\";\n        taskDescTextArea.classList.add(\"input-data\");\n        newTaskDiv2.appendChild(taskDescTextArea);\n\n        let newTaskDiv3                    = document.createElement('div');\n        newTaskDiv3.style.width            = \"10%\";\n        newTaskDiv3.style.marginRight      = \"20px\";\n\n        let taskDueDateInput               = document.createElement('input');\n        taskDueDateInput.placeholder       = \"Due Date\";\n        taskDueDateInput.style.width       = \"100%\";\n        taskDueDateInput.classList.add(\"input-data\");\n        newTaskDiv3.appendChild(taskDueDateInput);\n\n        let newTaskDiv4                     = document.createElement('div');\n        newTaskDiv4.style.width             = \"6%\";\n        newTaskDiv4.style.marginRight      = \"10px\";\n\n        let taskPrioritSelect               = document.createElement('select');\n        taskPrioritSelect.style.width       = \"100%\";\n        taskPrioritSelect.classList.add(\"input-data\");\n        newTaskDiv4.appendChild(taskPrioritSelect);\n\n        let optionDefault = document.createElement(\"option\");\n        let optionLow = document.createElement(\"option\");\n        let optionMedium = document.createElement(\"option\");\n        let optionHight = document.createElement(\"option\");\n\n        optionDefault.text = \"Priority\";\n        optionLow.text     = \"Low\";\n        optionMedium.text  = \"Medium\";\n        optionHight.text   = \"Hight\";\n\n        taskPrioritSelect.add(optionDefault);\n        taskPrioritSelect.add(optionLow);\n        taskPrioritSelect.add(optionMedium);\n        taskPrioritSelect.add(optionHight);\n\n        newTaskDiv.appendChild(newTaskDiv1);\n        newTaskDiv.appendChild(newTaskDiv2);\n        newTaskDiv.appendChild(newTaskDiv3);\n        newTaskDiv.appendChild(newTaskDiv4);\n\n        let btnSaveDiv = document.createElement('div');\n        btnSaveDiv.style.width = \"4%\";\n\n        let btnCancelDiv = document.createElement('div');\n        btnCancelDiv.style.width = \"4%\";        \n\n        let btnSave = document.createElement('button');\n        btnSave.style.width = \"100%\";\n        btnSave.style.height = \"100%\";\n        btnSave.textContent = \"Save\";\n\n        let btnCancel = document.createElement('button');\n        btnCancel.style.width = \"100%\";\n        btnCancel.style.height = \"100%\";\n        btnCancel.textContent = \"Cancel\";\n\n\n\n        btnSaveDiv.appendChild(btnSave);\n        btnCancelDiv.appendChild(btnCancel);\n\n        newTaskDiv.appendChild(btnSaveDiv);\n        newTaskDiv.appendChild(btnCancelDiv);\n\n        todoTasks.appendChild(newTaskDiv);\n\n      })\n\n    tdName.textContent = todo.getName();\n    tdNewTask.appendChild(lkNewTask);\n    todoTitle.appendChild(tdName);\n    todoTitle.appendChild(tdNewTask);\n    todoTitle.style.display ='flex';\n\n    if (todo.hasAnyTask()) {\n        let taskList             = document.createElement('ul');\n        taskList.style.listStyle = 'none';\n        taskList.style.margin    = '0';\n        taskList.style.padding   = '0';\n        taskList.style.display   = '';\n\n        todo.getTasks().forEach(function(task) {\n\n            let taskItem    = document.createElement('li');\n            let checkCircle = document.createElement('img');\n            checkCircle.src = 'images/circle-regular.svg';\n            checkCircle.setAttribute('status','not-done');\n            checkCircle.classList.add('img');\n\n            checkCircle.addEventListener('click', function() {\n\n              if (checkCircle.getAttribute('status') === 'not-done') {\n                checkCircle.src = 'images/circle-solid.svg'\n                checkCircle.setAttribute('status','done');\n              } else {\n                checkCircle.src = 'images/circle-regular.svg';\n                checkCircle.setAttribute('status','not-done');\n              }\n            });\n\n            taskItem.appendChild(checkCircle);\n            taskItem.append(task.getTitle());\n            taskList.appendChild(taskItem);\n        });\n        todoTasks.appendChild(taskList);\n      }\n  });\n}\n\n// const showTodoDetails = (selectedTodo) => {\n//\n// }\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/util/loadImages.js":
/*!********************************!*\
  !*** ./src/util/loadImages.js ***!
  \********************************/
/*! exports provided: importImages */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"importImages\", function() { return importImages; });\nconst importImages = (from) => {\n  let req = __webpack_require__(\"./src/images sync \\\\.(png|svg|jpg|gif|jpeg)$\");\n  req.keys().forEach(function(key){\n      req(key);\n  });\n  return req;\n}\n\n\n\n\n//# sourceURL=webpack:///./src/util/loadImages.js?");

/***/ })

/******/ });