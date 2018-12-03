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

/***/ "./src/components/linkNewTask.js":
/*!***************************************!*\
  !*** ./src/components/linkNewTask.js ***!
  \***************************************/
/*! exports provided: linkNewTask */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"linkNewTask\", function() { return linkNewTask; });\n/* harmony import */ var _components_taskForm_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ../components/taskForm.js */ \"./src/components/taskForm.js\");\n\n\nconst linkNewTask = (appView,controller) => {\n\n  const create = (todoTasks, taskId) => {\n\n    let lkNewTask = appView.createElement('a');\n    lkNewTask.setAttribute('url','#');\n    lkNewTask.style.cursor = 'pointer';\n    lkNewTask.textContent = \"+\";\n\n    lkNewTask.addEventListener('click',function() {\n      if (appView.querySelector(\".task-form\") == undefined) { //Only one form at time.\n        todoTasks.appendChild(Object(_components_taskForm_js__WEBPACK_IMPORTED_MODULE_0__[\"taskForm\"])(appView).newForm(controller,todoTasks,taskId));\n      }\n    });\n\n    return lkNewTask;\n  }\n\n  return { create };\n}\n\n\n\n\n//# sourceURL=webpack:///./src/components/linkNewTask.js?");

/***/ }),

/***/ "./src/components/taskForm.js":
/*!************************************!*\
  !*** ./src/components/taskForm.js ***!
  \************************************/
