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

/***/ "./src/css sync \\.css$":
/*!******************************************!*\
  !*** ./src/css sync nonrecursive \.css$ ***!
  \******************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("var map = {\n\t\"./content.css\": \"./src/css/content.css\",\n\t\"./main.css\": \"./src/css/main.css\",\n\t\"./sidebar.css\": \"./src/css/sidebar.css\",\n\t\"./task-form.css\": \"./src/css/task-form.css\"\n};\n\n\nfunction webpackContext(req) {\n\tvar id = webpackContextResolve(req);\n\treturn __webpack_require__(id);\n}\nfunction webpackContextResolve(req) {\n\tvar id = map[req];\n\tif(!(id + 1)) { // check for number or string\n\t\tvar e = new Error(\"Cannot find module '\" + req + \"'\");\n\t\te.code = 'MODULE_NOT_FOUND';\n\t\tthrow e;\n\t}\n\treturn id;\n}\nwebpackContext.keys = function webpackContextKeys() {\n\treturn Object.keys(map);\n};\nwebpackContext.resolve = webpackContextResolve;\nmodule.exports = webpackContext;\nwebpackContext.id = \"./src/css sync \\\\.css$\";\n\n//# sourceURL=webpack:///./src/css_sync_nonrecursive_\\.css$?");

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

/***/ "./src/elements/app-todo.js":
/*!**********************************!*\
  !*** ./src/elements/app-todo.js ***!
  \**********************************/
/*! exports provided: App */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"App\", function() { return App; });\n/* harmony import */ var _todo_element_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./todo-element.js */ \"./src/elements/todo-element.js\");\n\n\nconst App = (() => {\n\n  const newTodoElement = (elementType, content) => {\n    return _todo_element_js__WEBPACK_IMPORTED_MODULE_0__[\"TodoElement\"].createTodoElement(elementType, content);\n  }\n\n  const newTodoTaskElement = (todo, task) => {\n    let taskList = DomElement.getElement(\"#tasks\");\n    let taskLine = DomElement.createElement(\"li\");\n    DomElement.addClass(taskLine,[\"task-title\"]);\n\n    let taskNameWrapper = DomElement.createElement(\"div\");\n    DomElement.addAttributes(taskNameWrapper, {\"id\": generteTaskId(taskList)})\n\n    let taskName = DomElement.createElement(\"h2\",task.getName());\n\n    let taskDetailsLink = DomElement.createElement(\"a\",\"Show details\");\n    taskNameWrapper.appendChild();\n  }\n\n  const generteTaskId = (tasklList) => {\n    taskList.children.length + 1;\n  }\n\n  return { newTodoTaskElement, newTodoElement }\n\n})();\n\n\n\n\n//# sourceURL=webpack:///./src/elements/app-todo.js?");

/***/ }),

/***/ "./src/elements/dom-element.js":
/*!*************************************!*\
  !*** ./src/elements/dom-element.js ***!
  \*************************************/
/*! exports provided: DomElement */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"DomElement\", function() { return DomElement; });\nconst DomElement = (() => {\n\n    const newElement = (type,content) => {\n      let element = document.createElement(type);\n      if (content != undefined && content.includes(\">\")) {\n        element.innerHTML = content;\n      } else {\n        element.textContent = content;\n      }\n      return element;\n    }\n\n    const addAttributes = (element, attributes) => {\n      if (element !== \"\" || attributes !== undefined) {\n        Object.keys(attributes).forEach(function(key) {\n          element.setAttribute(key,attributes[key]);\n        });\n        return element;\n      }\n      return null;\n    }\n\n    const addClass = (element, classes) => {\n      element.classList = classes;\n      return element;\n    }\n\n    const getElement = (element) => {\n      return document.querySelector(element);\n    }\n\n    const setContent = (element, content) => {\n      if (content != undefined && content.includes(\">\")) {\n        element.innerHTML = content;\n      } else {\n        element.textContent = content;\n      }\n      return element;\n    }\n\n    const attachEvent = (element, type, behavior) => {\n      element.addEventListener(type, behavior);\n    }\n\n    const applyStyles = (element, styles) => {\n\n      if (styles != undefined) {\n        Object.keys(styles).forEach(function(styleName){\n          element.style.cssText += styleName+styles[styleName];\n        });\n        return element;\n      }\n      return null;\n    }\n\n    const addChildrenTo = (element, children) => {\n\n      if (children !== undefined) {\n        children.forEach(function(child) {\n          element.appendChild(child);\n        });\n      }\n\n      return element;\n    }\n\n    return {\n      newElement, addAttributes, getElement, setContent,\n      addClass, attachEvent, applyStyles, addChildrenTo\n    }\n\n})();\n\n\n\n\n//# sourceURL=webpack:///./src/elements/dom-element.js?");

