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

/***/ "./src/css/menu_page.css":
/*!*******************************!*\
  !*** ./src/css/menu_page.css ***!
  \*******************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("// extracted by mini-css-extract-plugin\n\n//# sourceURL=webpack:///./src/css/menu_page.css?");

/***/ }),

/***/ "./src/css/style.css":
/*!***************************!*\
  !*** ./src/css/style.css ***!
  \***************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("// extracted by mini-css-extract-plugin\n\n//# sourceURL=webpack:///./src/css/style.css?");

/***/ }),

/***/ "./src/images/american_food.jpeg":
/*!***************************************!*\
  !*** ./src/images/american_food.jpeg ***!
  \***************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("module.exports = __webpack_require__.p + \"images/american_food.jpeg\";\n\n//# sourceURL=webpack:///./src/images/american_food.jpeg?");

/***/ }),

/***/ "./src/images/beef_food.jpeg":
/*!***********************************!*\
  !*** ./src/images/beef_food.jpeg ***!
  \***********************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("module.exports = __webpack_require__.p + \"images/beef_food.jpeg\";\n\n//# sourceURL=webpack:///./src/images/beef_food.jpeg?");

/***/ }),

/***/ "./src/images/brazilian_drinks.jpeg":
/*!******************************************!*\
  !*** ./src/images/brazilian_drinks.jpeg ***!
  \******************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("module.exports = __webpack_require__.p + \"images/brazilian_drinks.jpeg\";\n\n//# sourceURL=webpack:///./src/images/brazilian_drinks.jpeg?");

/***/ }),

/***/ "./src/images/brazilian_food.jpeg":
/*!****************************************!*\
  !*** ./src/images/brazilian_food.jpeg ***!
  \****************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("module.exports = __webpack_require__.p + \"images/brazilian_food.jpeg\";\n\n//# sourceURL=webpack:///./src/images/brazilian_food.jpeg?");

/***/ }),

/***/ "./src/images/chinese_drinks.jpeg":
/*!****************************************!*\
  !*** ./src/images/chinese_drinks.jpeg ***!
  \****************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("module.exports = __webpack_require__.p + \"images/chinese_drinks.jpeg\";\n\n//# sourceURL=webpack:///./src/images/chinese_drinks.jpeg?");

/***/ }),

/***/ "./src/images/chinese_food.jpeg":
/*!**************************************!*\
  !*** ./src/images/chinese_food.jpeg ***!
  \**************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("module.exports = __webpack_require__.p + \"images/chinese_food.jpeg\";\n\n//# sourceURL=webpack:///./src/images/chinese_food.jpeg?");

/***/ }),

/***/ "./src/images/french_drinks.jpeg":
/*!***************************************!*\
  !*** ./src/images/french_drinks.jpeg ***!
  \***************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("module.exports = __webpack_require__.p + \"images/french_drinks.jpeg\";\n\n//# sourceURL=webpack:///./src/images/french_drinks.jpeg?");

/***/ }),

/***/ "./src/images/french_food.jpeg":
/*!*************************************!*\
  !*** ./src/images/french_food.jpeg ***!
  \*************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("module.exports = __webpack_require__.p + \"images/french_food.jpeg\";\n\n//# sourceURL=webpack:///./src/images/french_food.jpeg?");

/***/ }),

/***/ "./src/images/german_drinks.jpeg":
/*!***************************************!*\
  !*** ./src/images/german_drinks.jpeg ***!
  \***************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("module.exports = __webpack_require__.p + \"images/german_drinks.jpeg\";\n\n//# sourceURL=webpack:///./src/images/german_drinks.jpeg?");

/***/ }),

/***/ "./src/images/german_food.jpeg":
/*!*************************************!*\
  !*** ./src/images/german_food.jpeg ***!
  \*************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("module.exports = __webpack_require__.p + \"images/german_food.jpeg\";\n\n//# sourceURL=webpack:///./src/images/german_food.jpeg?");

/***/ }),

/***/ "./src/images/italian_drinks.jpeg":
/*!****************************************!*\
  !*** ./src/images/italian_drinks.jpeg ***!
  \****************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("module.exports = __webpack_require__.p + \"images/italian_drinks.jpeg\";\n\n//# sourceURL=webpack:///./src/images/italian_drinks.jpeg?");

/***/ }),

