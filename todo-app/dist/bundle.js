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

/***/ "./src/controllers/task-controller.js":
/*!********************************************!*\
  !*** ./src/controllers/task-controller.js ***!
  \********************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _data_dataStore__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ../data/dataStore */ \"./src/data/dataStore.js\");\n\n\nconst TaskController = () => {\n\n    const storage = Object(_data_dataStore__WEBPACK_IMPORTED_MODULE_0__[\"DataStore\"])();\n\n    const save = (task, todo) => {\n        storage.saveTodo(\n            addTaskToStoragedTodo(getStorageTodo(todo),\n                                  maptTaskToStorage(task,todo.getId()))\n        );\n        return task;\n    }\n\n    const deleteTask = task => {\n        let storagedTodo = getStorageTodoById(task.getTodoId());\n        for(let key in storagedTodo.tasks) {\n            let storagedTask = storagedTodo[key];\n            console.log(storagedTask);\n        }\n    }\n\n    const maptTaskToStorage = (task, todoId) => {\n        return {\n            id: task.getId(),\n            name: task.getName(),\n            description: task.getDescription(),\n            dueDate: task.getDueDate(),\n            priority: task.getPriority(),\n            todoId: todoId\n        }\n    }\n\n    const findTaskById = taskId => {\n\n    }\n\n    const getStorageTodo = modelTodo => {\n        return JSON.parse(storage.findTodo(modelTodo));\n    }\n\n    const getStorageTodoById = todoId => {\n        return JSON.parse(storage.findTodoById(todoId));\n    }\n\n    const addTaskToStoragedTodo = (storagedTodo, task) => {\n        storagedTodo.tasks.push(task);\n        return storagedTodo;\n    }\n\n    return { save };\n\n}\n\n/* harmony default export */ __webpack_exports__[\"default\"] = (TaskController);\n\n\n//# sourceURL=webpack:///./src/controllers/task-controller.js?");

/***/ }),

/***/ "./src/controllers/task-form-controller.js":
/*!*************************************************!*\
  !*** ./src/controllers/task-form-controller.js ***!
  \*************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _partials_new_task_form_html__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ../partials/new-task-form.html */ \"./src/partials/new-task-form.html\");\n/* harmony import */ var _partials_new_task_form_html__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(_partials_new_task_form_html__WEBPACK_IMPORTED_MODULE_0__);\n\n\nconst TaskFormController = (() => {\n\n    let taskForm;\n\n    const showForm = (saveEventImpl) => {\n        taskForm = document.querySelector(\"#myModal\");\n        taskForm.innerHTML = _partials_new_task_form_html__WEBPACK_IMPORTED_MODULE_0___default.a;\n        taskForm.style.display = \"block\";\n        hideScrollBarOnBody(true);\n        setSaveEvent(saveEventImpl);        \n        closeFormEvent(taskForm);\n    }\n\n    const setSaveEvent = (implementation) => {\n        document.querySelector(\"#save-button\").addEventListener(\"click\", implementation);\n    }\n\n    const closeFormEvent = () => {\n        [\"#cancel-button\", \".close\"].forEach((elem) => {\n          document.querySelector(elem).addEventListener(\"click\", f => {\n            hideScrollBarOnBody(false);\n            closeForm();\n          });\n        })\n    }\n    \n    const closeForm = () => {\n        taskForm.style.display = \"none\";\n    }    \n\n    const getTaskTitle = () => {\n        return getFieldValue(\"#task-title\");\n    }\n\n    const getTaskDescription = () => {\n        return getFieldValue(\"#task-desc\");\n    }\n    const getTaskDueDate = () => {\n        return getFieldValue(\"#task-due-date\");\n    }\n    const getTaskPripority = () => {\n        return getFieldValue(\"#task-priority\");\n    }\n\n    const getFieldValue = (fieldId) => {\n        return document.querySelector(fieldId).value;\n    }\n\n    const hideScrollBarOnBody = (status) => {\n        document.querySelector(\"body\").style.overflow = (status) ? \"hidden\" : \"auto\";\n    }\n\n    return {\n        showForm, closeForm, getTaskTitle, getTaskDescription, getTaskDueDate,\n        getTaskPripority\n    }\n\n})();\n\n/* harmony default export */ __webpack_exports__[\"default\"] = (TaskFormController);\n\n//# sourceURL=webpack:///./src/controllers/task-form-controller.js?");

/***/ }),