/***/ }),

/***/ "./src/elements/list-of-tasks.js":
/*!***************************************!*\
  !*** ./src/elements/list-of-tasks.js ***!
  \***************************************/
/*! exports provided: ListOfTask */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"ListOfTask\", function() { return ListOfTask; });\n/* harmony import */ var _dom_element_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./dom-element.js */ \"./src/elements/dom-element.js\");\n\n\nconst ListOfTask = (() => {\n  \n  const showListTo = (todo) => {\n    return _dom_element_js__WEBPACK_IMPORTED_MODULE_0__[\"DomElement\"].applyStyles(\n             _dom_element_js__WEBPACK_IMPORTED_MODULE_0__[\"DomElement\"].addClass(\n               _dom_element_js__WEBPACK_IMPORTED_MODULE_0__[\"DomElement\"].newElement(\"div\"),[\"task-details\"]\n             ),{\"display:\":\"none\"}\n           );\n  }\n  \n  return { showListTo }\n  \n})();\n\n\n\n//# sourceURL=webpack:///./src/elements/list-of-tasks.js?");

/***/ }),

/***/ "./src/elements/task-form.js":
/*!***********************************!*\
  !*** ./src/elements/task-form.js ***!
  \***********************************/
/*! exports provided: TaskForm */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"TaskForm\", function() { return TaskForm; });\n/* harmony import */ var _models_task_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ../models/task.js */ \"./src/models/task.js\");\n/* harmony import */ var _dom_element_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./dom-element.js */ \"./src/elements/dom-element.js\");\n/* harmony import */ var _partials_new_task_form_html__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ../partials/new-task-form.html */ \"./src/partials/new-task-form.html\");\n/* harmony import */ var _partials_new_task_form_html__WEBPACK_IMPORTED_MODULE_2___default = /*#__PURE__*/__webpack_require__.n(_partials_new_task_form_html__WEBPACK_IMPORTED_MODULE_2__);\n\n\n\n\nconst TaskForm = (() => {\n\n  const addTaskTo = (todoModel) => {\n    createTaskElement();\n    attachCloseEvent();\n    attachSaveEvent(todoModel);\n  }\n\n  const attachCloseEvent = () => {\n    [_dom_element_js__WEBPACK_IMPORTED_MODULE_1__[\"DomElement\"].getElement(\".close\"),\n     _dom_element_js__WEBPACK_IMPORTED_MODULE_1__[\"DomElement\"].getElement(\"#cancel-button\")].forEach(function(element){\n       _dom_element_js__WEBPACK_IMPORTED_MODULE_1__[\"DomElement\"].attachEvent(element,\"click\", e => {\n         closeForm();\n       })\n     });\n  }\n\n  const attachSaveEvent = (todoModel) => {\n    _dom_element_js__WEBPACK_IMPORTED_MODULE_1__[\"DomElement\"].attachEvent(_dom_element_js__WEBPACK_IMPORTED_MODULE_1__[\"DomElement\"].getElement(\"#save-button\"),\"click\", e => {\n      let tasks           = _dom_element_js__WEBPACK_IMPORTED_MODULE_1__[\"DomElement\"].getElement(\"#tasks\");\n      let task            = createTaskModel();\n      let taskDetails     = createTaskDetails();\n      let taskShowDetails = createShowDetailsLink();\n      associateTaskToTodo(task,todoModel);\n      attachShowDetailsEventTo(taskShowDetails,taskDetails);\n\n      let elementTitle = createElementTaskTitle(tasks,\n                    [_dom_element_js__WEBPACK_IMPORTED_MODULE_1__[\"DomElement\"].newElement(\"h2\",task.getName()),taskShowDetails]);\n\n      let taskLine = _dom_element_js__WEBPACK_IMPORTED_MODULE_1__[\"DomElement\"].addChildrenTo(\n                       _dom_element_js__WEBPACK_IMPORTED_MODULE_1__[\"DomElement\"].newElement(\"li\"),[elementTitle,taskDetails]\n                     );\n\n      tasks.append(taskLine);\n      closeForm();\n    });\n  }\n\n  const createTaskElement = () => {\n    _dom_element_js__WEBPACK_IMPORTED_MODULE_1__[\"DomElement\"].applyStyles(\n      _dom_element_js__WEBPACK_IMPORTED_MODULE_1__[\"DomElement\"].setContent(\n        _dom_element_js__WEBPACK_IMPORTED_MODULE_1__[\"DomElement\"].getElement('#myModal'), _partials_new_task_form_html__WEBPACK_IMPORTED_MODULE_2___default.a\n      ), {\"display:\": \"block\"}\n    );\n  }\n\n  const createTaskModel = () => {\n    return Object(_models_task_js__WEBPACK_IMPORTED_MODULE_0__[\"Task\"])(getFieldValue(\"#task-title\"), getFieldValue(\"#task-desc\"),\n                getFieldValue(\"#task-due-date\"), getFieldValue(\"#task-priority\"));\n  }\n\n  const associateTaskToTodo = (task,todoModel) => {\n    todoModel.addTask(task);\n  }\n\n  const createTaskDetails = () => {\n    return _dom_element_js__WEBPACK_IMPORTED_MODULE_1__[\"DomElement\"].applyStyles(\n             _dom_element_js__WEBPACK_IMPORTED_MODULE_1__[\"DomElement\"].addClass(\n               _dom_element_js__WEBPACK_IMPORTED_MODULE_1__[\"DomElement\"].newElement(\"div\"),[\"task-details\"]\n             ),{\"display:\":\"none\"}\n           );\n  }\n\n  const createShowDetailsLink = () => {\n    return _dom_element_js__WEBPACK_IMPORTED_MODULE_1__[\"DomElement\"].addClass(\n             _dom_element_js__WEBPACK_IMPORTED_MODULE_1__[\"DomElement\"].addAttributes(\n               _dom_element_js__WEBPACK_IMPORTED_MODULE_1__[\"DomElement\"].newElement(\"a\",\"Show Details\"),{\"href\":\"#\"}\n             ),[\"bt-details\"]\n           );\n  }\n\n  const attachShowDetailsEventTo = (taskShowDetails, taskDetails) => {\n    _dom_element_js__WEBPACK_IMPORTED_MODULE_1__[\"DomElement\"].attachEvent(taskShowDetails,\"click\", e => {\n      if (taskDetails.style.display == \"none\") {\n        taskDetails.style.display = \"flex\";\n        taskShowDetails.textContent = \"Hide details\";\n      } else {\n        taskDetails.style.display = \"none\";\n        taskShowDetails.textContent = \"Show details\";\n      }\n    })\n  }\n\n  const createElementTaskTitle = (tasks, children) => {\n    return _dom_element_js__WEBPACK_IMPORTED_MODULE_1__[\"DomElement\"].addChildrenTo(\n             _dom_element_js__WEBPACK_IMPORTED_MODULE_1__[\"DomElement\"].addClass(\n               _dom_element_js__WEBPACK_IMPORTED_MODULE_1__[\"DomElement\"].addAttributes(\n                 _dom_element_js__WEBPACK_IMPORTED_MODULE_1__[\"DomElement\"].newElement(\"div\"),{\"id\": tasks.children.length + 1}\n               ),[\"task-title\"]\n             ),children\n           );\n  }\n\n  const getFieldValue = (fieldId) => {\n    return _dom_element_js__WEBPACK_IMPORTED_MODULE_1__[\"DomElement\"].getElement(fieldId).value;\n  }\n\n  const closeForm = () => {\n    _dom_element_js__WEBPACK_IMPORTED_MODULE_1__[\"DomElement\"].getElement(\"#myModal\").style.display = \"none\";\n  }\n\n\n  return { addTaskTo };\n\n})();\n\n\n\n\n//# sourceURL=webpack:///./src/elements/task-form.js?");