/***/ "./src/images/italian_food.jpeg":
/*!**************************************!*\
  !*** ./src/images/italian_food.jpeg ***!
  \**************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("module.exports = __webpack_require__.p + \"images/italian_food.jpeg\";\n\n//# sourceURL=webpack:///./src/images/italian_food.jpeg?");

/***/ }),

/***/ "./src/images/japanese_drinks.jpeg":
/*!*****************************************!*\
  !*** ./src/images/japanese_drinks.jpeg ***!
  \*****************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("module.exports = __webpack_require__.p + \"images/japanese_drinks.jpeg\";\n\n//# sourceURL=webpack:///./src/images/japanese_drinks.jpeg?");

/***/ }),

/***/ "./src/images/japanese_food.jpeg":
/*!***************************************!*\
  !*** ./src/images/japanese_food.jpeg ***!
  \***************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("module.exports = __webpack_require__.p + \"images/japanese_food.jpeg\";\n\n//# sourceURL=webpack:///./src/images/japanese_food.jpeg?");

/***/ }),

/***/ "./src/images/mexican_drinks.jpeg":
/*!****************************************!*\
  !*** ./src/images/mexican_drinks.jpeg ***!
  \****************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("module.exports = __webpack_require__.p + \"images/mexican_drinks.jpeg\";\n\n//# sourceURL=webpack:///./src/images/mexican_drinks.jpeg?");

/***/ }),

/***/ "./src/images/mexican_food.jpeg":
/*!**************************************!*\
  !*** ./src/images/mexican_food.jpeg ***!
  \**************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("module.exports = __webpack_require__.p + \"images/mexican_food.jpeg\";\n\n//# sourceURL=webpack:///./src/images/mexican_food.jpeg?");

/***/ }),

/***/ "./src/images/spanish_drinks.jpeg":
/*!****************************************!*\
  !*** ./src/images/spanish_drinks.jpeg ***!
  \****************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("module.exports = __webpack_require__.p + \"images/spanish_drinks.jpeg\";\n\n//# sourceURL=webpack:///./src/images/spanish_drinks.jpeg?");

/***/ }),

