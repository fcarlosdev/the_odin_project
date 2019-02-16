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

/***/ "./src/assets/css/main.css":
/*!*********************************!*\
  !*** ./src/assets/css/main.css ***!
  \*********************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("// extracted by mini-css-extract-plugin\n\n//# sourceURL=webpack:///./src/assets/css/main.css?");

/***/ }),

/***/ "./src/assets/css/shared.css":
/*!***********************************!*\
  !*** ./src/assets/css/shared.css ***!
  \***********************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("// extracted by mini-css-extract-plugin\n\n//# sourceURL=webpack:///./src/assets/css/shared.css?");

/***/ }),

/***/ "./src/assets/css/task-form.css":
/*!**************************************!*\
  !*** ./src/assets/css/task-form.css ***!
  \**************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("// extracted by mini-css-extract-plugin\n\n//# sourceURL=webpack:///./src/assets/css/task-form.css?");

/***/ }),

/***/ "./src/controllers/project-controller.js":
/*!***********************************************!*\
  !*** ./src/controllers/project-controller.js ***!
  \***********************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _models_project__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ../models/project */ \"./src/models/project.js\");\n/* harmony import */ var _data_store_repository__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ../data_store/repository */ \"./src/data_store/repository.js\");\n\n\n\nconst ProjectController = () => {\n\n    const create = (name) => \n        Object(_data_store_repository__WEBPACK_IMPORTED_MODULE_1__[\"default\"])().saveProject(Object(_models_project__WEBPACK_IMPORTED_MODULE_0__[\"default\"])(generateId(), name))\n\n    const addTask = (task, toProject) => {\n        if ( task !== undefined ){\n            let record = Object(_data_store_repository__WEBPACK_IMPORTED_MODULE_1__[\"default\"])().findProject(toProject.id)\n            record.tasks.push(task)\n            Object(_data_store_repository__WEBPACK_IMPORTED_MODULE_1__[\"default\"])().saveProject(record)\n        }\n    }\n\n    const getProjects = () => Object(_data_store_repository__WEBPACK_IMPORTED_MODULE_1__[\"default\"])().getProjects()\n\n    const getProject = id => {\n        let project = Object(_data_store_repository__WEBPACK_IMPORTED_MODULE_1__[\"default\"])().findProject(project.id)        \n        return (project !== undefined) ? project : null \n    }\n\n    const generateId = () => Object(_data_store_repository__WEBPACK_IMPORTED_MODULE_1__[\"default\"])().getProjects().length + 1\n\n    return {\n        create, getProjects, getProject, addTask\n    }\n}\n\n/* harmony default export */ __webpack_exports__[\"default\"] = (ProjectController);\n\n//# sourceURL=webpack:///./src/controllers/project-controller.js?");

/***/ }),

/***/ "./src/controllers/task-controller.js":
/*!********************************************!*\
  !*** ./src/controllers/task-controller.js ***!
  \********************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _models_task__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ../models/task */ \"./src/models/task.js\");\n\n\nconst TaskController = (() => {\n\n    const create = (task) => \n        Object(_models_task__WEBPACK_IMPORTED_MODULE_0__[\"default\"])(task.id, task.title, task.description, \n             task.dueDate, task.priority)\n\n    return {\n        create\n    }\n\n})\n\n/* harmony default export */ __webpack_exports__[\"default\"] = (TaskController);\n\n//# sourceURL=webpack:///./src/controllers/task-controller.js?");

/***/ }),

/***/ "./src/data_store/repository.js":
/*!**************************************!*\
  !*** ./src/data_store/repository.js ***!
  \**************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\nconst Repository = (() => {\n\n    let storage = sessionStorage\n\n    const saveProject = project => {\n        sessionStorage.setItem(project.id, JSON.stringify(project))\n        return project\n    }\n\n    const findProject = id => JSON.parse(sessionStorage.getItem(id));\n\n    const getProjects = () => \n      Object.assign([], sessionStorage)\n            .filter(record => record !== null)\n            .map(record => JSON.parse(record));\n\n    return {\n        saveProject, findProject, getProjects\n    }\n})\n/* harmony default export */ __webpack_exports__[\"default\"] = (Repository);\n\n//# sourceURL=webpack:///./src/data_store/repository.js?");

