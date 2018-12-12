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
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"TaskController\", function() { return TaskController; });\n/* harmony import */ var _models_task_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ../models/task.js */ \"./src/models/task.js\");\n\n\nconst TaskController = (() => {\n\n  const createTask = (name, description, dueDate, priority) => {\n    return Object(_models_task_js__WEBPACK_IMPORTED_MODULE_0__[\"Task\"])(name,description, dueDate, priority);\n  }\n\n  return { createTask }\n\n})();\n\n\n\n\n//# sourceURL=webpack:///./src/controllers/taskController.js?");

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

eval("var map = {\n\t\"./content.css\": \"./src/css/content.css\",\n\t\"./main.css\": \"./src/css/main.css\",\n\t\"./sidebar.css\": \"./src/css/sidebar.css\",\n\t\"./task-form.css\": \"./src/css/task-form.css\",\n\t\"./task-menu.css\": \"./src/css/task-menu.css\"\n};\n\n\nfunction webpackContext(req) {\n\tvar id = webpackContextResolve(req);\n\treturn __webpack_require__(id);\n}\nfunction webpackContextResolve(req) {\n\tvar id = map[req];\n\tif(!(id + 1)) { // check for number or string\n\t\tvar e = new Error(\"Cannot find module '\" + req + \"'\");\n\t\te.code = 'MODULE_NOT_FOUND';\n\t\tthrow e;\n\t}\n\treturn id;\n}\nwebpackContext.keys = function webpackContextKeys() {\n\treturn Object.keys(map);\n};\nwebpackContext.resolve = webpackContextResolve;\nmodule.exports = webpackContext;\nwebpackContext.id = \"./src/css sync \\\\.css$\";\n\n//# sourceURL=webpack:///./src/css_sync_nonrecursive_\\.css$?");

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

/***/ "./src/css/task-form.css":
/*!*******************************!*\
  !*** ./src/css/task-form.css ***!
  \*******************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("// extracted by mini-css-extract-plugin\n\n//# sourceURL=webpack:///./src/css/task-form.css?");

/***/ }),

/***/ "./src/css/task-menu.css":
/*!*******************************!*\
  !*** ./src/css/task-menu.css ***!
  \*******************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("// extracted by mini-css-extract-plugin\n\n//# sourceURL=webpack:///./src/css/task-menu.css?");

/***/ }),

/***/ "./src/elements/app-todo.js":
/*!**********************************!*\
  !*** ./src/elements/app-todo.js ***!
  \**********************************/
/*! exports provided: App */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"App\", function() { return App; });\n/* harmony import */ var _todo_element_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./todo-element.js */ \"./src/elements/todo-element.js\");\n\n\nconst App = (() => {\n\n  const newTodoViewElement = (todoName, tagType, todoListTag) => {\n    _todo_element_js__WEBPACK_IMPORTED_MODULE_0__[\"TodoElement\"].generateTodo(todoName,tagType, todoListTag);\n  }\n\n  const newTodoTaskElement = (todo, task) => {\n    let taskList = ViewElements.getElement(\"#tasks\");\n    let taskLine = ViewElements.createElement(\"li\");\n    ViewElements.addClass(taskLine,[\"task-title\"]);\n\n    let taskNameWrapper = ViewElements.createElement(\"div\");\n    ViewElements.addAttributes(taskNameWrapper, {\"id\": generteTaskId(taskList)})\n\n    let taskName = ViewElements.createElement(\"h2\",task.getName());\n\n    let taskDetailsLink = ViewElements.createElement(\"a\",\"Show details\");\n    taskNameWrapper.appendChild();\n  }\n\n  const generteTaskId = (tasklList) => {\n    taskList.children.length + 1;\n  }\n\n  return { newTodoViewElement, newTodoTaskElement }\n\n})();\n\n\n\n\n//# sourceURL=webpack:///./src/elements/app-todo.js?");

/***/ }),

/***/ "./src/elements/button-add-task.js":
/*!*****************************************!*\
  !*** ./src/elements/button-add-task.js ***!
  \*****************************************/