/*! exports provided: taskForm */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"taskForm\", function() { return taskForm; });\n/* harmony import */ var _util_util_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ../util/util.js */ \"./src/util/util.js\");\n\n\nconst taskForm = (app) => {\n\n  const elementFactory = Object(_util_util_js__WEBPACK_IMPORTED_MODULE_0__[\"elementUtil\"])(app);\n\n  const createElement = (type, value, attributes, classes, styles) => {\n    let newElement = elementFactory.create(type,value);\n        elementFactory.applyAttributesTo(newElement,attributes);\n        elementFactory.applyClassesTo(newElement,classes);\n        elementFactory.applyStylesTo(newElement,styles);\n    return newElement;\n  }\n\n  const getPropertiesFrom = (formContainer) => {\n\n    let formContainers = {\n      \"titleBox\":{ type: \"div\", value: \"\", attributes: {}, classes: [],\n                 styles: {\"width:\": \"20%\", \"margin-right:\": \"20px\"} },\n      \"descriptionBox\":{type: \"div\", value: \"\", attributes: {}, classes: [],\n                        styles: {\"width:\": \"45%\", \"margin-right:\": \"20px\"}},\n      \"dueDateBox\": {type: \"div\", value: \"\", attributes: {}, classes: [],\n                   styles: {\"width:\": \"10%\", \"margin-right:\": \"20px\"}},\n      \"priorityBox\":{type: \"div\", value: \"\", attributes: {}, classes: [],\n                   styles: {\"width:\": \"10%\", \"margin-right:\": \"10px\"}}\n    }\n    return formContainers[formContainer];\n  }\n\n  const getInputProperties = (input) => {\n\n    const inputProperties = {\n      \"titleTxt\": {\n           type:\"input\", value:\"\",\n           attributes:{ \"id\": \"task-title\", \"placeholder\": \"Task Title\" },\n           classes:[\"input-data\"], styles: {\"width:\": \"100%\"}\n       },\n      \"descriptionTxt\": {\n        type:\"input\", value:\"\",\n        attributes:{ \"id\": \"task-desc\", \"placeholder\": \"Task description\" },\n        classes:[\"input-data\"], styles: {\"width:\": \"100%\"}\n      },\n      \"dueDateTxt\": {\n        type:\"input\", value:\"\",\n        attributes:{ \"id\": \"task-date\", \"placeholder\": \"Due Date\" },\n        classes:[\"input-data\"], styles: {\"width:\": \"100%\"}\n      },\n      \"priorityTxt\": {\n        type: \"select\", value: \"\", attributes: { \"id\": \"sel-priority\" },\n        classes:[\"input-data\"],\n        styles: {\"width:\": \"100%\", \"background-color:\": \"#fff\", \"color:\": \"#ccc\"}\n      }\n    }\n    return inputProperties[input];\n  }\n\n  const newFormField = (fieldName) => {\n\n    let fieldBox = getPropertiesFrom(fieldName+\"Box\");\n    let newField = createElement(fieldBox.type,fieldBox.value,fieldBox.attributes,\n                                 fieldBox.classes,fieldBox.styles);\n\n    let field = getInputProperties(fieldName+\"Txt\");\n    newField.appendChild(createElement(field.type,field.value,field.attributes,\n                                       field.classes,field.styles));\n    return newField;\n  }\n\n  const configSelectField = (fieldName) => {\n\n    fieldName.addEventListener('change', function() {\n      fieldName.style.color =\n        (fieldName.selectedIndex > 0) ? \"black\" : \"#ccc\";\n    });\n\n    [\"Priority\", \"Low\", \"Medium\", \"High\"].forEach(function(op){\n      let option = app.createElement(\"option\");\n      if (op !== \"Priority\") {\n        option.text = option.value = op;\n      } else {\n        option.text = op;\n      }\n      fieldName.add(option);\n    });\n  }\n\n  const creatTask = (container) => {\n    let title    = container.children[0].children[0].value;\n    let descr    = container.children[1].children[0].value;\n    let date     = container.children[2].children[0].value;\n    let priority = container.children[3].children[0].value;\n    return { title: title, description: descr, dueDate: date, priority: priority };\n  }\n\n  const newForm = (controller, todoTasks, taskId) => {\n\n      let container = createElement(\"div\",\"\",{},[\"task-form\"],{});\n\n      let divTitle    = newFormField(\"title\");\n      let divDesc     = newFormField(\"description\");\n      let divDate     = newFormField(\"dueDate\");\n      let divPriority = newFormField(\"priority\");\n      configSelectField(divPriority.children[0]);\n\n      container.appendChild(divTitle);\n      container.appendChild(divDesc);\n      container.appendChild(divDate);\n      container.appendChild(divPriority);\n\n      let btnSaveDiv = createElement(\"div\",\"\",{},[],{\"width:\":\"auto\",\"margin-right:\":\"10px;\"});\n      let btnCancelDiv = createElement(\"div\",\"\",{},[],{\"width:\":\"auto\"});\n\n      let btnSave = createElement(\"button\",\"Save\",{},[\"button-blue\"],{\"width:\":\"100%\",\"height:\": \"100%\"});\n\n      btnSave.addEventListener('click',function() {\n\n        let task = controller.newTask(creatTask(container));\n\n        let tasksLine = document.createElement('div');\n        tasksLine.style.display = \"flex\";\n        tasksLine.style.justifyContent = \"space-between\";\n\n        Object.keys(task).forEach(function(key){\n            let value = task[key]()\n            if (key != \"getTitle\") {\n              tasksLine.appendChild(createElement(\"div\",value,{},[],{}))\n            } else {\n              tasksLine.appendChild(createElement(\"div\",value,{\"id\": taskId++},[],{}))\n            }\n        });\n\n        Array.from(document.querySelectorAll(\".task-form\")).forEach(function(line){\n          line.remove();\n        })\n        todoTasks.appendChild(tasksLine);\n        // let todo = controller.newTodo(todoName);\n        // todo.addTask(task);\n        //Has to return to the controller\n      })\n\n      let btnCancel = document.createElement('button');\n      btnCancel.style.width = \"100%\";\n      btnCancel.style.height = \"100%\";\n      btnCancel.textContent = \"Cancel\";\n      btnCancel.classList.add(\"button-red\");\n\n      btnCancel.addEventListener('click', function() {\n        Array.from(document.querySelectorAll(\".task-form\")).forEach(function(line){\n          line.remove();\n        })\n      })\n\n      btnSaveDiv.appendChild(btnSave);\n      btnCancelDiv.appendChild(btnCancel);\n\n      container.appendChild(btnSaveDiv);\n      container.appendChild(btnCancelDiv);\n\n      return container;\n  }\n\n  return { newForm }\n\n}\n\n\n\n\n//# sourceURL=webpack:///./src/components/taskForm.js?");

/***/ }),