/***/ "./src/images/spanish_food.jpeg":
/*!**************************************!*\
  !*** ./src/images/spanish_food.jpeg ***!
  \**************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("module.exports = __webpack_require__.p + \"images/spanish_food.jpeg\";\n\n//# sourceURL=webpack:///./src/images/spanish_food.jpeg?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _css_style_css__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./css/style.css */ \"./src/css/style.css\");\n/* harmony import */ var _css_style_css__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(_css_style_css__WEBPACK_IMPORTED_MODULE_0__);\n/* harmony import */ var _css_menu_page_css__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./css/menu_page.css */ \"./src/css/menu_page.css\");\n/* harmony import */ var _css_menu_page_css__WEBPACK_IMPORTED_MODULE_1___default = /*#__PURE__*/__webpack_require__.n(_css_menu_page_css__WEBPACK_IMPORTED_MODULE_1__);\n/* harmony import */ var _js_header_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./js/header.js */ \"./src/js/header.js\");\n/* harmony import */ var _js_about_js__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ./js/about.js */ \"./src/js/about.js\");\n/* harmony import */ var _js_menu_js__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! ./js/menu.js */ \"./src/js/menu.js\");\n/* harmony import */ var _images_beef_food_jpeg__WEBPACK_IMPORTED_MODULE_5__ = __webpack_require__(/*! ./images/beef_food.jpeg */ \"./src/images/beef_food.jpeg\");\n/* harmony import */ var _images_beef_food_jpeg__WEBPACK_IMPORTED_MODULE_5___default = /*#__PURE__*/__webpack_require__.n(_images_beef_food_jpeg__WEBPACK_IMPORTED_MODULE_5__);\n/* harmony import */ var _images_german_food_jpeg__WEBPACK_IMPORTED_MODULE_6__ = __webpack_require__(/*! ./images/german_food.jpeg */ \"./src/images/german_food.jpeg\");\n/* harmony import */ var _images_german_food_jpeg__WEBPACK_IMPORTED_MODULE_6___default = /*#__PURE__*/__webpack_require__.n(_images_german_food_jpeg__WEBPACK_IMPORTED_MODULE_6__);\n/* harmony import */ var _images_american_food_jpeg__WEBPACK_IMPORTED_MODULE_7__ = __webpack_require__(/*! ./images/american_food.jpeg */ \"./src/images/american_food.jpeg\");\n/* harmony import */ var _images_american_food_jpeg__WEBPACK_IMPORTED_MODULE_7___default = /*#__PURE__*/__webpack_require__.n(_images_american_food_jpeg__WEBPACK_IMPORTED_MODULE_7__);\n/* harmony import */ var _images_brazilian_food_jpeg__WEBPACK_IMPORTED_MODULE_8__ = __webpack_require__(/*! ./images/brazilian_food.jpeg */ \"./src/images/brazilian_food.jpeg\");\n/* harmony import */ var _images_brazilian_food_jpeg__WEBPACK_IMPORTED_MODULE_8___default = /*#__PURE__*/__webpack_require__.n(_images_brazilian_food_jpeg__WEBPACK_IMPORTED_MODULE_8__);\n/* harmony import */ var _images_chinese_food_jpeg__WEBPACK_IMPORTED_MODULE_9__ = __webpack_require__(/*! ./images/chinese_food.jpeg */ \"./src/images/chinese_food.jpeg\");\n/* harmony import */ var _images_chinese_food_jpeg__WEBPACK_IMPORTED_MODULE_9___default = /*#__PURE__*/__webpack_require__.n(_images_chinese_food_jpeg__WEBPACK_IMPORTED_MODULE_9__);\n/* harmony import */ var _images_french_food_jpeg__WEBPACK_IMPORTED_MODULE_10__ = __webpack_require__(/*! ./images/french_food.jpeg */ \"./src/images/french_food.jpeg\");\n/* harmony import */ var _images_french_food_jpeg__WEBPACK_IMPORTED_MODULE_10___default = /*#__PURE__*/__webpack_require__.n(_images_french_food_jpeg__WEBPACK_IMPORTED_MODULE_10__);\n/* harmony import */ var _images_italian_food_jpeg__WEBPACK_IMPORTED_MODULE_11__ = __webpack_require__(/*! ./images/italian_food.jpeg */ \"./src/images/italian_food.jpeg\");\n/* harmony import */ var _images_italian_food_jpeg__WEBPACK_IMPORTED_MODULE_11___default = /*#__PURE__*/__webpack_require__.n(_images_italian_food_jpeg__WEBPACK_IMPORTED_MODULE_11__);\n/* harmony import */ var _images_mexican_food_jpeg__WEBPACK_IMPORTED_MODULE_12__ = __webpack_require__(/*! ./images/mexican_food.jpeg */ \"./src/images/mexican_food.jpeg\");\n/* harmony import */ var _images_mexican_food_jpeg__WEBPACK_IMPORTED_MODULE_12___default = /*#__PURE__*/__webpack_require__.n(_images_mexican_food_jpeg__WEBPACK_IMPORTED_MODULE_12__);\n/* harmony import */ var _images_japanese_food_jpeg__WEBPACK_IMPORTED_MODULE_13__ = __webpack_require__(/*! ./images/japanese_food.jpeg */ \"./src/images/japanese_food.jpeg\");\n/* harmony import */ var _images_japanese_food_jpeg__WEBPACK_IMPORTED_MODULE_13___default = /*#__PURE__*/__webpack_require__.n(_images_japanese_food_jpeg__WEBPACK_IMPORTED_MODULE_13__);\n/* harmony import */ var _images_spanish_food_jpeg__WEBPACK_IMPORTED_MODULE_14__ = __webpack_require__(/*! ./images/spanish_food.jpeg */ \"./src/images/spanish_food.jpeg\");\n/* harmony import */ var _images_spanish_food_jpeg__WEBPACK_IMPORTED_MODULE_14___default = /*#__PURE__*/__webpack_require__.n(_images_spanish_food_jpeg__WEBPACK_IMPORTED_MODULE_14__);\n/* harmony import */ var _images_german_drinks_jpeg__WEBPACK_IMPORTED_MODULE_15__ = __webpack_require__(/*! ./images/german_drinks.jpeg */ \"./src/images/german_drinks.jpeg\");\n/* harmony import */ var _images_german_drinks_jpeg__WEBPACK_IMPORTED_MODULE_15___default = /*#__PURE__*/__webpack_require__.n(_images_german_drinks_jpeg__WEBPACK_IMPORTED_MODULE_15__);\n/* harmony import */ var _images_italian_drinks_jpeg__WEBPACK_IMPORTED_MODULE_16__ = __webpack_require__(/*! ./images/italian_drinks.jpeg */ \"./src/images/italian_drinks.jpeg\");\n/* harmony import */ var _images_italian_drinks_jpeg__WEBPACK_IMPORTED_MODULE_16___default = /*#__PURE__*/__webpack_require__.n(_images_italian_drinks_jpeg__WEBPACK_IMPORTED_MODULE_16__);\n/* harmony import */ var _images_french_drinks_jpeg__WEBPACK_IMPORTED_MODULE_17__ = __webpack_require__(/*! ./images/french_drinks.jpeg */ \"./src/images/french_drinks.jpeg\");\n/* harmony import */ var _images_french_drinks_jpeg__WEBPACK_IMPORTED_MODULE_17___default = /*#__PURE__*/__webpack_require__.n(_images_french_drinks_jpeg__WEBPACK_IMPORTED_MODULE_17__);\n/* harmony import */ var _images_mexican_drinks_jpeg__WEBPACK_IMPORTED_MODULE_18__ = __webpack_require__(/*! ./images/mexican_drinks.jpeg */ \"./src/images/mexican_drinks.jpeg\");\n/* harmony import */ var _images_mexican_drinks_jpeg__WEBPACK_IMPORTED_MODULE_18___default = /*#__PURE__*/__webpack_require__.n(_images_mexican_drinks_jpeg__WEBPACK_IMPORTED_MODULE_18__);\n/* harmony import */ var _images_brazilian_drinks_jpeg__WEBPACK_IMPORTED_MODULE_19__ = __webpack_require__(/*! ./images/brazilian_drinks.jpeg */ \"./src/images/brazilian_drinks.jpeg\");\n/* harmony import */ var _images_brazilian_drinks_jpeg__WEBPACK_IMPORTED_MODULE_19___default = /*#__PURE__*/__webpack_require__.n(_images_brazilian_drinks_jpeg__WEBPACK_IMPORTED_MODULE_19__);\n/* harmony import */ var _images_chinese_drinks_jpeg__WEBPACK_IMPORTED_MODULE_20__ = __webpack_require__(/*! ./images/chinese_drinks.jpeg */ \"./src/images/chinese_drinks.jpeg\");\n/* harmony import */ var _images_chinese_drinks_jpeg__WEBPACK_IMPORTED_MODULE_20___default = /*#__PURE__*/__webpack_require__.n(_images_chinese_drinks_jpeg__WEBPACK_IMPORTED_MODULE_20__);\n/* harmony import */ var _images_japanese_drinks_jpeg__WEBPACK_IMPORTED_MODULE_21__ = __webpack_require__(/*! ./images/japanese_drinks.jpeg */ \"./src/images/japanese_drinks.jpeg\");\n/* harmony import */ var _images_japanese_drinks_jpeg__WEBPACK_IMPORTED_MODULE_21___default = /*#__PURE__*/__webpack_require__.n(_images_japanese_drinks_jpeg__WEBPACK_IMPORTED_MODULE_21__);\n/* harmony import */ var _images_spanish_drinks_jpeg__WEBPACK_IMPORTED_MODULE_22__ = __webpack_require__(/*! ./images/spanish_drinks.jpeg */ \"./src/images/spanish_drinks.jpeg\");\n/* harmony import */ var _images_spanish_drinks_jpeg__WEBPACK_IMPORTED_MODULE_22___default = /*#__PURE__*/__webpack_require__.n(_images_spanish_drinks_jpeg__WEBPACK_IMPORTED_MODULE_22__);\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nlet tabsContainer = document.querySelector(\"#content\");\n_js_header_js__WEBPACK_IMPORTED_MODULE_2__[\"loadPage\"](tabsContainer);\n_js_about_js__WEBPACK_IMPORTED_MODULE_3__[\"loadPage\"](tabsContainer);\n\nlet tabAbout = tabsContainer.querySelector(\"#mnAbout\");\nlet tabMenu = tabsContainer.querySelector(\"#mnMenu\");\nlet tabContact = tabsContainer.querySelector(\"#mnContact\");\n\ntabAbout.classList.add(\"activate\");\n\ntabAbout.addEventListener(\"click\",function() {\n  clearPageContainer();\n  controlTabsActivate(tabAbout, [tabMenu, tabContact]);\n  _js_about_js__WEBPACK_IMPORTED_MODULE_3__[\"loadPage\"](tabsContainer);\n});\n\ntabMenu.addEventListener(\"click\",function() {\n  clearPageContainer();\n  controlTabsActivate(tabMenu, [tabAbout, tabContact]);\n  _js_menu_js__WEBPACK_IMPORTED_MODULE_4__[\"loadPage\"](tabsContainer);\n});\n\ntabContact.addEventListener(\"click\",function() {\n  clearPageContainer();\n  controlTabsActivate(tabContact, [tabMenu, tabAbout]);\n});\n\nconst controlTabsActivate = (tabActivated, tabsDesactivated) => {\n  tabActivated.classList.add(\"activate\");\n  if (tabsDesactivated.length > 0) {\n      tabsDesactivated.forEach(function(tab) {\n          tab.classList.remove(\"activate\");\n      });\n  }\n}\n\n\nconst clearPageContainer = () => {\n  // let pagesContainer = tabsContainer.childNodes[3];\n  // if (pagesContainer.tagName == \"SECTION\") {\n    // tabsContainer.removeChild(pagesContainer);\n  // }\n  tabsContainer.removeChild(tabsContainer.childNodes[3]);\n}\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/js/about.js":