/*! exports provided: ButtonAddTask */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"ButtonAddTask\", function() { return ButtonAddTask; });\n/* harmony import */ var _view_elements_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./view-elements.js */ \"./src/elements/view-elements.js\");\n/* harmony import */ var _task_form_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./task-form.js */ \"./src/elements/task-form.js\");\n\n\n\nconst ButtonAddTask = (() => {\n\n  const create = () => {\n    return attachNewTodoTaskEvent(\n              _view_elements_js__WEBPACK_IMPORTED_MODULE_0__[\"ViewElements\"].addClass(\n                _view_elements_js__WEBPACK_IMPORTED_MODULE_0__[\"ViewElements\"].newElement(\"div\",\"Add Task\"),[\"add-task\"]\n              )\n          );\n  }\n\n  const attachNewTodoTaskEvent = (element) => {\n    _view_elements_js__WEBPACK_IMPORTED_MODULE_0__[\"ViewElements\"].attachEvent(element, \"click\", e => {\n      _task_form_js__WEBPACK_IMPORTED_MODULE_1__[\"TaskForm\"].createAddTaskForm();            \n    });\n    return element;\n  }\n\n  return { create }\n\n})();\n\n\n\n\n//# sourceURL=webpack:///./src/elements/button-add-task.js?");

/***/ }),

/***/ "./src/elements/task-form.js":
/*!***********************************!*\
  !*** ./src/elements/task-form.js ***!
  \***********************************/
/*! exports provided: TaskForm */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"TaskForm\", function() { return TaskForm; });\n/* harmony import */ var _partials_new_task_form_html__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ../partials/new-task-form.html */ \"./src/partials/new-task-form.html\");\n/* harmony import */ var _partials_new_task_form_html__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(_partials_new_task_form_html__WEBPACK_IMPORTED_MODULE_0__);\n/* harmony import */ var _view_elements_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./view-elements.js */ \"./src/elements/view-elements.js\");\n\n\n\nconst TaskForm = (() => {\n\n  const createAddTaskForm = () => {\n    return attachCloseEventTo(\n             attacheDisplayEventTo(\n               _view_elements_js__WEBPACK_IMPORTED_MODULE_1__[\"ViewElements\"].setContent(\n                 _view_elements_js__WEBPACK_IMPORTED_MODULE_1__[\"ViewElements\"].getElement('#myModal'),_partials_new_task_form_html__WEBPACK_IMPORTED_MODULE_0___default.a\n               )\n             )\n           );\n  }\n\n  const attacheDisplayEventTo = (form) => {\n    return _view_elements_js__WEBPACK_IMPORTED_MODULE_1__[\"ViewElements\"].applyStyles(form, {\"display:\":\"block\"});\n  }\n\n  const attachCloseEventTo = (form) => {\n    console.log(form);\n    _view_elements_js__WEBPACK_IMPORTED_MODULE_1__[\"ViewElements\"].attachEvent(_view_elements_js__WEBPACK_IMPORTED_MODULE_1__[\"ViewElements\"].getElement(\".close\"),\"click\", e => {\n      _view_elements_js__WEBPACK_IMPORTED_MODULE_1__[\"ViewElements\"].applyStyles(form,{\"display:\" :\"none\"});\n    });\n    return form;\n  }\n\n  return { createAddTaskForm }\n\n})();\n\n\n\n\n//# sourceURL=webpack:///./src/elements/task-form.js?");

/***/ }),

/***/ "./src/elements/todo-component.js":
/*!****************************************!*\
  !*** ./src/elements/todo-component.js ***!
  \****************************************/