/***/ "./src/controllers/todo-controller.js":
/*!********************************************!*\
  !*** ./src/controllers/todo-controller.js ***!
  \********************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _models_todo__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ../models/todo */ \"./src/models/todo.js\");\n/* harmony import */ var _models_task__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ../models/task */ \"./src/models/task.js\");\n/* harmony import */ var _data_dataStore__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ../data/dataStore */ \"./src/data/dataStore.js\");\n\n\n\n\nconst TodoController = () => {\n\n    const storage = Object(_data_dataStore__WEBPACK_IMPORTED_MODULE_2__[\"DataStore\"])();\n\n    const saveTodo = (todo) => {\n        return (storage.saveTodo(mapToTodoStorage(todo))) ? todo : null;\n    }\n\n    const deleteTodo = (todo) => {\n        storage.removeTodo(todo);\n    }\n\n    const find = (todo) => {\n        let todoStorage = JSON.parse(storage.findTodo(todo.id));\n        return (todoStorage !== null) ? mapToTodoModel(todoStorage) : null;\n    }\n\n    const findTodoByName = (todoName) => {\n       let todos = storage.getTodos();\n       for( let key in todos) {\n          let todo = mapToTodoModel(JSON.parse(todos[key]));\n          if (todo.getName() == todoName)\n             return todo;\n       }\n       return null;\n    }\n    \n    const mapToTodoStorage = (todoModel) => {\n        return { id: todoModel.getId(), name: todoModel.getName(), tasks: [] };\n    }\n\n    const mapToTodoModel = (todoStorage) => {\n        let todoModel = Object(_models_todo__WEBPACK_IMPORTED_MODULE_0__[\"Todo\"])(todoStorage.id, todoStorage.name);\n        if (todoStorage.tasks !== undefined) {\n            todoStorage.tasks.forEach(task => {\n                todoModel.addTask(\n                    Object(_models_task__WEBPACK_IMPORTED_MODULE_1__[\"Task\"])(task.id, task.name, task.description, task.dueDate, task.priority)\n                );\n            });\n        }\n        return todoModel;\n    }\n\n    return {saveTodo, deleteTodo, find, findTodoByName}\n}\n\n/* harmony default export */ __webpack_exports__[\"default\"] = (TodoController);\n\n\n//# sourceURL=webpack:///./src/controllers/todo-controller.js?");

/***/ }),

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

/***/ "./src/data/dataStore.js":
/*!*******************************!*\
  !*** ./src/data/dataStore.js ***!
  \*******************************/
/*! exports provided: DataStore */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"DataStore\", function() { return DataStore; });\nconst DataStore = () => {\n\n    const storage = localStorage;\n\n    const saveTodo = (todo) => {\n        try {\n            storage.setItem(getTodoKey(todo.id), JSON.stringify(todo));\n            return true;\n        } catch (error) {\n            alert(\"Ocorred the follow error while trying save the todo: \" + error);\n            return false;\n        }\n    }\n\n    const removeTodo = todo => {\n        try {\n            storage.removeItem(getTodoKey(todo.getId()));\n            return true;\n        } catch (error) {\n            alert(\"It wasn't possible delete the todo \" + todo +\n                  \" because of the error: \" + error);\n            return false;\n        }\n    }\n\n    const removeTask = task => {\n\n    }\n\n    const findTodoById = id => {\n        return storage.getItem(getTodoKey(id));\n    }\n\n    const findTodo = todo => {\n        return storage.getItem(getTodoKey(todo.getId()));\n    }\n\n    const getTodos = () => Object.assign({}, storage);\n\n\n    const getTodoKey = todoId => \"Todo\".concat(todoId);\n\n    return { saveTodo, removeTodo, findTodo, getTodos, findTodoById }\n}\n\n\n\n\n//# sourceURL=webpack:///./src/data/dataStore.js?");

/***/ }),

