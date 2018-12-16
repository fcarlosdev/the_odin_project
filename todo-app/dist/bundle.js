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

/***/ "./src/elements/task-details-footer.js":
/*!*********************************************!*\
  !*** ./src/elements/task-details-footer.js ***!
  \*********************************************/
/*! exports provided: TaskDetailsFooter */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"TaskDetailsFooter\", function() { return TaskDetailsFooter; });\n/* harmony import */ var _util_auxiliar_lib_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ../util/auxiliar-lib.js */ \"./src/util/auxiliar-lib.js\");\n\n\nconst TaskDetailsFooter = (() => {\n\n  const create = (taskId) => {\n\n    let labelDone = document.createElement(\"label\");\n    labelDone.setAttribute(\"for\",taskId);\n    labelDone.textContent = \"Done\";\n\n    let checkboxDone = document.createElement(\"input\");\n    checkboxDone.setAttribute(\"type\",\"checkbox\");\n    checkboxDone.setAttribute(\"id\",taskId);\n    checkboxDone.setAttribute(\"value\",\"done\");\n    taskDone(checkboxDone,taskId);\n\n    let taskDoneWrapper = document.createElement(\"div\");\n    taskDoneWrapper.classList.add(\"task-done\");\n    taskDoneWrapper.appendChild(checkboxDone);\n    taskDoneWrapper.appendChild(labelDone);\n\n    let removeTextElem = document.createElement(\"span\");\n    removeTextElem.textContent = \"Remove\";\n    removeTask(removeTextElem, taskId);\n\n    let removeTaskWrapper = document.createElement(\"div\");\n    removeTaskWrapper.classList.add(\"bt-remove\");\n    removeTaskWrapper.appendChild(removeTextElem);\n\n    let taskDetailsFooterWrapper = document.createElement(\"div\");\n    taskDetailsFooterWrapper.classList.add(\"task-details-footer\");\n    taskDetailsFooterWrapper.appendChild(taskDoneWrapper);\n    taskDetailsFooterWrapper.appendChild(removeTaskWrapper);\n\n    return taskDetailsFooterWrapper;\n  }\n\n  const taskDone = (element,taskId) => {\n    element.addEventListener(\"click\", e => {\n      let task = document.getElementById(\"task\"+taskId);\n      if (e.target.checked) {\n        task.style.color = \"#fff\";\n        task.querySelector(\"h2\").style.textDecoration = \"line-through\";\n      } else {\n        task.querySelector(\"h2\").style.textDecoration = \"none\";\n      }\n    });\n  }\n\n  const removeTask = (element, taskId) => {\n    element.addEventListener(\"click\", e => {\n      let task = document.getElementById(\"task\"+taskId);\n      _util_auxiliar_lib_js__WEBPACK_IMPORTED_MODULE_0__[\"AuxiliarLib\"].removeNodeElement(task.parentElement);\n    });\n  }\n\n  return {create}\n\n})();\n\n\n\n\n//# sourceURL=webpack:///./src/elements/task-details-footer.js?");

/***/ }),

/***/ "./src/elements/task-details.js":
/*!**************************************!*\
  !*** ./src/elements/task-details.js ***!
  \**************************************/
/*! exports provided: TaskDetails */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"TaskDetails\", function() { return TaskDetails; });\n/* harmony import */ var _task_details_footer_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./task-details-footer.js */ \"./src/elements/task-details-footer.js\");\n\n\nconst TaskDetails = (() => {\n\n  const create = (taskId, dueDate, priority, description) => {\n\n    let dueDateElem = document.createElement(\"div\");\n    dueDateElem.classList.add(\"due-date\");\n    dueDateElem.textContent = (\"Due Date \" + dueDate);\n\n    let priorityElem = document.createElement(\"div\");\n    priorityElem.classList.add(\"priority\");\n    priorityElem.textContent = (priority + \" Priority\");\n\n    let taskIinfo = document.createElement(\"div\");\n    taskIinfo.classList.add(\"task-details-top\");\n    taskIinfo.appendChild(dueDateElem);\n    taskIinfo.appendChild(priorityElem);\n\n    let descriptionElem = document.createElement(\"div\");\n    descriptionElem.classList.add(\"desc\");\n    descriptionElem.textContent = description;\n\n    let taskDetailsWrapper = document.createElement(\"div\");\n    taskDetailsWrapper.classList.add(\"task-details\");\n\n    taskDetailsWrapper.appendChild(taskIinfo);\n    taskDetailsWrapper.appendChild(descriptionElem);\n    taskDetailsWrapper.appendChild(_task_details_footer_js__WEBPACK_IMPORTED_MODULE_0__[\"TaskDetailsFooter\"].create(taskId));\n\n    return taskDetailsWrapper;\n\n  }\n\n  return {create};\n\n\n})();\n\n\n\n\n//# sourceURL=webpack:///./src/elements/task-details.js?");

/***/ }),

/***/ "./src/elements/task-header.js":
/*!*************************************!*\
  !*** ./src/elements/task-header.js ***!
  \*************************************/