/*! exports provided: TodoComponent */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"TodoComponent\", function() { return TodoComponent; });\n/* harmony import */ var _view_elements_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./view-elements.js */ \"./src/elements/view-elements.js\");\n/* harmony import */ var _button_add_task_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./button-add-task.js */ \"./src/elements/button-add-task.js\");\n/* harmony import */ var _util_auxiliar_lib_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ../util/auxiliar-lib.js */ \"./src/util/auxiliar-lib.js\");\n\n\n\n\nconst TodoComponent = (() => {\n\n  const create = (id, name) => {\n\n    return attachSelectTodoEvent(\n              _view_elements_js__WEBPACK_IMPORTED_MODULE_0__[\"ViewElements\"].addAttributes(\n                _view_elements_js__WEBPACK_IMPORTED_MODULE_0__[\"ViewElements\"].addClass(\n                  _view_elements_js__WEBPACK_IMPORTED_MODULE_0__[\"ViewElements\"].newElement(\"li\",name), [\"task-title\"]), id\n              )\n           );\n  }\n\n  const attachSelectTodoEvent = (todoElement) => {\n\n    let todoTitleBar = _view_elements_js__WEBPACK_IMPORTED_MODULE_0__[\"ViewElements\"].getElement(\".todo-title\");\n\n    _view_elements_js__WEBPACK_IMPORTED_MODULE_0__[\"ViewElements\"].attachEvent(todoElement, \"click\", e => {\n        _view_elements_js__WEBPACK_IMPORTED_MODULE_0__[\"ViewElements\"].applyStyles(todoTitleBar, {\"display:\":\"flex\"});\n        _view_elements_js__WEBPACK_IMPORTED_MODULE_0__[\"ViewElements\"].addChildrenTo(todoTitleBar,[\n          createWrapperTitleArea(todoElement),\n          createButtonAddTask()\n        ]);\n    });\n\n    return todoElement;\n  }\n\n  const createButtonAddTask = () => {\n    return _button_add_task_js__WEBPACK_IMPORTED_MODULE_1__[\"ButtonAddTask\"].create();\n  }\n\n  const createWrapperTitleArea = (todoElement) => {\n\n    let wrapperTitleArea = _view_elements_js__WEBPACK_IMPORTED_MODULE_0__[\"ViewElements\"].addClass(\n                            _view_elements_js__WEBPACK_IMPORTED_MODULE_0__[\"ViewElements\"].newElement(\"div\"),[\"todo-actions\"]\n                           );\n\n    _view_elements_js__WEBPACK_IMPORTED_MODULE_0__[\"ViewElements\"].addChildrenTo(\n      wrapperTitleArea, [\n        _view_elements_js__WEBPACK_IMPORTED_MODULE_0__[\"ViewElements\"].newElement(\"h1\",todoElement.textContent),\n        createRemoveTodoElement(todoElement)\n      ]\n    );\n\n    return wrapperTitleArea;\n  }\n\n\n  const createRemoveTodoElement = (todoElement) => {\n\n    let removeTodo = _view_elements_js__WEBPACK_IMPORTED_MODULE_0__[\"ViewElements\"].addClass(\n                       _view_elements_js__WEBPACK_IMPORTED_MODULE_0__[\"ViewElements\"].newElement(\"div\",\"Remove\"), [\"bt-remove\"]\n                     );\n\n    _view_elements_js__WEBPACK_IMPORTED_MODULE_0__[\"ViewElements\"].attachEvent(removeTodo, \"click\", e => {\n      _util_auxiliar_lib_js__WEBPACK_IMPORTED_MODULE_2__[\"AuxiliarLib\"].removeChildNodesFrom(todoElement);\n      _util_auxiliar_lib_js__WEBPACK_IMPORTED_MODULE_2__[\"AuxiliarLib\"].removeChildNodesFrom(_view_elements_js__WEBPACK_IMPORTED_MODULE_0__[\"ViewElements\"].getElement(\".todo-container\"));\n      _view_elements_js__WEBPACK_IMPORTED_MODULE_0__[\"ViewElements\"].applyStyles(todoElement, {\"display:\":\"none\"});\n    });\n\n    return removeTodo;\n\n  }\n\n  return { create }\n\n})();\n\n\n\n\n//# sourceURL=webpack:///./src/elements/todo-component.js?");

/***/ }),

/***/ "./src/elements/todo-element.js":
/*!**************************************!*\
  !*** ./src/elements/todo-element.js ***!
  \**************************************/