/*!*************************!*\
  !*** ./src/js/about.js ***!
  \*************************/
/*! exports provided: loadPage */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"loadPage\", function() { return loadPage; });\n/* harmony import */ var _js_util_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ../js/util.js */ \"./src/js/util.js\");\n\n\nconst loadPage = (mainContent) => {\n\n  const pMeal = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"p\",\n        \"Enjoy of our great variety of foods of the four corners of \" +\n        \" the world, with all of its colors, flavors an culture.\",\n        [],[]);\n\n  const h2MealsTag = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"h2\",\"Delicious Meals\",[],[]);\n\n  const mealElement = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"div\",\"\",[],[\"service-type\"]);\n  mealElement.appendChild(h2MealsTag);\n  mealElement.appendChild(pMeal);\n\n  const pDrink = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"p\",\n        \"Drink the since the most simple soda to the most exoctic \" +\n        \"drink that you can imagine.\",\n        [],[]);\n\n  const h2DrinksTag = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"h2\",\"Good Drinks\",[],[]);\n\n  const drinksElement = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"div\",\"\",[],[\"service-type\"]);\n  drinksElement.appendChild(h2DrinksTag);\n  drinksElement.appendChild(pDrink);\n\n  const pDessert = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"p\",\n        `Prove an imense collection of flavors of desserts that you ` +\n        `can't even imagine that are exists`\n        ,[],[]);\n\n  const h2DessertsTag = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"h2\",\"Tasty Desserts\",[],[]);\n\n  const dessertsElement = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"div\",\"\",[],[\"service-type\"]);\n  dessertsElement.appendChild(h2DessertsTag);\n  dessertsElement.appendChild(pDessert);\n\n  const headLine = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"div\",\"\",[],[\"headline\"]);\n  headLine.appendChild(mealElement);\n  headLine.appendChild(drinksElement);\n  headLine.appendChild(dessertsElement);\n\n  const aboutPage = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"section\",\"\",[],[]);\n  aboutPage.appendChild(headLine);\n\n  mainContent.appendChild(aboutPage);\n  return mainContent;\n};\n\n\n\n\n//# sourceURL=webpack:///./src/js/about.js?");

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