/*! exports provided: TaskHeader */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"TaskHeader\", function() { return TaskHeader; });\nconst TaskHeader = (() => {\n\n  const create = (id, name) => {\n\n    let title = document.createElement(\"h2\");\n    title.textContent = name;\n\n    let showDetails         = document.createElement(\"a\");\n    showDetails.setAttribute(\"href\",\"#\");\n    showDetails.textContent = \"Show details\";\n    showDetails.addEventListener(\"click\",showTaskDetails);\n\n    let content = document.createElement(\"div\");\n    content.setAttribute(\"id\",\"task\"+id);\n    content.classList.add(\"task-title\");\n    content.appendChild(title);\n    content.appendChild(showDetails);\n\n    return content;\n  }\n\n  const showTaskDetails = (e) => {\n    let taskDetails = e.target.parentElement.parentElement\n                                            .querySelector('.task-details');\n    if (e.target.textContent == \"Show details\") {\n      taskDetails.style.display = \"flex\";\n      taskDetails.style.flexDirection = \"column\";\n      e.target.textContent = \"Hide details\";\n    } else {\n      taskDetails.style.display = \"none\";\n      e.target.textContent = \"Show details\";\n    }\n  }\n\n  return {create}\n\n})();\n\n\n\n\n//# sourceURL=webpack:///./src/elements/task-header.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _util_imports_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./util/imports.js */ \"./src/util/imports.js\");\n/* harmony import */ var _util_imports_js__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(_util_imports_js__WEBPACK_IMPORTED_MODULE_0__);\n/* harmony import */ var _models_task_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./models/task.js */ \"./src/models/task.js\");\n/* harmony import */ var _models_todo_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./models/todo.js */ \"./src/models/todo.js\");\n/* harmony import */ var _util_auxiliar_lib_js__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ./util/auxiliar-lib.js */ \"./src/util/auxiliar-lib.js\");\n/* harmony import */ var _partials_new_task_form_html__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! ./partials/new-task-form.html */ \"./src/partials/new-task-form.html\");\n/* harmony import */ var _partials_new_task_form_html__WEBPACK_IMPORTED_MODULE_4___default = /*#__PURE__*/__webpack_require__.n(_partials_new_task_form_html__WEBPACK_IMPORTED_MODULE_4__);\n/* harmony import */ var _elements_task_header_js__WEBPACK_IMPORTED_MODULE_5__ = __webpack_require__(/*! ./elements/task-header.js */ \"./src/elements/task-header.js\");\n/* harmony import */ var _elements_task_details_js__WEBPACK_IMPORTED_MODULE_6__ = __webpack_require__(/*! ./elements/task-details.js */ \"./src/elements/task-details.js\");\n\n\n\n\n\n\n\n\nlet txtNomeTodo  = document.querySelector(\"#txt-todo-name\");\nlet todosList    = document.querySelector(\".lst-todos\");\nlet tasksList    = document.getElementById(\"tasks\");\nlet todoSelected = document.querySelector(\".todo-title\");\n\ndocument.querySelector(\"#new-todo\").addEventListener(\"click\", function() {\n  newTodo();\n});\n\ntxtNomeTodo.addEventListener('keydown', function(event) {\n  if (event.key === \"Enter\") {\n    newTodo();\n  }\n});\n\nconst newTodo = () => {\n  let todo = Object(_models_todo_js__WEBPACK_IMPORTED_MODULE_2__[\"Todo\"])(txtNomeTodo.value);\n  let todoListElement = document.createElement(\"li\");\n  todoListElement.setAttribute(\"id\",generateTodoId());\n  todoListElement.textContent = todo.getName();\n\n  todoListElement.addEventListener(\"click\", showSelectedTodo);\n  todoSelected.querySelector(\".bt-remove\").addEventListener(\"click\",removeTodo);\n  todoSelected.querySelector(\".add-task\").addEventListener(\"click\", e => {\n    let taskForm = document.getElementById(\"myModal\");\n    taskForm.innerHTML = _partials_new_task_form_html__WEBPACK_IMPORTED_MODULE_4___default.a;\n    taskForm.style.display  = \"flex\";\n    closeForm(taskForm);\n\n    document.getElementById(\"save-button\").addEventListener(\"click\",e => {\n      let task = Object(_models_task_js__WEBPACK_IMPORTED_MODULE_1__[\"Task\"])(getFieldValue(\"task-title\"), getFieldValue(\"task-desc\"),\n                      getFieldValue(\"task-due-date\"), getFieldValue(\"task-priority\"));\n      todo.addTask(task);\n\n      let taskId = generateTaskId();\n\n      let taskItem = document.createElement(\"li\");\n      taskItem.setAttribute(\"id\",\"taskItem\"+taskId);\n      taskItem.appendChild(_elements_task_header_js__WEBPACK_IMPORTED_MODULE_5__[\"TaskHeader\"].create(taskId, task.getName()));\n      taskItem.appendChild(_elements_task_details_js__WEBPACK_IMPORTED_MODULE_6__[\"TaskDetails\"].create(taskId, task.getDueDate(),\n                                    task.getPriority(), task.getDescription()));\n      if (task.getPriority() == \"Low\") {\n        taskItem.classList.add(\"low-priority\");\n      } else if (task.getPriority() == \"Medium\") {\n        taskItem.classList.add(\"medium-priority\");\n      } else {\n        taskItem.classList.add(\"high-priority\");\n      }\n      tasksList.appendChild(taskItem);\n\n      taskForm.style.display  = \"none\";\n    });\n\n  });\n\n  todosList.appendChild(todoListElement);\n\n  clearTextField(txtNomeTodo);\n}\n\nconst clearTextField = (textField) => {\n  textField.value = \"\";\n}\n\nconst showSelectedTodo = (e) => {\n\n  todoSelected.querySelector(\"h1\").textContent = e.target.textContent;\n  todoSelected.style.display = \"flex\";\n}\n\nconst removeTodo = (e) => {\n\n  if (e.target.textContent.trim() == \"Remove\") {\n    _util_auxiliar_lib_js__WEBPACK_IMPORTED_MODULE_3__[\"AuxiliarLib\"].removeNodeElement(findTodo(todoSelected.querySelector(\"h1\")\n                                                       .textContent.trim()));\n    todoSelected.querySelector(\"h1\").textContent = \"\";\n    todoSelected.style.display = \"none\";\n  }\n}\n\nconst closeForm = (form) => {\n  [\"#cancel-button\",\".close\"].forEach((elem) => {\n    document.querySelector(elem).addEventListener(\"click\",f => {\n      form.style.display = \"none\";\n    });\n  })\n}\n\nconst findTodo = (withName) => {\n  let todo = Array.from(todosList.children)\n                  .filter(todo => todo.textContent == withName);\n  return (todo.length > 0) ? todo[0] : undefined;\n}\n\nconst generateTodoId = () => {\n  return todosList.children.length + 1;\n}\n\nconst generateTaskId = () => {\n  return tasksList.children.length + 1;\n}\n\nconst getFieldValue = (fieldId) => {\n  return document.getElementById(fieldId).value;\n}\n\n\n//# sourceURL=webpack:///./src/index.js?");

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