/***/ }),

/***/ "./src/dom/dom-elem.js":
/*!*****************************!*\
  !*** ./src/dom/dom-elem.js ***!
  \*****************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\nconst DOMElement = (type) => ({\n\n  element: document.createElement(type),\n\n  setContent(value) {\n    if (value !== undefined && value !== null)\n      this.element.appendChild(document.createTextNode(value));\n    return this;\n  },\n\n  addClasses(classes) {\n    if (classes !== undefined && classes.length !== 0)\n      classes.forEach(classe => this.element.classList.add(classe)) \n    return this;\n  },\n\n  addAttributes(attributes) {\n    if (attributes !== undefined && attributes.length !== 0) {\n      for (let key in attributes) {\n        this.element.setAttribute(key, attributes[key]);\n      }\n    }\n\n    return this;\n  },\n\n  addChildren(children) {\n    if (children !== undefined && children.length !== 0) {\n      children.forEach(child => {\n        this.element.appendChild(child);\n      });\n    }\n\n    return this;\n  },\n\n  attachEvent(event, eventBody) {\n    this.element.addEventListener(event, eventBody);\n    return this;\n  },\n\n  applyStyles(...styles) {\n    if (styles != undefined)\n      this.element.setAttribute('style', styles);\n    return this;\n  },\n\n});\n\n/* harmony default export */ __webpack_exports__[\"default\"] = (DOMElement);\n\n\n//# sourceURL=webpack:///./src/dom/dom-elem.js?");

/***/ }),

/***/ "./src/dom/dom-search.js":
/*!*******************************!*\
  !*** ./src/dom/dom-search.js ***!
  \*******************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\nconst DOMSearch = () => {\n\n  const getGrandParentElement = (selector, level) => {\n      let parentWanted = null;\n\n      if (notNull(selector)) {\n\n        for (let i = 0; i < level; i++) {\n          if (parentWanted === null) {\n            parentWanted = selector.parentElement;\n          } else {\n            parentWanted = parentWanted.parentElement;\n          }\n        }\n      }\n\n      return parentWanted;\n\n    };\n\n  const getElement = selector =>\n    notNull(selector) ? document.querySelector(selector) : null;\n\n  const getChildren = (element,level) => {\n    \n    if ( notNull(element) ) {\n      return (level != undefined) ? element.children[level] : element.children;\n    }\n    return [];\n\n  }\n\n  const notNull = element => (element !== undefined && element !== null);\n\n  return {\n    getGrandParentElement, getElement, getChildren,\n  };\n\n};\n\n/* harmony default export */ __webpack_exports__[\"default\"] = (DOMSearch);\n\n\n//# sourceURL=webpack:///./src/dom/dom-search.js?");

/***/ }),