/***/ "./src/components/taskList.js":
/*!************************************!*\
  !*** ./src/components/taskList.js ***!
  \************************************/
/*! exports provided: tasks */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"tasks\", function() { return tasks; });\nconst tasks = (app) => {\n\n  const showTasks = (todo) => {\n\n    let taskList             = app.createElement('ul');\n    taskList.style.listStyle = 'none';\n    taskList.style.margin    = '0';\n    taskList.style.padding   = '0';\n    taskList.style.display   = 'flex';\n    taskList.style.justifyContent = \"space-between\";\n\n    todo.getTasks().forEach(function(task) {\n\n        let taskItem    = app.createElement('li');\n        let checkCircle = app.createElement('img');\n        checkCircle.src = 'images/circle-regular.svg';\n        checkCircle.setAttribute('status','not-done');\n        checkCircle.classList.add('img');\n\n        let taskItemDesc = app.createElement('li');\n        let taskItemDate = app.createElement('li');\n        let taskItemPriority = app.createElement('li');\n\n        checkCircle.addEventListener('click', function() {\n\n          if (checkCircle.getAttribute('status') === 'not-done') {\n            checkCircle.src = 'images/circle-solid.svg'\n            checkCircle.setAttribute('status','done');\n          } else {\n            checkCircle.src = 'images/circle-regular.svg';\n            checkCircle.setAttribute('status','not-done');\n          }\n        });\n\n        taskItem.appendChild(checkCircle);\n        taskItem.append(task.getTitle());\n        taskItemDesc.append(task.getDescription());\n        taskItemDate.append(task.getDueDate());\n        taskItemPriority.append(task.getPriority());\n        taskList.appendChild(taskItem);\n        taskList.appendChild(taskItemDesc);\n        taskList.appendChild(taskItemDate);\n        taskList.appendChild(taskItemPriority);\n    });\n    // todoTasks.appendChild(taskList);\n    return taskList\n  }\n\n  return { showTasks }\n\n}\n\n\n\n\n//# sourceURL=webpack:///./src/components/taskList.js?");

/***/ }),

/***/ "./src/controllers/todocontroller.js":
/*!*******************************************!*\
  !*** ./src/controllers/todocontroller.js ***!
  \*******************************************/