/***/ "./src/js/menu.js":
/*!************************!*\
  !*** ./src/js/menu.js ***!
  \************************/
/*! exports provided: loadPage */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"loadPage\", function() { return loadPage; });\n/* harmony import */ var _js_util_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ../js/util.js */ \"./src/js/util.js\");\n\n\nconst getImage = (imageType) => {\n  const images = {\n    \"german-food\"    : _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"img\",\"\",{\"src\":\"images/german_food.jpeg\"},[]),\n    \"italian-food\"   : _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"img\",\"\",{\"src\":\"images/italian_food.jpeg\"},[]),\n    \"french-food\"    : _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"img\",\"\",{\"src\":\"images/french_food.jpeg\"},[]),\n    \"mexican-food\"   : _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"img\",\"\",{\"src\":\"images/mexican_food.jpeg\"},[]),\n    \"brazilian-food\" : _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"img\",\"\",{\"src\":\"images/brazilian_food.jpeg\"},[]),\n    \"chinese-food\"   : _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"img\",\"\",{\"src\":\"images/chinese_food.jpeg\"},[]),\n    \"japanese-food\"  : _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"img\",\"\",{\"src\":\"images/japanese_food.jpeg\"},[]),\n    \"spanish-food\"   : _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"img\",\"\",{\"src\":\"images/spanish_food.jpeg\"},[]),\n    \"german-drink\"   : _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"img\",\"\",{\"src\":\"images/german_drinks.jpeg\"},[]),\n    \"italian-drink\"  : _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"img\",\"\",{\"src\":\"images/italian_drinks.jpeg\"},[]),\n    \"french-drink\"   : _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"img\",\"\",{\"src\":\"images/french_drinks.jpeg\"},[]),\n    \"mexican-drink\"  : _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"img\",\"\",{\"src\":\"images/mexican_drinks.jpeg\"},[]),\n    \"brazilian-drink\": _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"img\",\"\",{\"src\":\"images/brazilian_drinks.jpeg\"},[]),\n    \"chinese-drink\"  : _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"img\",\"\",{\"src\":\"images/chinese_drinks.jpeg\"},[]),\n    \"japanese-drink\" : _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"img\",\"\",{\"src\":\"images/japanese_drinks.jpeg\"},[]),\n    \"spanish-drink\"  : _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"img\",\"\",{\"src\":\"images/spanish_drinks.jpeg\"},[])\n  }\n  return images[imageType];\n};\n\nconst getText = (fromType) => {\n  const listOfTexts = {\n    \"german-food\"    : _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"h2\",\"German\",[],[]),\n    \"italian-food\"   : _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"h2\",\"Italian\",[],[]),\n    \"french-food\"    : _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"h2\",\"French\",[],[]),\n    \"mexican-food\"   : _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"h2\",\"Mexican\",[],[]),\n    \"brazilian-food\" : _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"h2\",\"Brazilian\",[],[]),\n    \"chinese-food\"   : _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"h2\",\"Chinese\",[],[]),\n    \"japanese-food\"  : _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"h2\",\"Japanese\",[],[]),\n    \"spanish-food\"   : _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"h2\",\"Spanish\",[],[]),\n    \"german-drink\"   : _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"h2\",\"German\",[],[]),\n    \"italian-drink\"  : _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"h2\",\"Italian\",[],[]),\n    \"french-drink\"   : _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"h2\",\"French\",[],[]),\n    \"mexican-drink\"  : _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"h2\",\"Mexican\",[],[]),\n    \"brazilian-drink\": _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"h2\",\"Brazilian\",[],[]),\n    \"chinese-drink\"  : _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"h2\",\"Chinese\",[],[]),\n    \"japanese-drink\" : _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"h2\",\"Japanese\",[],[]),\n    \"spanish-drink\"  : _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"h2\",\"Spanish\",[],[])\n  }\n  return listOfTexts[fromType];\n};\n\nconst getLinkImage = (linkType) => {\n  const linkImages = {\n    \"german-food\"    : _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"a\",\"\",{\"href\":\"#\"},[]),\n    \"italian-food\"   : _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"a\",\"\",{\"href\":\"#\"},[]),\n    \"french-food\"    : _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"a\",\"\",{\"href\":\"#\"},[]),\n    \"mexican-food\"   : _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"a\",\"\",{\"href\":\"#\"},[]),\n    \"brazilian-food\" : _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"a\",\"\",{\"href\":\"#\"},[]),\n    \"chinese-food\"   : _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"a\",\"\",{\"href\":\"#\"},[]),\n    \"japanese-food\"  : _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"a\",\"\",{\"href\":\"#\"},[]),\n    \"spanish-food\"   : _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"a\",\"\",{\"href\":\"#\"},[]),\n    \"german-drink\"   : _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"a\",\"\",{\"href\":\"#\"},[]),\n    \"italian-drink\"  : _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"a\",\"\",{\"href\":\"#\"},[]),\n    \"french-drink\"   : _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"a\",\"\",{\"href\":\"#\"},[]),\n    \"mexican-drink\"  : _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"a\",\"\",{\"href\":\"#\"},[]),\n    \"brazilian-drink\": _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"a\",\"\",{\"href\":\"#\"},[]),\n    \"chinese-drink\"  : _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"a\",\"\",{\"href\":\"#\"},[]),\n    \"japanese-drink\" : _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"a\",\"\",{\"href\":\"#\"},[]),\n    \"spanish-drink\"  : _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"a\",\"\",{\"href\":\"#\"},[])\n  }\n  return linkImages[linkType];\n};\n\nconst wrapImgWithLink = (linkObject, imageType) => {\n  linkObject.appendChild(imageType);\n  return linkObject;\n}\n\nconst getElementsSettings = (type) => {\n\n  const elementsType = {\n    \"food\": {\n      germanFood   :{type: \"div\", name: \"german-food\",   attributes: [], styles: [\"food-details\"] },\n      italianFood  :{type: \"div\", name: \"italian-food\",  attributes: [], styles: [\"food-details\"] },\n      frenchFood   :{type: \"div\", name: \"french-food\",   attributes: [], styles: [\"food-details\"] },\n      mexicanFood  :{type: \"div\", name: \"mexican-food\",  attributes: [], styles: [\"food-details\"] },\n      brazilianFood:{type: \"div\", name: \"brazilian-food\",attributes: [], styles: [\"food-details\"] },\n      chineseFood  :{type: \"div\", name: \"chinese-food\",  attributes: [], styles: [\"food-details\"] },\n      japaneseFood :{type: \"div\", name: \"japanese-food\", attributes: [], styles: [\"food-details\"] },\n      spanishFood  :{type: \"div\", name: \"spanish-food\",  attributes: [], styles: [\"food-details\"] }\n    },\n    \"drink\": {\n      germanDrink   :{type: \"div\", name: \"german-drink\",   attributes: [], styles: [\"food-details\"] },\n      italianDrink  :{type: \"div\", name: \"italian-drink\",  attributes: [], styles: [\"food-details\"] },\n      frenchDrink   :{type: \"div\", name: \"french-drink\",   attributes: [], styles: [\"food-details\"] },\n      mexicanDrink  :{type: \"div\", name: \"mexican-drink\",  attributes: [], styles: [\"food-details\"] },\n      brazilianDrink:{type: \"div\", name: \"brazilian-drink\",attributes: [], styles: [\"food-details\"] },\n      chineseDrink  :{type: \"div\", name: \"chinese-drink\",  attributes: [], styles: [\"food-details\"] },\n      japaneseDrink :{type: \"div\", name: \"japanese-drink\", attributes: [], styles: [\"food-details\"] },\n      spanishDrink  :{type: \"div\", name: \"spanish-drink\",  attributes: [], styles: [\"food-details\"] }\n    }\n  }\n  return elementsType[type];\n}\n\nconst generateBlockElements = (settings) => {\n\n  const listOfElements = [];\n\n  Object.keys(settings).forEach(function(e) {\n    const element = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"Element\"](settings[e].type);\n    element.applyAttributes(settings[e].attributes);\n    element.applyStyles(settings[e].styles);\n    element.addChild(getText(settings[e].name));\n    element.addChild(\n      wrapImgWithLink(getLinkImage(settings[e].name),getImage(settings[e].name))\n    );\n    listOfElements[e] = element;\n  });\n\n  return listOfElements;\n\n}\n\nconst addElementsToContainer =(elements, container) => {\n\n  elements.forEach(function(element) {\n    container.appendChild(element.getElement());\n  });\n\n}\n\nconst loadPage = (mainContent) => {\n\n  const divFoodSectionTitle = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"div\",\"\",[],[\"section-title\"]);\n  divFoodSectionTitle.appendChild(_js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"h1\",\"Foods\",[],[]));\n\n  const divDrinkSectionTitle = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"div\",\"\",[],[\"section-title\"]);\n  divDrinkSectionTitle.appendChild(_js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"h1\",\"Drinks\",[],[]));\n\n  const objectsFood = generateBlockElements(getElementsSettings(\"food\"));\n  const foodsContainer = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"div\",\"\",[],[\"foods\"]);\n  const foodsContainer2 = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"div\",\"\",[],[\"foods\"]);\n  addElementsToContainer(Object.values(objectsFood).slice(0,4),foodsContainer);\n  addElementsToContainer(Object.values(objectsFood).slice(4,8),foodsContainer2);\n\n  const objectsDrink = generateBlockElements(getElementsSettings(\"drink\"));\n  const drinksContainer = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"div\",\"\",[],[\"drinks\"]);\n  const drinksContainer2 = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"div\",\"\",[],[\"drinks\"]);\n  addElementsToContainer(Object.values(objectsDrink).slice(0,4),drinksContainer);\n  addElementsToContainer(Object.values(objectsDrink).slice(4,8),drinksContainer2);\n\n  const menuPage = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"section\",\"\",{\"id\": \"sec-menu\"},[\"headline\"]);\n  menuPage.appendChild(divFoodSectionTitle);\n  menuPage.appendChild(foodsContainer);\n  menuPage.appendChild(foodsContainer2);\n  menuPage.appendChild(divDrinkSectionTitle);\n  menuPage.appendChild(drinksContainer);\n  menuPage.appendChild(drinksContainer2);\n\n  mainContent.appendChild(menuPage);\n\n  return mainContent;\n}\n\n\n\n\n//# sourceURL=webpack:///./src/js/menu.js?");