/***/ "./src/dom/dom-task-form.js":
/*!**********************************!*\
  !*** ./src/dom/dom-task-form.js ***!
  \**********************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _dom_dom_search__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ../dom/dom-search */ \"./src/dom/dom-search.js\");\n/* harmony import */ var _dom_dom_task__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ../dom/dom-task */ \"./src/dom/dom-task.js\");\n/* harmony import */ var _partials_task_form_html__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ../partials/task-form.html */ \"./src/partials/task-form.html\");\n/* harmony import */ var _partials_task_form_html__WEBPACK_IMPORTED_MODULE_2___default = /*#__PURE__*/__webpack_require__.n(_partials_task_form_html__WEBPACK_IMPORTED_MODULE_2__);\n/* harmony import */ var _models_task__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ../models/task */ \"./src/models/task.js\");\n/* harmony import */ var _controllers_task_controller__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! ../controllers/task-controller */ \"./src/controllers/task-controller.js\");\n/* harmony import */ var _controllers_project_controller__WEBPACK_IMPORTED_MODULE_5__ = __webpack_require__(/*! ../controllers/project-controller */ \"./src/controllers/project-controller.js\");\n\n\n\n\n\n\n\nconst DOMFormTask = ((taskEL, project) => {\n\n  let taskForm\n\n  const show = () => {    \n    initForm()    \n    attachEventToCloseButton()\n    attachEventToSaveButton()\n    toggleTaskForm()\n  }\n\n  const save = () => {        \n    const task = Object(_models_task__WEBPACK_IMPORTED_MODULE_3__[\"default\"])(generateId(),\n                      getFieldValue('#task-name'),\n                      getFieldValue('#task-desc'),\n                      getFieldValue('#task-date'),\n                      getFieldValue('#task-priority'))\n\n    Object(_controllers_project_controller__WEBPACK_IMPORTED_MODULE_5__[\"default\"])().addTask(Object(_controllers_task_controller__WEBPACK_IMPORTED_MODULE_4__[\"default\"])().create(task), project)\n\n    taskEL.appendChild(Object(_dom_dom_task__WEBPACK_IMPORTED_MODULE_1__[\"default\"])(task).create())\n    toggleTaskForm()\n    \n  }\n\n  const initForm = () => {\n    taskForm = Object(_dom_dom_search__WEBPACK_IMPORTED_MODULE_0__[\"default\"])().getElement('#formTask')\n    taskForm.innerHTML = _partials_task_form_html__WEBPACK_IMPORTED_MODULE_2___default.a    \n  }\n\n  const toggleTaskForm = () =>  taskForm.classList.toggle('show-modal')\n\n  const attachEventToCloseButton =() => {\n    Object(_dom_dom_search__WEBPACK_IMPORTED_MODULE_0__[\"default\"])().getElement(\".close-button\")\n               .addEventListener('click', toggleTaskForm)\n    Object(_dom_dom_search__WEBPACK_IMPORTED_MODULE_0__[\"default\"])().getElement(\"#cancel-button\")\n               .addEventListener('click', toggleTaskForm)\n  }\n\n  const attachEventToSaveButton = () =>\n    Object(_dom_dom_search__WEBPACK_IMPORTED_MODULE_0__[\"default\"])().getElement(\"#save-button\")\n               .addEventListener('click', save)\n  \n  const getFieldValue = selector => Object(_dom_dom_search__WEBPACK_IMPORTED_MODULE_0__[\"default\"])().getElement(selector).value.trim()\n\n  const generateId = () => project.tasks.length + 1\n\n  return { show }\n\n})\n\n/* harmony default export */ __webpack_exports__[\"default\"] = (DOMFormTask);\n\n\n//# sourceURL=webpack:///./src/dom/dom-task-form.js?");

/***/ }),