/*! exports provided: TodoElement */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"TodoElement\", function() { return TodoElement; });\n/* harmony import */ var _partials_new_task_form_html__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ../partials/new-task-form.html */ \"./src/partials/new-task-form.html\");\n/* harmony import */ var _partials_new_task_form_html__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(_partials_new_task_form_html__WEBPACK_IMPORTED_MODULE_0__);\n/* harmony import */ var _partials_task_menu_html__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ../partials/task-menu.html */ \"./src/partials/task-menu.html\");\n/* harmony import */ var _partials_task_menu_html__WEBPACK_IMPORTED_MODULE_1___default = /*#__PURE__*/__webpack_require__.n(_partials_task_menu_html__WEBPACK_IMPORTED_MODULE_1__);\n/* harmony import */ var _view_elements_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./view-elements.js */ \"./src/elements/view-elements.js\");\n/* harmony import */ var _controllers_taskController_js__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ../controllers/taskController.js */ \"./src/controllers/taskController.js\");\n\n\n\n\n\nconst TodoElement = (() => {\n\n  const generateTodo = (name, todoItemTag, todoListTag) => {\n    let todoItem = _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].newElement(todoItemTag);\n    let todoList = _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].getElement(todoListTag);\n    _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].addAttributes(todoItem, {\"id\": generateTodoId(todoList)});\n    setTodoIdentification(name,todoItem, todoList);\n    attachSelectTodoEvent(todoItem,name);\n    todoList.appendChild(todoItem);\n  }\n\n  const setTodoIdentification = (name,todoItem, todoList) => {\n\n    let todoName  = _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].newElement(\"span\");\n    let btRemove  = _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].newElement(\"span\");\n\n    _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].setContent(todoName,name);\n    _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].setContent(btRemove, \"x\");\n    _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].addClass(btRemove,[\"bt-remove\"]);\n\n    _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].attachEvent(btRemove, \"click\", e => {\n      todoList.removeChild(todoItem);\n    });\n\n    todoItem.appendChild(todoName);\n    todoItem.appendChild(btRemove);\n  }\n\n  const attachSelectTodoEvent = (todoItem, content) => {\n\n    _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].attachEvent(todoItem, \"click\", e => {\n\n      if (e.target.tagName === \"LI\" || e.target.textContent != \"x\") {\n\n        let todoHeader = _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].getElement(\".todo-title\");\n        _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].applyStyles(todoHeader, {\"display:\":\"flex\"});\n        clearElementChildNodes(todoHeader);\n\n        let btAddTask = _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].newElement(\"div\",\"Add Task\");\n        _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].addClass(btAddTask,[\"add-task\"]);\n        attachNewTodoTaskEvent(btAddTask);\n\n        let removeTodo = _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].newElement(\"div\",\"Remove\");\n        _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].addClass(removeTodo, [\"bt-remove\"]);\n        _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].attachEvent(removeTodo, \"click\", e => {\n          clearElementChildNodes(todoHeader);\n          clearElementChildNodes(_view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].getElement(\"#tasks\"));\n          _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].applyStyles(todoHeader, {\"display:\":\"none\"});\n        })\n\n        let todoActions = _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].newElement(\"div\");\n        _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].addClass(todoActions,[\"todo-actions\"]);\n\n        todoActions.appendChild(_view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].newElement(\"h1\",content));\n        todoActions.appendChild(removeTodo);\n\n        todoHeader.appendChild(todoActions);\n        todoHeader.appendChild(btAddTask);\n      }\n    });\n  }\n\n  const attachNewTodoTaskEvent = (btAddTask) => {\n    _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].attachEvent(btAddTask, \"click\", e => {\n      let modal = _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].getElement('#myModal');\n          modal.innerHTML = _partials_new_task_form_html__WEBPACK_IMPORTED_MODULE_0___default.a;\n          modal.style.display = \"block\";\n\n      _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].attachEvent(_view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].getElement(\".close\"),\"click\", e => {\n        modal.style.display = \"none\";\n      });\n\n      _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].attachEvent(_view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].getElement(\"#modal-cancel-button\"),\"click\", e => {\n        modal.style.display = \"none\";\n      });\n\n      _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].attachEvent(_view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].getElement(\"#modal-save-button\"),\"click\", e => {\n\n        let tasks = _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].getElement(\"#tasks\");\n\n        let id = generateTodoId(tasks);\n        let taskLine = _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].newElement(\"li\");\n        _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].addAttributes(taskLine,{\"id\": \"Task\"+id});\n        _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].applyStyles(taskLine,{\"position:\": \"relative\"});\n\n\n        let taskTitle = _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].getElement(\"#task-title\");\n        let taskDesc = _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].getElement(\"#task-desc\");\n        let taskDueDate = _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].getElement(\"#task-due-date\");\n        let taskPriority = _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].getElement(\"#task-priority\");\n        let task = _controllers_taskController_js__WEBPACK_IMPORTED_MODULE_3__[\"TaskController\"].createTask(taskTitle.value,taskDesc.value,\n                                      taskDueDate.value, taskPriority.value);\n\n        let taskHeader = _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].newElement(\"h2\",task.getName());\n\n        //Task Details Header\n        let dueDateElement = _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].newElement(\"div\", \"Due date \" + task.getDueDate());\n        _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].addClass(dueDateElement,[\"due-date\"]);\n\n        let priorityElement = _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].newElement(\"div\", task.getPriority() + \" priority\");\n        _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].addClass(priorityElement,[\"priority\"]);\n\n        let taskDetailsTop = _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].newElement(\"div\");\n        _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].addClass(taskDetailsTop,[\"task-details-top\"]);\n\n        taskDetailsTop.appendChild(dueDateElement);\n        taskDetailsTop.appendChild(priorityElement);\n\n        let taskActions = _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].newElement(\"div\",\"...\");\n        _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].addClass(taskActions,[\"dropdown\"]);\n        _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].addAttributes(taskActions,{\"width:\": \"84px\"});\n        _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].applyStyles(taskActions,{\"display:\": \"flex\",\n                                              \"flex-direction:\": \"column\"});\n        taskActions.innerHTML = _partials_task_menu_html__WEBPACK_IMPORTED_MODULE_1___default.a;\n\n        _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].attachEvent(taskActions,\"click\", e => {\n          taskActions.querySelector(\"#taskMenu\").classList.toggle(\"show\");\n        });\n\n        _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].attachEvent(taskActions.querySelector(\"#removeTask\"),\"click\", e => {\n          tasks.removeChild(taskLine);\n        });\n\n        let taskShowDetails = taskActions.querySelector(\"#taskDetails\");\n        _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].attachEvent(taskShowDetails,\"click\", e => {\n          if (elementTaskDetails.style.display == \"none\") {\n            elementTaskDetails.style.display = \"flex\";\n            taskShowDetails.textContent = \"Hide details\";\n          } else {\n            elementTaskDetails.style.display = \"none\";\n            taskShowDetails.textContent = \"Show details\";\n          }\n        });\n\n        //Task Description\n        let taskDescElement = _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].newElement(\"div\", task.getDescription());\n        _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].addClass(taskDescElement,[\"desc\"]);\n\n        //Task Details footer\n        let checkBoxDoneElement = _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].newElement(\"input\")\n        _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].addAttributes(checkBoxDoneElement,{\"id\":\"tsk-done\",\n                                                       \"type\":\"checkbox\",\n                                                       \"value\": \"done\"});\n        _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].attachEvent(checkBoxDoneElement,\"click\",e => {\n          let taskElement = _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].getElement(\"#\"+taskLine.getAttribute(\"id\"));\n          if (checkBoxDoneElement.checked) {\n            _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].applyStyles(taskElement.querySelector(\"h2\"),{\"text-decoration:\":\"line-through\"});\n            _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].applyStyles(taskActions.querySelector(\".dropbtn\"),{\"background-color:\": \"#f60f0f\"});\n            _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].applyStyles(taskElement,{\"background-color:\": \"#f60f0f\"});\n          } else {\n            _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].applyStyles(taskElement.querySelector(\"h2\"),{\"text-decoration:\":\"none\"});\n            _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].applyStyles(taskActions.querySelector(\".dropbtn\"),{\"background-color:\": \"#0656a0\"});\n            _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].applyStyles(taskElement,{\"background-color:\": \"#0656a0\"});\n          }\n        });\n        let spanDoneText = _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].newElement(\"span\",\"Done\");\n        _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].applyStyles(spanDoneText,{\"padding-left:\": \"10px;\"});\n\n        let taskDoneElement = _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].newElement(\"div\");\n        _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].addClass(taskDoneElement,[\"task-done\"]);\n        taskDoneElement.appendChild(checkBoxDoneElement);\n        taskDoneElement.appendChild(spanDoneText);\n\n        let taskFooterElement = _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].newElement(\"div\");\n        _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].addClass(taskFooterElement,[\"task-details-footer\"]);\n        taskFooterElement.appendChild(taskDoneElement);\n\n        let elementTaskDetails = _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].newElement(\"div\");\n        _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].addClass(elementTaskDetails,[\"task-details\"]);\n        _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].applyStyles(elementTaskDetails,{\"display:\":\"none\"});\n\n        elementTaskDetails.appendChild(taskDetailsTop);\n        elementTaskDetails.appendChild(taskDescElement);\n        elementTaskDetails.appendChild(taskFooterElement);\n\n        let elementTitle = _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].newElement(\"div\");\n        _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].addAttributes(\"id\", id);\n        _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].addClass(elementTitle,[\"task-title\"]);\n        elementTitle.appendChild(taskHeader);\n        elementTitle.appendChild(taskActions);\n\n        taskLine.appendChild(elementTitle);\n        taskLine.appendChild(elementTaskDetails);\n\n        tasks.append(taskLine);\n\n        _view_elements_js__WEBPACK_IMPORTED_MODULE_2__[\"ViewElements\"].getElement('#myModal').style.display = \"none\";\n\n      });\n    });\n  }\n\n  const clearElementChildNodes = (element) => {\n    while(element.hasChildNodes()) {\n      element.removeChild(element.lastChild);\n    }\n  }\n\n  const generateTodoId = (todosList) => {\n    return todosList.children.length + 1;\n  }\n\n  return { generateTodo }\n\n})();\n\n\n\n\n//# sourceURL=webpack:///./src/elements/todo-element.js?");