/***/ }),

/***/ "./src/elements/todo-element.js":
/*!**************************************!*\
  !*** ./src/elements/todo-element.js ***!
  \**************************************/
/*! exports provided: TodoElement */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"TodoElement\", function() { return TodoElement; });\n/* harmony import */ var _task_form_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./task-form.js */ \"./src/elements/task-form.js\");\n/* harmony import */ var _dom_element_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./dom-element.js */ \"./src/elements/dom-element.js\");\n/* harmony import */ var _util_auxiliar_lib_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ../util/auxiliar-lib.js */ \"./src/util/auxiliar-lib.js\");\n/* harmony import */ var _models_todo_js__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ../models/todo.js */ \"./src/models/todo.js\");\n/* harmony import */ var _list_of_tasks_js__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! ./list-of-tasks.js */ \"./src/elements/list-of-tasks.js\");\n\n\n\n\n\n\nconst TodoElement = (() => {\n\n  let todoElement;\n  let todoSection;\n  let todoModel;\n\n  const createTodoElement = (elementType, content) => {\n    todoModel = Object(_models_todo_js__WEBPACK_IMPORTED_MODULE_3__[\"Todo\"])(content);\n    return todoElement = attachSelectEvent(createTodo(elementType, content));\n  }\n\n  const attachSelectEvent = (todoDomElem) => {\n    _dom_element_js__WEBPACK_IMPORTED_MODULE_1__[\"DomElement\"].attachEvent(todoDomElem, \"click\", e => {\n      _util_auxiliar_lib_js__WEBPACK_IMPORTED_MODULE_2__[\"AuxiliarLib\"].removeChildNodesFrom(_dom_element_js__WEBPACK_IMPORTED_MODULE_1__[\"DomElement\"].getElement(\".todo-title\"));\n      _util_auxiliar_lib_js__WEBPACK_IMPORTED_MODULE_2__[\"AuxiliarLib\"].removeChildNodesFrom(_dom_element_js__WEBPACK_IMPORTED_MODULE_1__[\"DomElement\"].getElement(\"#tasks\"));\n      _list_of_tasks_js__WEBPACK_IMPORTED_MODULE_4__[\"ListOfTask\"].showListTo(todoModel);\n      todoSection = creatTodoSection();\n      _dom_element_js__WEBPACK_IMPORTED_MODULE_1__[\"DomElement\"].addChildrenTo(todoSection,[createTodoSectionIdentification(),\n                                 attachNewTodoTaskEvent(createButtonAddTask())]);\n    });\n    return todoDomElem;\n  }\n\n  const attachNewTodoTaskEvent = (btAddTask) => {\n    _dom_element_js__WEBPACK_IMPORTED_MODULE_1__[\"DomElement\"].attachEvent(btAddTask, \"click\", e => {\n      _task_form_js__WEBPACK_IMPORTED_MODULE_0__[\"TaskForm\"].addTaskTo(todoModel);\n    });\n    return btAddTask;\n  }\n\n  const createTodo = (tagType, content) => {\n    return _dom_element_js__WEBPACK_IMPORTED_MODULE_1__[\"DomElement\"].addAttributes(\n            _dom_element_js__WEBPACK_IMPORTED_MODULE_1__[\"DomElement\"].newElement(tagType,content),{\"id\": content}\n          );\n  }\n\n  const creatTodoSection = () => {\n    return _dom_element_js__WEBPACK_IMPORTED_MODULE_1__[\"DomElement\"].applyStyles(\n            _dom_element_js__WEBPACK_IMPORTED_MODULE_1__[\"DomElement\"].getElement(\".todo-title\"),{\"display:\":\"flex\"}\n           );\n  }\n\n  const createButtonAddTask = () => {\n    return _dom_element_js__WEBPACK_IMPORTED_MODULE_1__[\"DomElement\"].addClass(\n             _dom_element_js__WEBPACK_IMPORTED_MODULE_1__[\"DomElement\"].newElement(\"div\",\"Add Task\"),[\"add-task\"]\n           );\n  }\n\n  const createLinkRemoveTodo = () => {\n    return _dom_element_js__WEBPACK_IMPORTED_MODULE_1__[\"DomElement\"].addClass(\n             _dom_element_js__WEBPACK_IMPORTED_MODULE_1__[\"DomElement\"].newElement(\"div\",\"Remove\"), [\"bt-remove\"]\n           );\n  }\n\n  const attachRemoveTodoEvent = (toElement) => {\n    _dom_element_js__WEBPACK_IMPORTED_MODULE_1__[\"DomElement\"].attachEvent(toElement, \"click\", e => {\n      _util_auxiliar_lib_js__WEBPACK_IMPORTED_MODULE_2__[\"AuxiliarLib\"].removeChildNodesFrom(_dom_element_js__WEBPACK_IMPORTED_MODULE_1__[\"DomElement\"].getElement(\".todo-title\"));\n      _util_auxiliar_lib_js__WEBPACK_IMPORTED_MODULE_2__[\"AuxiliarLib\"].removeNodeElement(todoElement);\n      _util_auxiliar_lib_js__WEBPACK_IMPORTED_MODULE_2__[\"AuxiliarLib\"].removeNodeElement(_dom_element_js__WEBPACK_IMPORTED_MODULE_1__[\"DomElement\"].getElement(\"#tasks\"));\n      _dom_element_js__WEBPACK_IMPORTED_MODULE_1__[\"DomElement\"].applyStyles(todoSection, {\"display:\":\"none\"});\n    });\n    return toElement;\n  }\n\n  const createTodoSectionIdentification = () => {\n    return _dom_element_js__WEBPACK_IMPORTED_MODULE_1__[\"DomElement\"].addChildrenTo(\n             _dom_element_js__WEBPACK_IMPORTED_MODULE_1__[\"DomElement\"].addAttributes(\n               _dom_element_js__WEBPACK_IMPORTED_MODULE_1__[\"DomElement\"].addClass(_dom_element_js__WEBPACK_IMPORTED_MODULE_1__[\"DomElement\"].newElement(\"div\"),[\"todo-actions\"]),\n               {\"id\":\"todo-section\"}\n             ),[_dom_element_js__WEBPACK_IMPORTED_MODULE_1__[\"DomElement\"].newElement(\"h1\",todoElement.textContent),\n                attachRemoveTodoEvent(createLinkRemoveTodo(),todoElement)]\n           );\n  }\n\n  const listTaskOf = (todo) => {\n    if (todo.getTasks().length > 0) {\n\n    }\n  }\n\n  return { createTodoElement }\n\n})();\n\n\n\n\n//# sourceURL=webpack:///./src/elements/todo-element.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _util_imports_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./util/imports.js */ \"./src/util/imports.js\");\n/* harmony import */ var _util_imports_js__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(_util_imports_js__WEBPACK_IMPORTED_MODULE_0__);\n/* harmony import */ var _elements_app_todo_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./elements/app-todo.js */ \"./src/elements/app-todo.js\");\n\n\n\n\nlet txtNomeTodo = document.querySelector(\"#txt-todo-name\");\nlet todosList   = document.querySelector(\".lst-todos\");\n\ndocument.querySelector(\"#new-todo\").addEventListener(\"click\", function() {\n  newTodo();\n});\n\ntxtNomeTodo.addEventListener('keydown', function(event) {\n  if (event.key === \"Enter\") {\n    newTodo();\n  }\n});\n\nconst newTodo = () => {\n  todosList.appendChild(_elements_app_todo_js__WEBPACK_IMPORTED_MODULE_1__[\"App\"].newTodoElement(\"li\", txtNomeTodo.value));\n  clearTextField(txtNomeTodo);\n}\n\nconst clearTextField = (textField) => {\n  textField.value = \"\";\n}\n\n\n//# sourceURL=webpack:///./src/index.js?");

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
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"Todo\", function() { return Todo; });\nconst Todo = (name) => {\n\n  let tasks = [];\n\n  const getName = () => name;\n\n  const addTask = (task) => {\n    tasks.push(task);\n  }\n\n  const getTasks = (fromTodo) => {\n    return tasks;\n  }\n\n  return { getName, addTask, getTasks }\n\n};\n\n\n\n\n//# sourceURL=webpack:///./src/models/todo.js?");