/***/ "./src/elements/dom-element-lib.js":
/*!*****************************************!*\
  !*** ./src/elements/dom-element-lib.js ***!
  \*****************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n\nconst elementFactory = (type) => ({\n\n    element: document.createElement(type),\n\n    setContent(text) {\n        if (text !== undefined && text !== null)\n            this.element.appendChild(document.createTextNode(text));\n        return this;\n    },\n\n    addClasses(classes) {\n        if (classes !== undefined && classes.length !== 0)\n            this.element.classList.add(classes);\n        return this;\n    },\n\n    addAttributes(attributes) {\n        if (attributes !== undefined && attributes.length !== 0) {\n            for(let key in attributes) {\n                this.element.setAttribute(key,attributes[key]);\n            }\n        }\n        return this;\n    },\n\n    addChildren(children) {\n        if (children !== undefined && children.length !== 0) {\n            children.forEach(child => {\n                this.element.appendChild(child);\n            })\n        }\n        return this;\n    },\n\n    attachEvent(event, eventBody) {\n        this.element.addEventListener(event, eventBody);\n        return this;\n    },\n\n    applyStyles(...styles) {\n      if (styles != undefined) {\n        this.element.setAttribute(\"style\",styles);\n      }\n      return this;\n    }\n\n});\n\n/* harmony default export */ __webpack_exports__[\"default\"] = (elementFactory);\n\n\n//# sourceURL=webpack:///./src/elements/dom-element-lib.js?");

/***/ }),

/***/ "./src/elements/task-details-footer.js":
/*!*********************************************!*\
  !*** ./src/elements/task-details-footer.js ***!
  \*********************************************/
/*! exports provided: TaskDetailsFooter */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"TaskDetailsFooter\", function() { return TaskDetailsFooter; });\n/* harmony import */ var _util_auxiliar_lib_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ../util/auxiliar-lib.js */ \"./src/util/auxiliar-lib.js\");\n/* harmony import */ var _controllers_task_controller__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ../controllers/task-controller */ \"./src/controllers/task-controller.js\");\n\n\n\nconst TaskDetailsFooter = (() => {\n\n  const create = (taskId) => {\n\n    let labelDone = document.createElement(\"label\");\n    labelDone.setAttribute(\"for\",taskId);\n    labelDone.textContent = \"Done\";\n\n    let checkboxDone = document.createElement(\"input\");\n    checkboxDone.setAttribute(\"type\",\"checkbox\");\n    checkboxDone.setAttribute(\"id\",taskId);\n    checkboxDone.setAttribute(\"value\",\"done\");\n    taskDone(checkboxDone,taskId);\n\n    let taskDoneWrapper = document.createElement(\"div\");\n    taskDoneWrapper.classList.add(\"task-done\");\n    taskDoneWrapper.appendChild(checkboxDone);\n    taskDoneWrapper.appendChild(labelDone);\n\n    let removeTextElem = document.createElement(\"span\");\n    removeTextElem.textContent = \"Remove\";\n    removeTask(removeTextElem, taskId);\n\n    let removeTaskWrapper = document.createElement(\"div\");\n    removeTaskWrapper.classList.add(\"bt-remove\");\n    removeTaskWrapper.appendChild(removeTextElem);\n\n    let taskDetailsFooterWrapper = document.createElement(\"div\");\n    taskDetailsFooterWrapper.classList.add(\"task-details-footer\");\n    taskDetailsFooterWrapper.appendChild(taskDoneWrapper);\n    taskDetailsFooterWrapper.appendChild(removeTaskWrapper);\n\n    return taskDetailsFooterWrapper;\n  }\n\n  const taskDone = (element,taskId) => {\n    element.addEventListener(\"click\", e => {\n      let task = document.getElementById(\"task\"+taskId);\n      if (e.target.checked) {\n        task.style.color = \"#fff\";\n        task.querySelector(\"h2\").style.textDecoration = \"line-through\";\n      } else {\n        task.querySelector(\"h2\").style.textDecoration = \"none\";\n      }\n    });\n  }\n\n  const removeTask = (element, taskId) => {\n    element.addEventListener(\"click\", e => {\n      let task = document.getElementById(\"task\"+taskId);\n      // TaskController().deleteTask();\n      _util_auxiliar_lib_js__WEBPACK_IMPORTED_MODULE_0__[\"AuxiliarLib\"].removeNodeElement(task.parentElement);\n    });\n\n    //IMPLEMENT THE EXLCUSION OF LOCALSTOAREG\n  }\n\n  return {create}\n\n})();\n\n\n\n\n//# sourceURL=webpack:///./src/elements/task-details-footer.js?");

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