eval("module.exports = \"<div class=\\\"modal-content\\\">\\n  <div class=\\\"modal-title\\\">\\n    <h1>New Task</h1>\\n    <span class=\\\"close\\\">&times;</span>\\n  </div>\\n  <div class=\\\"modal-form\\\">\\n    <form action=\\\"#\\\">\\n      <div class=\\\"group-fields\\\">\\n        <label for=\\\"task-title\\\">Title</label>\\n        <input id =\\\"task-title\\\" type=\\\"input\\\" name=\\\"task-title\\\"\\n          autofocus class=\\\"field-form\\\">\\n      </div>\\n\\n      <div class=\\\"group-fields\\\">\\n        <label for=\\\"task-description\\\">Description</label>\\n        <textarea id=\\\"task-desc\\\" name=\\\"task-description\\\" rows=\\\"4\\\" cols=\\\"80\\\"></textarea>\\n      </div>\\n\\n      <div class=\\\"group-fields\\\">\\n        <label for=\\\"task-due-date\\\">Due date</label>\\n        <input id=\\\"task-due-date\\\" type=\\\"date\\\" name=\\\"task-due-date\\\"  class=\\\"date-field\\\">\\n      </div>\\n\\n      <div class=\\\"group-fields\\\">\\n        <label for=\\\"task-priority\\\">Priority</label>\\n        <select id=\\\"task-priority\\\" name=\\\"task-priority\\\" >\\n          <option value=\\\"none\\\">Select the priority</option>\\n          <option value=\\\"Low\\\">Low</option>\\n          <option value=\\\"Medium\\\">Medium</option>\\n          <option value=\\\"High\\\">High</option>\\n        </select>\\n      </div>\\n    </form>\\n    <div class=\\\"modal-buttons\\\">\\n      <div id=\\\"save-button\\\">Save</div>\\n      <div id=\\\"cancel-button\\\">Cancel</div>\\n    </div>\\n  </div>\\n</div>\\n\";\n\n//# sourceURL=webpack:///./src/partials/new-task-form.html?");

/***/ }),

/***/ "./src/util/auxiliar-lib.js":
/*!**********************************!*\
  !*** ./src/util/auxiliar-lib.js ***!
  \**********************************/
/*! exports provided: AuxiliarLib */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"AuxiliarLib\", function() { return AuxiliarLib; });\nconst AuxiliarLib = (() => {\n\n  const removeChildNodesFrom = (parent) => {\n      while(parent.hasChildNodes()) {\n        parent.removeChild(parent.lastChild);\n      }\n  }\n\n  const removeNodeElement = (element) => {\n    if (element != undefined) {\n      element.parentElement.removeChild(element);\n    }\n  }\n\n  return { removeChildNodesFrom, removeNodeElement }\n\n})();\n\n\n\n\n//# sourceURL=webpack:///./src/util/auxiliar-lib.js?");

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