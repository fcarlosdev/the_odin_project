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

/***/ "./src/css/style.css":
/*!***************************!*\
  !*** ./src/css/style.css ***!
  \***************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("// extracted by mini-css-extract-plugin\n\n//# sourceURL=webpack:///./src/css/style.css?");

/***/ }),

/***/ "./src/images/beef-food.jpg":
/*!**********************************!*\
  !*** ./src/images/beef-food.jpg ***!
  \**********************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("module.exports = __webpack_require__.p + \"89c372f02b02ada7ee0e29d426017188.jpg\";\n\n//# sourceURL=webpack:///./src/images/beef-food.jpg?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _css_style_css__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./css/style.css */ \"./src/css/style.css\");\n/* harmony import */ var _css_style_css__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(_css_style_css__WEBPACK_IMPORTED_MODULE_0__);\n/* harmony import */ var _images_beef_food_jpg__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./images/beef-food.jpg */ \"./src/images/beef-food.jpg\");\n/* harmony import */ var _images_beef_food_jpg__WEBPACK_IMPORTED_MODULE_1___default = /*#__PURE__*/__webpack_require__.n(_images_beef_food_jpg__WEBPACK_IMPORTED_MODULE_1__);\n/* harmony import */ var _js_header_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./js/header.js */ \"./src/js/header.js\");\n/* harmony import */ var _js_about_js__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ./js/about.js */ \"./src/js/about.js\");\n\n\n\n\n\nlet tabsContainer = document.querySelector(\"#content\");\n_js_header_js__WEBPACK_IMPORTED_MODULE_2__[\"loadPage\"](tabsContainer);\n_js_about_js__WEBPACK_IMPORTED_MODULE_3__[\"loadPage\"](tabsContainer);\n\nlet tabAbout = tabsContainer.querySelector(\"#mnAbout\");\nlet tabMenu = tabsContainer.querySelector(\"#mnMenu\");\nlet tabContact = tabsContainer.querySelector(\"#mnContact\");\n\ntabAbout.classList.add(\"activate\");\n\ntabAbout.addEventListener(\"click\",function() {\n  controlTabsActivate(tabAbout, [tabMenu, tabContact]);\n  _js_about_js__WEBPACK_IMPORTED_MODULE_3__[\"loadPage\"](tabsContainer);\n});\n\ntabMenu.addEventListener(\"click\",function() {\n  controlTabsActivate(tabMenu, [tabAbout, tabContact]);\n\n});\n\ntabContact.addEventListener(\"click\",function() {\n  controlTabsActivate(tabContact, [tabMenu, tabAbout]);\n});\n\nconst controlTabsActivate = (tabActivated, tabsDesactivated) => {\n  tabActivated.classList.add(\"activate\");\n  if (tabsDesactivated.length > 0) {\n      tabsDesactivated.forEach(function(tab) {\n          tab.classList.remove(\"activate\");\n      });\n  }\n}\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/js/about.js":
/*!*************************!*\
  !*** ./src/js/about.js ***!
  \*************************/
/*! exports provided: loadPage */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"loadPage\", function() { return loadPage; });\n/* harmony import */ var _js_util_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ../js/util.js */ \"./src/js/util.js\");\n\n\nconst loadPage = (mainContent) => {\n\n  const pMeal = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"p\",\n        \"Enjoy of our great variety of foods of the four corners of \" +\n        \" the world, with all of its colors, flavors an culture.\",\n        [],[]);\n\n  const h2MealsTag = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"h2\",\"Delicious Meals\",[],[]);\n\n  const mealElement = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"div\",\"\",[],[\"service-type\",\"meal\"]);\n  mealElement.appendChild(h2MealsTag);\n  mealElement.appendChild(pMeal);\n\n  const pDrink = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"p\",\n        \"Drink the since the most simple soda to the most exoctic \" +\n        \"drink that you can imagine.\",\n        [],[]);\n\n  const h2DrinksTag = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"h2\",\"Good Drinks\",[],[]);\n\n  const drinksElement = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"div\",\"\",[],[\"service-type\",\"drinks\"]);\n  drinksElement.appendChild(h2DrinksTag);\n  drinksElement.appendChild(pDrink);\n\n  const pDessert = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"p\",\n        `Prove an imense collection of flavors of desserts that you ` +\n        `can't even imagine that are exists`\n        ,[],[]);\n\n  const h2DessertsTag = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"h2\",\"Tasty Desserts\",[],[]);\n\n  const dessertsElement = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"div\",\"\",[],[\"service-type\",\"desserts\"]);\n  dessertsElement.appendChild(h2DessertsTag);\n  dessertsElement.appendChild(pDessert);\n\n  const headLine = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"div\",\"\",[],[\"headline\"]);\n  headLine.appendChild(mealElement);\n  headLine.appendChild(drinksElement);\n  headLine.appendChild(dessertsElement);\n\n  const aboutPage = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"section\",\"\",[],[]);\n  aboutPage.appendChild(headLine);\n\n  mainContent.appendChild(aboutPage);\n  return mainContent;\n};\n\n\n\n\n//# sourceURL=webpack:///./src/js/about.js?");

/***/ }),

/***/ "./src/js/header.js":
/*!**************************!*\
  !*** ./src/js/header.js ***!
  \**************************/
/*! exports provided: loadPage */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"loadPage\", function() { return loadPage; });\n/* harmony import */ var _js_util_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ../js/util.js */ \"./src/js/util.js\");\n\n\nconst loadPage = (mainContent) => {\n\n  const h1Tag = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"h1\",\"International Cousine\",[],[]);\n\n  const header = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"div\",\"\",[],[\"header\"]);\n  header.appendChild(h1Tag);\n\n  const bannerArea = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"div\",\"\",{\"id\": \"banner\"},[\"centralize\"]);\n  bannerArea.appendChild(header);\n\n  const aboutItemBar = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"div\",\"ABOUT\",{\"id\": \"mnAbout\"},[\"menu-item\"]);\n  const menuItemBar = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"div\",\"MENU\",{\"id\": \"mnMenu\"},[\"menu-item\"]);\n  const contactItemBar = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"div\",\"CONTACT\",{\"id\": \"mnContact\"},[\"menu-item\"]);\n\n  const tabsBar = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"div\",\"\",[],[\"menu\"]);\n  tabsBar.appendChild(aboutItemBar);\n  tabsBar.appendChild(menuItemBar);\n  tabsBar.appendChild(contactItemBar);\n\n  mainContent.appendChild(bannerArea);\n  mainContent.appendChild(tabsBar);\n\n  return mainContent;\n};\n\n\n\n\n//# sourceURL=webpack:///./src/js/header.js?");

/***/ }),

/***/ "./src/js/util.js":
/*!************************!*\
  !*** ./src/js/util.js ***!
  \************************/
/*! exports provided: newElement */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"newElement\", function() { return newElement; });\nconst newElement = (type, value,attributes, classes) => {\n  const element = document.createElement(type);\n  element.textContent = value;\n\n  if (attributes != null) {\n    const attributesKeys = Object.keys(attributes);\n    if (attributesKeys.length > 0) {\n      attributesKeys.forEach(function(key) {\n        element.setAttribute(key, attributes[key]);\n      });\n    }\n  }\n\n  if (classes != null && classes.length > 0) {\n    classes.forEach(function(className) {\n      element.classList.add(className);\n    });\n  }\n\n  return element;\n};\n\n\n\n\n//# sourceURL=webpack:///./src/js/util.js?");

/***/ })

/******/ });