/***/ "./src/elements/todo-element-params.js":
/*!*********************************************!*\
  !*** ./src/elements/todo-element-params.js ***!
  \*********************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\nconst TodoElementParams = (type,textNode) => ({\n\n  type,\n  textNode,\n  attributes: undefined,\n  classes: undefined,\n  styles: undefined,\n\n  withAttributes(listOfAttributes) {\n    this.attributes = listOfAttributes;\n    return this;\n  },\n\n  withClasses(listOfClasses) {\n    this.classes = listOfClasses;\n    return this;\n  },\n\n  withStyles(listOfStyles) {\n    this.styles = listOfStyles;\n    return this;\n  }\n\n});\n\n/* harmony default export */ __webpack_exports__[\"default\"] = (TodoElementParams);\n\n\n//# sourceURL=webpack:///./src/elements/todo-element-params.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _util_imports__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./util/imports */ \"./src/util/imports.js\");\n/* harmony import */ var _util_imports__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(_util_imports__WEBPACK_IMPORTED_MODULE_0__);\n/* harmony import */ var _todo_app__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./todo-app */ \"./src/todo-app.js\");\n/* harmony import */ var _elements_todo_element_params__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./elements/todo-element-params */ \"./src/elements/todo-element-params.js\");\n\n\n\n\nlet txtNomeTodo  = document.querySelector(\"#txt-todo-name\");\nlet todosList    = document.querySelector(\".lst-todos\");\n\nlet appTodo = Object(_todo_app__WEBPACK_IMPORTED_MODULE_1__[\"TodoApp\"])(todosList, document.querySelector(\"#tasks\"));\n\ndocument.querySelector(\"#new-todo\").addEventListener(\"click\", function() {\n  createTodo();\n});\n\ntxtNomeTodo.addEventListener('keydown', function(event) {\n  if (event.key === \"Enter\") {\n    createTodo();\n  }\n});\n\n\nconst createTodo = () => {\n  let todoElement = appTodo.newTodo(\n    Object(_elements_todo_element_params__WEBPACK_IMPORTED_MODULE_2__[\"default\"])(\"li\",txtNomeTodo.value).withAttributes({id:generateTodoId()})\n  );\n\n  todoElement.attachEvent(\"click\", appTodo.selectTodo);\n\n  todosList.appendChild(todoElement.element);\n  clearTextField(txtNomeTodo);\n}\n\nconst generateTodoId = () => {\n  return todosList.children.length + 1;\n}\n\nconst clearTextField = (field) => {\n  field.value = \"\";\n}\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/models/task.js":
/*!****************************!*\
  !*** ./src/models/task.js ***!
  \****************************/
/*! exports provided: Task */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"Task\", function() { return Task; });\nconst Task = (id, name, description, dueDate, priority, todoId) => {\n\n  const getId = () => id;\n  const getName = () => name;\n  const getDescription = () => description;\n  const getDueDate = () => dueDate;\n  const getPriority = () => priority;\n  const getTodoId = () => todoId;\n\n  return { getId, getName, getDescription, getDueDate, getPriority, getTodoId };\n\n}\n\n\n\n\n//# sourceURL=webpack:///./src/models/task.js?");

/***/ }),

/***/ "./src/models/todo.js":
/*!****************************!*\
  !*** ./src/models/todo.js ***!
  \****************************/
/*! exports provided: Todo */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"Todo\", function() { return Todo; });\nconst Todo = (id, name) => {\n\n  let tasks = [];\n\n  const getId = () => id;\n  const getName = () => name;\n\n  const addTask = (task) => {\n    tasks.push(task);\n  }\n\n  const getTasks = () => {\n    return tasks;\n  }\n\n  const hasTasks = () => {\n    return tasks.length > 0;\n  }\n\n  return { getId, getName, addTask, getTasks, hasTasks }\n\n};\n\n\n\n\n//# sourceURL=webpack:///./src/models/todo.js?");

/***/ }),