/***/ }),

/***/ "./src/elements/view-elements.js":
/*!***************************************!*\
  !*** ./src/elements/view-elements.js ***!
  \***************************************/
/*! exports provided: ViewElements */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"ViewElements\", function() { return ViewElements; });\nconst ViewElements = (() => {\n\n    const newElement = (type,content) => {\n      let element = document.createElement(type);\n      if (content != undefined && content.includes(\">\")) {\n        element.innerHTML = content;\n      } else {\n        element.textContent = content;\n      }\n      return element;\n    }\n\n    const addAttributes = (element, attributes) => {\n      if (element !== \"\" || attributes !== undefined) {\n        Object.keys(attributes).forEach(function(key) {\n          element.setAttribute(key,attributes[key]);\n        });\n        return element;\n      }\n      return null;\n    }\n\n    const addClass = (element, classes) => {\n      element.classList = classes;\n      return element;\n    }\n\n    const getElement = (element) => {\n      return document.querySelector(element);\n    }\n\n    const setContent = (element, content) => {\n      if (content != undefined && content.includes(\">\")) {\n        element.innerHTML = content;\n      } else {\n        element.textContent = content;\n      }\n      return element;\n    }\n\n    const attachEvent = (element, type, behavior) => {\n      element.addEventListener(type, behavior);\n    }\n\n    const applyStyles = (element, styles) => {\n\n      if (styles != undefined) {\n        Object.keys(styles).forEach(function(styleName){\n          element.style.cssText += styleName+styles[styleName];\n        });\n        return element;\n      }\n      return null;\n    }\n\n    const addChildrenTo = (element, children) => {\n\n      if (children !== undefined) {\n        children.forEach(function(child) {\n          element.appendChild(child);\n        });\n      }\n\n      return element;\n    }\n\n    return {\n      newElement, addAttributes, getElement, setContent,\n      addClass, attachEvent, applyStyles, addChildrenTo\n    }\n\n})();\n\n\n\n\n//# sourceURL=webpack:///./src/elements/view-elements.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _util_imports_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./util/imports.js */ \"./src/util/imports.js\");\n/* harmony import */ var _util_imports_js__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(_util_imports_js__WEBPACK_IMPORTED_MODULE_0__);\n/* harmony import */ var _util_window_events_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./util/window-events.js */ \"./src/util/window-events.js\");\n/* harmony import */ var _util_window_events_js__WEBPACK_IMPORTED_MODULE_1___default = /*#__PURE__*/__webpack_require__.n(_util_window_events_js__WEBPACK_IMPORTED_MODULE_1__);\n/* harmony import */ var _controllers_todoController_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./controllers/todoController.js */ \"./src/controllers/todoController.js\");\n/* harmony import */ var _elements_app_todo_js__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ./elements/app-todo.js */ \"./src/elements/app-todo.js\");\n/* harmony import */ var _elements_todo_component_js__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! ./elements/todo-component.js */ \"./src/elements/todo-component.js\");\n\n\n\n// import {TaskController} from \"./controllers/taskController.js\";\n\n\n\n\n\nlet txtNomeTodo = document.querySelector(\"#txt-todo-name\");\nlet todosList   = document.querySelector(\".lst-todos\");\n\ndocument.querySelector(\"#new-todo\").addEventListener(\"click\", function() {\n  newTodo();\n});\n\ntxtNomeTodo.addEventListener('keydown', function(event) {\n  if (event.key === \"Enter\") {\n    newTodo();\n  }\n});\n\nconst newTodo = () => {\n  let todo = _controllers_todoController_js__WEBPACK_IMPORTED_MODULE_2__[\"TodoController\"].createTodo(txtNomeTodo.value);\n  let todoComponent = _elements_todo_component_js__WEBPACK_IMPORTED_MODULE_4__[\"TodoComponent\"].create((todosList.children.length + 1), todo.getName());\n  todosList.appendChild(todoComponent);  \n  clearTextField(txtNomeTodo);\n}\n\nconst newTask = (todo) => {\n  let task = TaskController.createTask(\"Task One\", \"Task of tests\", \"01/01/2019\", \"low\");\n  // todo.addTask(todo,\"Task One\");\n  // todo.addTask(todo,\"Task Two\");\n  _elements_app_todo_js__WEBPACK_IMPORTED_MODULE_3__[\"App\"].newTodoTaskElement(todo, task);\n}\n\nconst clearTextField = (textField) => {\n  textField.value = \"\";\n}\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/models/task.js":
/*!****************************!*\
  !*** ./src/models/task.js ***!
  \****************************/