/***/ "./src/dom/dom-task.js":
/*!*****************************!*\
  !*** ./src/dom/dom-task.js ***!
  \*****************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _dom_dom_elem__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ../dom/dom-elem */ \"./src/dom/dom-elem.js\");\n\n\nconst DOMTask = ((task) => {\n\n    const create = () =>\n        Object(_dom_dom_elem__WEBPACK_IMPORTED_MODULE_0__[\"default\"])('div').addClasses(['task','box'])\n            .addAttributes({ id: 'Task' + task.id })\n            .addChildren([createTaskHeader(), createTaskContent(), createTaskFooter()])\n            .element\n\n\n    const createTaskHeader = () =>\n        Object(_dom_dom_elem__WEBPACK_IMPORTED_MODULE_0__[\"default\"])('div').addClasses(['task-header'])\n            .addChildren([\n                Object(_dom_dom_elem__WEBPACK_IMPORTED_MODULE_0__[\"default\"])('h4').setContent(task.title).element,\n                Object(_dom_dom_elem__WEBPACK_IMPORTED_MODULE_0__[\"default\"])('span').addClasses(['bt-task','bt-remove'])\n                    .attachEvent('click', () => {\n                        event.target.parentElement.parentElement.remove();\n                    }).setContent('X').element\n            ]).element\n\n    const createTaskContent = () =>\n        Object(_dom_dom_elem__WEBPACK_IMPORTED_MODULE_0__[\"default\"])('div').addClasses(['task-content'])\n            .addChildren([Object(_dom_dom_elem__WEBPACK_IMPORTED_MODULE_0__[\"default\"])('p').setContent(task.description).element])\n            .element\n\n    const createTaskFooter = () =>\n        Object(_dom_dom_elem__WEBPACK_IMPORTED_MODULE_0__[\"default\"])('div').addClasses(['task-footer'])\n            .addChildren([\n                Object(_dom_dom_elem__WEBPACK_IMPORTED_MODULE_0__[\"default\"])('span').addChildren([\n                    Object(_dom_dom_elem__WEBPACK_IMPORTED_MODULE_0__[\"default\"])('span').addClasses(['bold-label']).setContent('Due date: ').element\n                ]).setContent(task.dueDate).element,\n\n                Object(_dom_dom_elem__WEBPACK_IMPORTED_MODULE_0__[\"default\"])('span').addChildren([\n                    Object(_dom_dom_elem__WEBPACK_IMPORTED_MODULE_0__[\"default\"])('span').addClasses(['bold-label']).setContent('Priority: ').element\n                ]).setContent(task.priority).element\n            ]).element                \n\n    return { create }\n})\n\n/* harmony default export */ __webpack_exports__[\"default\"] = (DOMTask);\n\n//# sourceURL=webpack:///./src/dom/dom-task.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _assets_css_main_css__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./assets/css/main.css */ \"./src/assets/css/main.css\");\n/* harmony import */ var _assets_css_main_css__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(_assets_css_main_css__WEBPACK_IMPORTED_MODULE_0__);\n/* harmony import */ var _assets_css_task_form_css__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./assets/css/task-form.css */ \"./src/assets/css/task-form.css\");\n/* harmony import */ var _assets_css_task_form_css__WEBPACK_IMPORTED_MODULE_1___default = /*#__PURE__*/__webpack_require__.n(_assets_css_task_form_css__WEBPACK_IMPORTED_MODULE_1__);\n/* harmony import */ var _assets_css_shared_css__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./assets/css/shared.css */ \"./src/assets/css/shared.css\");\n/* harmony import */ var _assets_css_shared_css__WEBPACK_IMPORTED_MODULE_2___default = /*#__PURE__*/__webpack_require__.n(_assets_css_shared_css__WEBPACK_IMPORTED_MODULE_2__);\n/* harmony import */ var _dom_dom_elem__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ./dom/dom-elem */ \"./src/dom/dom-elem.js\");\n/* harmony import */ var _dom_dom_search__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! ./dom/dom-search */ \"./src/dom/dom-search.js\");\n/* harmony import */ var _dom_dom_task_form__WEBPACK_IMPORTED_MODULE_5__ = __webpack_require__(/*! ./dom/dom-task-form */ \"./src/dom/dom-task-form.js\");\n/* harmony import */ var _controllers_project_controller__WEBPACK_IMPORTED_MODULE_6__ = __webpack_require__(/*! ./controllers/project-controller */ \"./src/controllers/project-controller.js\");\n\n\n\n\n\n\n\n\n\n\nlet txtProjName = Object(_dom_dom_search__WEBPACK_IMPORTED_MODULE_4__[\"default\"])().getElement('#field-project-name')\nlet projectsEL = Object(_dom_dom_search__WEBPACK_IMPORTED_MODULE_4__[\"default\"])().getElement('.projects')\nlet controller = Object(_controllers_project_controller__WEBPACK_IMPORTED_MODULE_6__[\"default\"])()\n\nObject(_dom_dom_search__WEBPACK_IMPORTED_MODULE_4__[\"default\"])().getElement('#bt-project').addEventListener('click', () => {\n\n    if (txtProjName.value.length > 0) {\n\n        let project = controller.create(txtProjName.value)\n\n        let tasksEL = Object(_dom_dom_elem__WEBPACK_IMPORTED_MODULE_3__[\"default\"])('div').addClasses(['tasks']).element\n        \n        let btAddTaskEL = Object(_dom_dom_elem__WEBPACK_IMPORTED_MODULE_3__[\"default\"])('span').setContent('Add task')\n            .addClasses(['bt','bt-add'])\n            .attachEvent('click', () => Object(_dom_dom_task_form__WEBPACK_IMPORTED_MODULE_5__[\"default\"])(tasksEL, project).show()).element\n        \n        let btDelProject = Object(_dom_dom_elem__WEBPACK_IMPORTED_MODULE_3__[\"default\"])('span').setContent('X')\n            .addClasses(['bt','bt-remove'])\n            .attachEvent('click', event => {\n                event.target.parentElement.parentElement.parentElement.remove();\n                txtProjName.focus()        \n            }).element\n        \n        let buttonsWrapper = Object(_dom_dom_elem__WEBPACK_IMPORTED_MODULE_3__[\"default\"])('div').addClasses(['bt-wrapper'])\n            .addChildren([btAddTaskEL, btDelProject])\n            .element\n\n        let projectTitleEL = Object(_dom_dom_elem__WEBPACK_IMPORTED_MODULE_3__[\"default\"])('h3').setContent(project.name).element\n\n        let projectHeader = Object(_dom_dom_elem__WEBPACK_IMPORTED_MODULE_3__[\"default\"])('div').addClasses(['project-header'])\n            .addChildren([projectTitleEL, buttonsWrapper]).element\n\n        let projectEL = Object(_dom_dom_elem__WEBPACK_IMPORTED_MODULE_3__[\"default\"])('div').addClasses(['project'])\n            .addAttributes({id: 'Project'+project.id})\n            .addChildren([projectHeader, tasksEL ])\n            .element        \n\n        projectsEL.appendChild(projectEL)\n\n        txtProjName.value = ''\n        txtProjName.focus()\n      \n    }\n\n})\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/models/project.js":