/*! exports provided: todoController */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"todoController\", function() { return todoController; });\nconst todoController = (app) => {\n\n  let todoFactory = app.todoFactory;\n\n  const newTodo = (title) => {\n    return todoFactory.Todo(title);\n  }\n\n  const newTask = (taskData) => {\n    return todoFactory.Task(taskData.title, taskData.description,\n       taskData.dueDate, taskData.priority);\n  }\n\n  const getTasks = (todo) => {\n    return todo.getTasks();\n  }\n\n\n  return { newTodo, newTask, getTasks };\n\n};\n\n\n\n\n//# sourceURL=webpack:///./src/controllers/todocontroller.js?");

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
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _css_main_css__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./css/main.css */ \"./src/css/main.css\");\n/* harmony import */ var _css_main_css__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(_css_main_css__WEBPACK_IMPORTED_MODULE_0__);\n/* harmony import */ var _util_loadImages_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./util/loadImages.js */ \"./src/util/loadImages.js\");\n/* harmony import */ var _factories_todoFactory_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./factories/todoFactory.js */ \"./src/factories/todoFactory.js\");\n/* harmony import */ var _controllers_todocontroller_js__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ./controllers/todocontroller.js */ \"./src/controllers/todocontroller.js\");\n/* harmony import */ var _components_linkNewTask_js__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! ./components/linkNewTask.js */ \"./src/components/linkNewTask.js\");\n/* harmony import */ var _components_taskList_js__WEBPACK_IMPORTED_MODULE_5__ = __webpack_require__(/*! ./components/taskList.js */ \"./src/components/taskList.js\");\n\n\n\n\n// import {taskForm} from './components/taskForm.js';\n\n\n\n_util_loadImages_js__WEBPACK_IMPORTED_MODULE_1__[\"importImages\"]();\n\nlet todoId  = 1;\nlet taskId  = 1;\nlet numberOfTaskForms = 0;\nlet appView = document.querySelector('.container');\n\nlet addTodo     = appView.querySelector('#add-todo');\nlet todoTxtName = appView.querySelector('#txt-n-list');\nlet todos       = appView.querySelector('.projects-container');\nlet todoTasks   = appView.querySelector('#todo-tasks');\nlet todoTitle   = appView.querySelector('#todo-title');\nlet tdName      = appView.querySelector('#title-name');\nlet tdNewTask   = appView.querySelector('#new-task');\n\nlet controller = null;\n\naddTodo.addEventListener('click', function() {\n  newTodo(todoTxtName.value);\n});\n\ntodoTxtName.addEventListener('keydown', function(event) {\n  if (event.key === \"Enter\") {\n    newTodo(todoTxtName.value);\n  }\n});\n\n\nconst newTodo = (todoName) => {\n  controller = Object(_controllers_todocontroller_js__WEBPACK_IMPORTED_MODULE_3__[\"todoController\"])( { todoFactory: _factories_todoFactory_js__WEBPACK_IMPORTED_MODULE_2__ } );\n  let todo = controller.newTodo(todoName);\n\n  let todoDiv = document.createElement('div');\n  todoDiv.setAttribute('id',todoId++);\n  todoDiv.classList.add('project');\n  todoDiv.textContent = todo.getName();\n  todos.appendChild(todoDiv);\n  todoTxtName.value = '';\n\n  todoDiv.addEventListener('click',function() {\n\n    todoTasks.innerHTML = \"\";\n    tdNewTask.innerHTML = \"\";\n\n    tdName.textContent = todo.getName();\n    tdNewTask.appendChild(Object(_components_linkNewTask_js__WEBPACK_IMPORTED_MODULE_4__[\"linkNewTask\"])(document,controller).create(numberOfTaskForms,todoTasks,taskId));\n    todoTitle.appendChild(tdName);\n    todoTitle.appendChild(tdNewTask);\n    todoTitle.style.display ='flex';\n\n    if (todo.hasAnyTask()) {\n      todoTasks.appendChild(task(document).showTasks(todo));\n      }\n   });\n}\n\n// const showTodoDetails = (selectedTodo) => {\n//\n// }\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/util/loadImages.js":
/*!********************************!*\
  !*** ./src/util/loadImages.js ***!
  \********************************/
/*! exports provided: importImages */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"importImages\", function() { return importImages; });\nconst importImages = (from) => {\n  let req = __webpack_require__(\"./src/images sync \\\\.(png|svg|jpg|gif|jpeg)$\");\n  req.keys().forEach(function(key){\n      req(key);\n  });\n  return req;\n}\n\n\n\n\n//# sourceURL=webpack:///./src/util/loadImages.js?");

/***/ }),

/***/ "./src/util/util.js":
/*!**************************!*\
  !*** ./src/util/util.js ***!
  \**************************/
/*! exports provided: elementUtil */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"elementUtil\", function() { return elementUtil; });\nconst elementUtil = (app) => {\n\n  let element;\n\n  const create = (type, value) => {\n    element = document.createElement(type);\n    element.textContent = value;\n    return element;\n  }\n\n  const applyAttributesTo = (element, attributes) => {\n\n    if (attributes != null) {\n      const attributesKeys = Object.keys(attributes);\n      if (attributesKeys.length > 0) {\n        attributesKeys.forEach(function(key) {\n          element.setAttribute(key, attributes[key]);\n        });\n      }\n    }\n    return element;\n  }\n\n\n  const applyClassesTo = (element, classes) => {\n\n    if (classes != null && classes.length > 0) {\n      classes.forEach(function(className) {\n        element.classList.add(className);\n      });\n    }\n    return element;\n  }\n\n  const applyStylesTo = (element, styles) => {\n    if (styles != null) {\n      Object.keys(styles).forEach(function(styleName){\n        element.style.cssText += styleName+styles[styleName];\n      })\n    }\n    return element;\n  };\n\n\n  return {\n    create, applyAttributesTo, applyClassesTo,\n    applyStylesTo\n  };\n};\n\n\n\n\n//# sourceURL=webpack:///./src/util/util.js?");

/***/ })

/******/ });