/*! exports provided: Task */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"Task\", function() { return Task; });\nconst Task = (name, description, dueDate, priority) => {\n\n  const getName = () => name;\n  const getDescription = () => description;\n  const getDueDate = () => dueDate;\n  const getPriority = () => priority;\n\n  return { getName, getDescription, getDueDate, getPriority };\n\n}\n\n\n\n\n//# sourceURL=webpack:///./src/models/task.js?");

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

/***/ "./src/partials/new-task-form.html":
/*!*****************************************!*\
  !*** ./src/partials/new-task-form.html ***!
  \*****************************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("module.exports = \"<div class=\\\"modal-content\\\">\\n  <div class=\\\"modal-title\\\">\\n    <h1>New Task</h1>\\n    <span class=\\\"close\\\">&times;</span>\\n  </div>\\n  <div class=\\\"modal-form\\\">\\n    <form action=\\\"#\\\">\\n      <div class=\\\"group-fields\\\">\\n        <label for=\\\"task-title\\\">Title</label>\\n        <input id =\\\"task-title\\\" ype=\\\"input\\\" name=\\\"task-title\\\" class=\\\"field-form\\\">\\n      </div>\\n\\n      <div class=\\\"group-fields\\\">\\n        <label for=\\\"task-description\\\">Description</label>\\n        <textarea id=\\\"task-desc\\\" name=\\\"task-description\\\" rows=\\\"4\\\" cols=\\\"80\\\" wrap=\\\"hard\\\">          \\n        </textarea>\\n      </div>\\n\\n      <div class=\\\"group-fields\\\">\\n        <label for=\\\"task-due-date\\\">Due date</label>\\n        <input id=\\\"task-due-date\\\" type=\\\"date\\\" name=\\\"task-due-date\\\"  class=\\\"date-field\\\">\\n      </div>\\n\\n      <div class=\\\"group-fields\\\">\\n        <label for=\\\"task-priority\\\">Priority</label>\\n        <select id=\\\"task-priority\\\" name=\\\"task-priority\\\" >\\n          <option value=\\\"none\\\">Select the priority</option>\\n          <option value=\\\"Low\\\">Low</option>\\n          <option value=\\\"Medium\\\">Medium</option>\\n          <option value=\\\"High\\\">High</option>\\n        </select>\\n      </div>\\n    </form>\\n    <div class=\\\"modal-buttons\\\">\\n      <div id=\\\"modal-save-button\\\">Save</div>\\n      <div id=\\\"modal-cancel-button\\\">Cancel</div>\\n    </div>\\n  </div>\\n</div>\\n\";\n\n//# sourceURL=webpack:///./src/partials/new-task-form.html?");

/***/ }),