/***/ }),

/***/ "./src/partials/new-task-form.html":
/*!*****************************************!*\
  !*** ./src/partials/new-task-form.html ***!
  \*****************************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("module.exports = \"<div class=\\\"modal-content\\\">\\n  <div class=\\\"modal-title\\\">\\n    <h1>New Task</h1>\\n    <span class=\\\"close\\\">&times;</span>\\n  </div>\\n  <div class=\\\"modal-form\\\">\\n    <form action=\\\"#\\\">\\n      <div class=\\\"group-fields\\\">\\n        <label for=\\\"task-title\\\">Title</label>\\n        <input id =\\\"task-title\\\" ype=\\\"input\\\" name=\\\"task-title\\\" class=\\\"field-form\\\">\\n      </div>\\n\\n      <div class=\\\"group-fields\\\">\\n        <label for=\\\"task-description\\\">Description</label>\\n        <textarea id=\\\"task-desc\\\" name=\\\"task-description\\\" rows=\\\"4\\\" cols=\\\"80\\\"></textarea>\\n      </div>\\n\\n      <div class=\\\"group-fields\\\">\\n        <label for=\\\"task-due-date\\\">Due date</label>\\n        <input id=\\\"task-due-date\\\" type=\\\"date\\\" name=\\\"task-due-date\\\"  class=\\\"date-field\\\">\\n      </div>\\n\\n      <div class=\\\"group-fields\\\">\\n        <label for=\\\"task-priority\\\">Priority</label>\\n        <select id=\\\"task-priority\\\" name=\\\"task-priority\\\" >\\n          <option value=\\\"none\\\">Select the priority</option>\\n          <option value=\\\"Low\\\">Low</option>\\n          <option value=\\\"Medium\\\">Medium</option>\\n          <option value=\\\"High\\\">High</option>\\n        </select>\\n      </div>\\n    </form>\\n    <div class=\\\"modal-buttons\\\">\\n      <div id=\\\"save-button\\\">Save</div>\\n      <div id=\\\"cancel-button\\\">Cancel</div>\\n    </div>\\n  </div>\\n</div>\\n\";\n\n//# sourceURL=webpack:///./src/partials/new-task-form.html?");

/***/ }),

/***/ "./src/util/auxiliar-lib.js":
/*!**********************************!*\
  !*** ./src/util/auxiliar-lib.js ***!
  \**********************************/
/*! exports provided: AuxiliarLib */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"AuxiliarLib\", function() { return AuxiliarLib; });\nconst AuxiliarLib = (() => {\n\n  const removeChildNodesFrom = (parent) => {\n      while(parent.hasChildNodes()) {\n        parent.removeChild(parent.lastChild);\n      }\n  }\n\n  const removeNodeElement = (element) => {\n    element.parentElement.removeChild(element);\n  }\n\n  return { removeChildNodesFrom, removeNodeElement }\n\n})();\n\n\n\n\n//# sourceURL=webpack:///./src/util/auxiliar-lib.js?");

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