/*!*******************************!*\
  !*** ./src/models/project.js ***!
  \*******************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\nconst Project = (id, name) => {\n\n    let tasks = []    \n    \n    const getTask = id => tasks.filter(task => task.id === id)\n\n    return {\n        id, name, tasks, getTask\n    }\n\n}\n\n/* harmony default export */ __webpack_exports__[\"default\"] = (Project);\n\n//# sourceURL=webpack:///./src/models/project.js?");

/***/ }),

/***/ "./src/models/task.js":
/*!****************************!*\
  !*** ./src/models/task.js ***!
  \****************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\nconst Task = (id, title, description, dueDate, priority) => {\n\n    return {\n        id, title, description, dueDate, priority\n    }\n\n}\n\n/* harmony default export */ __webpack_exports__[\"default\"] = (Task);\n\n//# sourceURL=webpack:///./src/models/task.js?");

/***/ }),

/***/ "./src/partials/task-form.html":
/*!*************************************!*\
  !*** ./src/partials/task-form.html ***!
  \*************************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("module.exports = \"<div class=\\\"modal-content\\\">\\n    <div class=\\\"modal-header\\\">\\n        <span class=\\\"title\\\">New Task</span>\\n        <span class=\\\"close-button\\\">&times;</span>\\n    </div>\\n    <div class=\\\"fields-wrapper\\\">\\n        <div class=\\\"row\\\">\\n            <label for=\\\"task-name\\\">Name</label>\\n            <input id=\\\"task-name\\\" type=\\\"text\\\" name=\\\"task-name\\\" autofocus\\n                class=\\\"form-field\\\" placeholder=\\\"Task name\\\">\\n        </div>\\n        <div class=\\\"row\\\">\\n            <label for=\\\"task-desc\\\">Description</label>\\n            <textarea name=\\\"task-desc\\\" id=\\\"task-desc\\\" cols=\\\"30\\\" rows=\\\"4\\\" maxlength=\\\"250\\\">\\n                </textarea>\\n        </div>\\n        <div class=\\\"row\\\">\\n            <label for=\\\"task-date\\\">Due Date</label>\\n            <input type=\\\"date\\\" name=\\\"task-date\\\" id=\\\"task-date\\\" class=\\\"form-field\\\">\\n        </div>\\n        <div class=\\\"row\\\">\\n            <label for=\\\"task-priority\\\">Priority</label>\\n            <select name=\\\"task-priority\\\" id=\\\"task-priority\\\" class=\\\"form-field\\\">\\n                <option value=\\\"\\\">Select the priority</option>\\n                <option value=\\\"Low\\\">Low</option>\\n                <option value=\\\"Medium\\\">Medium</option>\\n                <option value=\\\"High\\\">High</option>\\n            </select>\\n        </div>\\n        <div class=\\\"row buttons\\\">\\n            <input id=\\\"cancel-button\\\" type=\\\"button\\\" value=\\\"Cancelar\\\">\\n            <input id=\\\"save-button\\\" type=\\\"button\\\" value=\\\"Salvar\\\">\\n        </div>\\n    </div>\\n</div>\";\n\n//# sourceURL=webpack:///./src/partials/task-form.html?");

/***/ })

/******/ });