/***/ "./src/partials/task-menu.html":
/*!*************************************!*\
  !*** ./src/partials/task-menu.html ***!
  \*************************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("module.exports = \"<button class=\\\"dropbtn\\\">...</button>\\n<div id=\\\"taskMenu\\\" class=\\\"dropdown-content\\\">\\n  <a href=\\\"#\\\" id=\\\"taskDetails\\\">Show details</a>\\n  <a href=\\\"#\\\" id=\\\"editTask\\\">Edit</a>\\n  <a href=\\\"#\\\" id=\\\"removeTask\\\">Remove</a>\\n</div>\\n\";\n\n//# sourceURL=webpack:///./src/partials/task-menu.html?");

/***/ }),

/***/ "./src/util/auxiliar-lib.js":
/*!**********************************!*\
  !*** ./src/util/auxiliar-lib.js ***!
  \**********************************/
/*! exports provided: AuxiliarLib */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"AuxiliarLib\", function() { return AuxiliarLib; });\nconst AuxiliarLib = (() => {\n\n  const removeChildNodesFrom = (parent) => {\n      while(parent.hasChildNodes()) {\n        parent.removeChild(parent.lastChild);\n      }\n  }\n\n  return { removeChildNodesFrom }\n\n})();\n\n\n\n\n//# sourceURL=webpack:///./src/util/auxiliar-lib.js?");