/***/ }),

/***/ "./src/js/util.js":
/*!************************!*\
  !*** ./src/js/util.js ***!
  \************************/
/*! exports provided: newElement, Element */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"newElement\", function() { return newElement; });\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"Element\", function() { return Element; });\nconst newElement = (type, value,attributes, classes) => {\n  const element = document.createElement(type);\n  element.textContent = value;\n\n  if (attributes != null) {\n    const attributesKeys = Object.keys(attributes);\n    if (attributesKeys.length > 0) {\n      attributesKeys.forEach(function(key) {\n        element.setAttribute(key, attributes[key]);\n      });\n    }\n  }\n\n  if (classes != null && classes.length > 0) {\n    classes.forEach(function(className) {\n      element.classList.add(className);\n    });\n  }\n\n  return element;\n};\n\n\nconst Element = (pgElement) => {\n\n  let element = document.createElement(pgElement);\n  const applyAttributes = (attributes) => {\n    const attributesKeys = Object.keys(attributes);\n    if (attributesKeys.length > 0) {\n      attributesKeys.forEach(function(key) {\n        element.setAttribute(key, attributes[key]);\n      });\n    }\n  };\n\n const applyStyles = (styles) => {\n   if (styles != null && styles.length > 0) {\n     styles.forEach(function(style) {\n       element.classList.add(style);\n     });\n   }\n   return parent;\n };\n\n const addChild = (child) => {\n   element.appendChild(child);\n }\n\n  const getElement = () => { return element };\n\n  return {applyAttributes, applyStyles, addChild, getElement}\n};\n\n\n\n\n//# sourceURL=webpack:///./src/js/util.js?");

/***/ })

/******/ });