/***/ "./src/partials/new-task-form.html":
/*!*****************************************!*\
  !*** ./src/partials/new-task-form.html ***!
  \*****************************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("module.exports = \"<div class=\\\"modal-content\\\">\\n  <div class=\\\"modal-title\\\">\\n    <h1>New Task</h1>\\n    <span class=\\\"close\\\">&times;</span>\\n  </div>\\n  <div class=\\\"modal-form\\\">\\n    <form action=\\\"#\\\">\\n      <div class=\\\"group-fields\\\">\\n        <label for=\\\"task-title\\\">Title</label>\\n        <input id =\\\"task-title\\\" type=\\\"input\\\" name=\\\"task-title\\\"\\n          autofocus class=\\\"field-form\\\">\\n      </div>\\n\\n      <div class=\\\"group-fields\\\">\\n        <label for=\\\"task-description\\\">Description</label>\\n        <textarea id=\\\"task-desc\\\" name=\\\"task-description\\\" rows=\\\"4\\\" cols=\\\"80\\\"></textarea>\\n      </div>\\n\\n      <div class=\\\"group-fields\\\">\\n        <label for=\\\"task-due-date\\\">Due date</label>\\n        <input id=\\\"task-due-date\\\" type=\\\"date\\\" name=\\\"task-due-date\\\"  class=\\\"date-field\\\">\\n      </div>\\n\\n      <div class=\\\"group-fields\\\">\\n        <label for=\\\"task-priority\\\">Priority</label>\\n        <select id=\\\"task-priority\\\" name=\\\"task-priority\\\" >\\n          <option value=\\\"none\\\">Select the priority</option>\\n          <option value=\\\"Low\\\">Low</option>\\n          <option value=\\\"Medium\\\">Medium</option>\\n          <option value=\\\"High\\\">High</option>\\n        </select>\\n      </div>\\n    </form>\\n    <div class=\\\"modal-buttons\\\">\\n      <div id=\\\"save-button\\\">Save</div>\\n      <div id=\\\"cancel-button\\\">Cancel</div>\\n    </div>\\n  </div>\\n</div>\\n\";\n\n//# sourceURL=webpack:///./src/partials/new-task-form.html?");

/***/ }),

/***/ "./src/todo-app.js":
/*!*************************!*\
  !*** ./src/todo-app.js ***!
  \*************************/