/***/ }),

/***/ "./src/util/imports.js":
/*!*****************************!*\
  !*** ./src/util/imports.js ***!
  \*****************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const importCssFiles = () => {\n  let req = __webpack_require__(\"./src/css sync \\\\.css$\");\n  req.keys().forEach(function(key){\n    req(key);\n  });\n}\n\n// const importImagesFiles = () => {\n//   let req = require.context(\"../images\", false, /\\.(png|svg|jpg|gif|jpeg)$/);\n//   req.keys().forEach(function(key){\n//     req(key);\n//   });\n// }\n\n// export { importFiles };\n\n\n//# sourceURL=webpack:///./src/util/imports.js?");

/***/ }),

/***/ "./src/util/window-events.js":
/*!***********************************!*\
  !*** ./src/util/window-events.js ***!
  \***********************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("// Close the dropdown if the user clicks outside of it\nwindow.onclick = function(event) {\n  if (!event.target.matches('.dropbtn')) {\n\n    var dropdowns = document.getElementsByClassName(\"dropdown-content\");\n    var i;\n    for (i = 0; i < dropdowns.length; i++) {\n      var openDropdown = dropdowns[i];\n      if (openDropdown.classList.contains('show')) {\n        openDropdown.classList.remove('show');\n      }\n    }\n  }\n}\n\n\n//# sourceURL=webpack:///./src/util/window-events.js?");

/***/ })

/******/ });