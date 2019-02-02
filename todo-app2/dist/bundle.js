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
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/assets/js/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/assets/js/index.js":
/*!********************************!*\
  !*** ./src/assets/js/index.js ***!
  \********************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("\nlet projects = document.querySelector(\".projects\");\nlet fieldProjectName = document.querySelector(\"#proj-txt-name\");\n\n\ndocument.querySelector(\"#bt-add-prj\").addEventListener(\"click\", \n    () => {\n        let projId = projects.children.length + 1;\n        addProjectToProjectList(createProject(projId, getProjectName()))\n    }\n)\n\ngetProjectName = () => fieldProjectName.value;\n\naddProjectToProjectList = project => {        \n    projects.appendChild(project);\n    clearFieldText();\n}\n\ncreateProject = (id, name) => {\n    let project = document.createElement(\"div\");\n        project.classList.add(\"project\");\n        project.setAttribute(\"id\",\"project\"+id);        \n        project.appendChild(createProjectTitle(name));\n        project.appendChild(createTaskList());\n        project.appendChild(createProjectFooter(project));\n\n        // let finalHeight = 80;\n        // for (let h = 0; h < project.children[1].length; h++) {\n        //     finalHeight += 38;\n        // }\n\n        // project.style.height = finalHeight + \"px\";\n    return project;\n}\n\ncreateProjectTitle = title => {\n    let projectTitle = document.createElement(\"h3\");\n        projectTitle.innerHTML = title;\n    return projectTitle;\n}\n\ncreateTaskList = () => {\n    let tasks = document.createElement(\"div\");\n        tasks.classList.add(\"tasks\");       \n    return tasks;\n}\n\ncreateProjectFooter = project => {\n    let footer = document.createElement(\"div\");\n        footer.classList.add(\"project-footer\");\n    let addTaskLink = document.createElement(\"span\");\n        addTaskLink.classList.add(\"newtask\");\n        addTaskLink.innerHTML = \"+ Add task\";\n        addTaskLink.addEventListener(\"click\", (event) => {\n\n            let tasks = project.children[1];\n\n            let taskId = tasks.children.length + 1;\n            let newTask = document.createElement(\"div\");\n                newTask.classList.add(\"task-item\");\n                newTask.setAttribute(\"id\",\"task\"+taskId);\n\n            let taskHeader = document.createElement(\"div\");\n                taskHeader.classList.add(\"task-header\");\n\n            let taskTitle = document.createElement(\"h4\");\n                taskTitle.innerHTML = \"Task name\";\n\n            let taskHeaderButtons = document.createElement(\"div\");\n                taskHeaderButtons.classList.add(\"t-header-buttons\");\n\n            let lkDetails = document.createElement(\"span\");\n                lkDetails.classList.add(\"lk-details\");\n                lkDetails.innerHTML = \"Details\";\n                lkDetails.addEventListener(\"click\", () => showDetails(lkDetails,newTask));\n\n            let lkRemove = document.createElement(\"span\");\n                lkRemove.classList.add(\"lk-remove\");\n                lkRemove.innerHTML = \"Remove\";\n                lkRemove.addEventListener(\"click\", () => removeTask(newTask));\n\n            taskHeaderButtons.appendChild(lkDetails);\n            taskHeaderButtons.appendChild(lkRemove);\n            taskHeader.appendChild(taskTitle);\n\n            taskHeader.appendChild(taskHeaderButtons);\n            \n            let taskContent = document.createElement(\"div\");\n            taskContent.classList.add(\"task-content\");\n            taskContent.innerHTML = \"This is a model of a task it'll be when the add task link is clicked\";\n\n            let taskFooter = document.createElement(\"div\");\n                taskFooter.classList.add(\"task-footer\");\n\n            let dueDate = document.createElement(\"span\");\n                dueDate.classList.add(\"due-date\");\n            let dueDateLabel = document.createElement(\"span\");\n                dueDateLabel.classList.add(\"l-bold\");\n                dueDateLabel.innerHTML = \"Due date:\";\n            dueDate.appendChild(dueDateLabel);\n            dueDate.innerHTML += \" 31/01/2019\";\n\n            let priority = document.createElement(\"span\");\n                priority.classList.add(\"priority\");\n            let priorityLabel = document.createElement(\"span\");\n                priorityLabel.classList.add(\"l-bold\");\n                priorityLabel.innerHTML = \"Priority:\";\n            priority.appendChild(priorityLabel);\n            priority.innerHTML += \" Low\";\n\n            let spDone = document.createElement(\"span\");                \n            let chkDone = document.createElement(\"input\");\n                chkDone.setAttribute(\"type\",\"checkbox\");\n                chkDone.classList.add(\"task-done\");\n            spDone.appendChild(chkDone);\n            spDone.innerHTML += \" Done\";\n\n            taskFooter.appendChild(dueDate);\n            taskFooter.appendChild(priority);\n            taskFooter.appendChild(spDone);\n            \n            newTask.appendChild(taskHeader);\n            newTask.appendChild(taskContent);\n            newTask.appendChild(taskFooter);\n\n            newTask.style.marginBottom = \"10px\";\n\n            tasks.insertBefore(newTask,tasks.children[0]);\n\n            let finalHeight = 80;\n            for (let h = 0; h < tasks.children.length; h++) {\n              finalHeight += 48;\n            }\n\n            if (finalHeight < 282) {\n                project.style.height = finalHeight + \"px\";\n            } \n            else {\n                project.style.height = \"320px\";\n            }\n\n        }); \n\n        if (project.children[1].children.length == 0) {\n            project.style.height = \"80px\";\n        } \n        footer.appendChild(addTaskLink);\n    return footer;        \n}\n\nclearFieldText = () => {\n    fieldProjectName.value=\"\";\n}\n\nshowDetails = (details,task) => {\n    task.style.height = (task.style.height == \"150px\") ? \"38px\" : \"150px\";\n    details.textContent = (details.textContent == \"Details\") ? \"Hide\" : \"Details\";\n    task.children[1].style.display = (details.textContent == \"Details\") ? \"none\" : \"flex\";\n    task.children[2].style.display = (details.textContent == \"Details\") ? \"none\" : \"flex\";\n    let project = task.parentElement.parentElement;\n    project.style.height = \"auto\";\n    project.style.display = \"flex\";\n}\n\nremoveTask = task => {\n    let tasks = task.parentElement;\n    let project = task.parentElement.parentElement;\n    let h = project.style.height;\n    task.parentElement.removeChild(task);\n    \n    if (tasks.children.length < 5) {\n        let nH = Number(h.substring(0,h.length-2)) - 48;\n        project.style.height = nH.toString().concat(\"px\");\n    }    \n}\n\n\nlet details = document.querySelector(\".lk-details\");\nlet task = document.querySelector(\".task-item\");\nlet taskDetails = document.querySelector(\".task-content\");\nlet taskFooter = document.querySelector(\".task-footer\");\nlet project = document.querySelector(\"#project1\");\n\ndetails.addEventListener(\"click\", () => {\n  task.style.height = (task.style.height == \"150px\") ? \"38px\" : \"150px\";\n  details.textContent = (details.textContent == \"Details\") ? \"Hide\" : \"Details\";\n  taskDetails.style.display =  (details.textContent == \"Details\") ? \"none\" : \"flex\";\n  taskFooter.style.display= (details.textContent == \"Details\") ? \"none\" : \"flex\";\n  project.style.height = \"auto\";\n  project.style.display = \"flex\";\n})\n\n\n//# sourceURL=webpack:///./src/assets/js/index.js?");

/***/ })

/******/ });