/*! exports provided: TodoApp */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"TodoApp\", function() { return TodoApp; });\n/* harmony import */ var _models_todo__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./models/todo */ \"./src/models/todo.js\");\n/* harmony import */ var _models_task__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./models/task */ \"./src/models/task.js\");\n/* harmony import */ var _controllers_todo_controller__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./controllers/todo-controller */ \"./src/controllers/todo-controller.js\");\n/* harmony import */ var _controllers_task_controller__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ./controllers/task-controller */ \"./src/controllers/task-controller.js\");\n/* harmony import */ var _controllers_task_form_controller__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! ./controllers/task-form-controller */ \"./src/controllers/task-form-controller.js\");\n/* harmony import */ var _elements_task_header__WEBPACK_IMPORTED_MODULE_5__ = __webpack_require__(/*! ./elements/task-header */ \"./src/elements/task-header.js\");\n/* harmony import */ var _elements_task_details__WEBPACK_IMPORTED_MODULE_6__ = __webpack_require__(/*! ./elements/task-details */ \"./src/elements/task-details.js\");\n/* harmony import */ var _util_auxiliar_lib__WEBPACK_IMPORTED_MODULE_7__ = __webpack_require__(/*! ./util/auxiliar-lib */ \"./src/util/auxiliar-lib.js\");\n/* harmony import */ var _elements_dom_element_lib__WEBPACK_IMPORTED_MODULE_8__ = __webpack_require__(/*! ./elements/dom-element-lib */ \"./src/elements/dom-element-lib.js\");\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nconst TodoApp = (todosList, tasksList) => {\n\n  let todoModel;\n\n  let todoController = Object(_controllers_todo_controller__WEBPACK_IMPORTED_MODULE_2__[\"default\"])();\n  let taskController = Object(_controllers_task_controller__WEBPACK_IMPORTED_MODULE_3__[\"default\"])();\n\n\n  const createTodoModel = (id, todoName) => {\n    todoModel = todoController.saveTodo(Object(_models_todo__WEBPACK_IMPORTED_MODULE_0__[\"Todo\"])(id, todoName));\n  }\n\n  const newTodo = (params) => {\n    createTodoModel(params.attributes.id, params.textNode);\n\n    return Object(_elements_dom_element_lib__WEBPACK_IMPORTED_MODULE_8__[\"default\"])(params.type).setContent(params.textNode)\n                                      .addClasses(params.classes)\n                                      .addAttributes(params.attributes);\n  }\n\n  const selectTodo = (e) => {\n    showSelectedTodo(selectDomElement(\".todo-title\"),e.target);\n    updateTasksList(e.target.textContent);\n    selectDomElement(\".bt-remove\").addEventListener(\"click\", removeTodo);\n    selectDomElement(\".add-task\").addEventListener(\"click\", createTask);\n  }\n\n  const showSelectedTodo = (todoSelected, todoEl) => {\n    let titleTodoSelected = selectChildDOMElement(\"h1\", todoSelected);\n    titleTodoSelected.setAttribute(\"id\",\"Todo\"+todoEl.getAttribute(\"id\"));    \n    titleTodoSelected.textContent = todoEl.textContent;\n\n    todoSelected.style.display = \"flex\";\n  }\n\n  const removeTodo = (e) => {\n    let todoSelected = e.target.parentElement.parentElement;\n    _util_auxiliar_lib__WEBPACK_IMPORTED_MODULE_7__[\"AuxiliarLib\"].removeNodeElement(\n      findTodo(selectChildDOMElement(\"h1\", todoSelected).textContent.trim())\n    );\n\n    todoController.deleteTodo(todoModel);\n    updateTasksList(todoModel.getName());\n\n    selectChildDOMElement(\"h1\", todoSelected).textContent = \"\";\n    todoSelected.style.display = \"none\";\n  }\n\n  const createTask = (e) => {\n    _controllers_task_form_controller__WEBPACK_IMPORTED_MODULE_4__[\"default\"].showForm(saveTask);\n  }\n\n  const saveTask = () => {\n    //REPLACE THIS CREATION OF TASK BY A PARAMETERS OBJECT AND LET THE CONTROLLER TAKE CARE OF\n    //THIS CREATION.\n    let task = Object(_models_task__WEBPACK_IMPORTED_MODULE_1__[\"Task\"])(generateTaskId(), _controllers_task_form_controller__WEBPACK_IMPORTED_MODULE_4__[\"default\"].getTaskTitle(),\n                    _controllers_task_form_controller__WEBPACK_IMPORTED_MODULE_4__[\"default\"].getTaskDescription(), _controllers_task_form_controller__WEBPACK_IMPORTED_MODULE_4__[\"default\"].getTaskDueDate(),\n                    _controllers_task_form_controller__WEBPACK_IMPORTED_MODULE_4__[\"default\"].getTaskPripority(), todoModel.getId());\n      taskController.save(task,todoModel);\n      createTaskElement(task);\n      _controllers_task_form_controller__WEBPACK_IMPORTED_MODULE_4__[\"default\"].closeForm();\n  }\n\n  const createTaskElement = (task) => {\n    let taskHeaderElement = _elements_task_header__WEBPACK_IMPORTED_MODULE_5__[\"TaskHeader\"].create(task.getId(), task.getName());\n    let taskDetailsElement = _elements_task_details__WEBPACK_IMPORTED_MODULE_6__[\"TaskDetails\"].create(task.getId(), task.getDueDate(), task.getPriority(),\n                                                task.getDescription());\n\n    let taskItem = Object(_elements_dom_element_lib__WEBPACK_IMPORTED_MODULE_8__[\"default\"])(\"li\").addAttributes({ id: \"taskItem\" + task.getId() })\n                                       .addChildren([taskHeaderElement, taskDetailsElement]);\n    setTaskColorBasedOnPriority(taskItem, task.getPriority());\n    tasksList.appendChild(taskItem.element);\n  }\n\n  const setTaskColorBasedOnPriority = (taskItem, taskPriority) => {\n    if (taskPriority == \"Low\") {\n      taskItem.addClasses(\"low-priority\");\n    } else if (taskPriority == \"Medium\") {\n      taskItem.addClasses(\"medium-priority\");\n    } else {\n      taskItem.addClasses(\"high-priority\");\n    }\n\n  }\n\n  const selectDomElement = (selector) => {\n    return document.querySelector(selector);\n  }\n\n  const selectChildDOMElement = (child, parent) => {\n    return parent.querySelector(child);\n  }\n\n  const findTodo = (withName) => {\n    let todo = Array.from(todosList.children)\n                    .filter(todo => todo.textContent == withName);\n    return (todo.length > 0) ? todo[0] : undefined;\n  }\n\n  const generateTaskId = () => {\n    return tasksList.children.length + 1;\n  }\n\n  const updateTasksList = (name) => {\n\n    _util_auxiliar_lib__WEBPACK_IMPORTED_MODULE_7__[\"AuxiliarLib\"].removeChildNodesFrom(selectDomElement(\"#tasks\"));\n\n    if (todoModel.getName() !== name) {\n      todoModel = todoController.findTodoByName(name)\n      if (todoModel !== undefined && todoModel !== null) {\n        todoModel.getTasks().forEach(task => {\n          createTaskElement(task);\n        });\n      }\n    }\n\n  }\n\n  return { newTodo, selectTodo }\n}\n\n\n\n\n//# sourceURL=webpack:///./src/todo-app.js?");

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