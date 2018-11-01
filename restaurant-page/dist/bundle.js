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

/***/ "./src/images/brazilian_food.jpeg":
/*!****************************************!*\
  !*** ./src/images/brazilian_food.jpeg ***!
  \****************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("module.exports = __webpack_require__.p + \"images/brazilian_food.jpeg\";\n\n//# sourceURL=webpack:///./src/images/brazilian_food.jpeg?");

/***/ }),

/***/ "./src/images/chinese_food.jpeg":
/*!**************************************!*\
  !*** ./src/images/chinese_food.jpeg ***!
  \**************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("module.exports = __webpack_require__.p + \"images/chinese_food.jpeg\";\n\n//# sourceURL=webpack:///./src/images/chinese_food.jpeg?");

/***/ }),

/***/ "./src/images/french_food.jpeg":
/*!*************************************!*\
  !*** ./src/images/french_food.jpeg ***!
  \*************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("module.exports = __webpack_require__.p + \"images/french_food.jpeg\";\n\n//# sourceURL=webpack:///./src/images/french_food.jpeg?");

/***/ }),

/***/ "./src/images/german_food.jpeg":
/*!*************************************!*\
  !*** ./src/images/german_food.jpeg ***!
  \*************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("module.exports = __webpack_require__.p + \"images/german_food.jpeg\";\n\n//# sourceURL=webpack:///./src/images/german_food.jpeg?");

/***/ }),

/***/ "./src/images/italian_food.jpeg":
/*!**************************************!*\
  !*** ./src/images/italian_food.jpeg ***!
  \**************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("module.exports = __webpack_require__.p + \"images/italian_food.jpeg\";\n\n//# sourceURL=webpack:///./src/images/italian_food.jpeg?");

/***/ }),

/***/ "./src/images/japanese_food.jpeg":
/*!***************************************!*\
  !*** ./src/images/japanese_food.jpeg ***!
  \***************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("module.exports = __webpack_require__.p + \"images/japanese_food.jpeg\";\n\n//# sourceURL=webpack:///./src/images/japanese_food.jpeg?");

/***/ }),

/***/ "./src/images/mexican_food.jpeg":
/*!**************************************!*\
  !*** ./src/images/mexican_food.jpeg ***!
  \**************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("module.exports = __webpack_require__.p + \"images/mexican_food.jpeg\";\n\n//# sourceURL=webpack:///./src/images/mexican_food.jpeg?");

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
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _css_style_css__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./css/style.css */ \"./src/css/style.css\");\n/* harmony import */ var _css_style_css__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(_css_style_css__WEBPACK_IMPORTED_MODULE_0__);\n/* harmony import */ var _css_menu_page_css__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./css/menu_page.css */ \"./src/css/menu_page.css\");\n/* harmony import */ var _css_menu_page_css__WEBPACK_IMPORTED_MODULE_1___default = /*#__PURE__*/__webpack_require__.n(_css_menu_page_css__WEBPACK_IMPORTED_MODULE_1__);\n/* harmony import */ var _js_header_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./js/header.js */ \"./src/js/header.js\");\n/* harmony import */ var _js_about_js__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ./js/about.js */ \"./src/js/about.js\");\n/* harmony import */ var _js_menu_js__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! ./js/menu.js */ \"./src/js/menu.js\");\n/* harmony import */ var _images_beef_food_jpeg__WEBPACK_IMPORTED_MODULE_5__ = __webpack_require__(/*! ./images/beef_food.jpeg */ \"./src/images/beef_food.jpeg\");\n/* harmony import */ var _images_beef_food_jpeg__WEBPACK_IMPORTED_MODULE_5___default = /*#__PURE__*/__webpack_require__.n(_images_beef_food_jpeg__WEBPACK_IMPORTED_MODULE_5__);\n/* harmony import */ var _images_german_food_jpeg__WEBPACK_IMPORTED_MODULE_6__ = __webpack_require__(/*! ./images/german_food.jpeg */ \"./src/images/german_food.jpeg\");\n/* harmony import */ var _images_german_food_jpeg__WEBPACK_IMPORTED_MODULE_6___default = /*#__PURE__*/__webpack_require__.n(_images_german_food_jpeg__WEBPACK_IMPORTED_MODULE_6__);\n/* harmony import */ var _images_american_food_jpeg__WEBPACK_IMPORTED_MODULE_7__ = __webpack_require__(/*! ./images/american_food.jpeg */ \"./src/images/american_food.jpeg\");\n/* harmony import */ var _images_american_food_jpeg__WEBPACK_IMPORTED_MODULE_7___default = /*#__PURE__*/__webpack_require__.n(_images_american_food_jpeg__WEBPACK_IMPORTED_MODULE_7__);\n/* harmony import */ var _images_brazilian_food_jpeg__WEBPACK_IMPORTED_MODULE_8__ = __webpack_require__(/*! ./images/brazilian_food.jpeg */ \"./src/images/brazilian_food.jpeg\");\n/* harmony import */ var _images_brazilian_food_jpeg__WEBPACK_IMPORTED_MODULE_8___default = /*#__PURE__*/__webpack_require__.n(_images_brazilian_food_jpeg__WEBPACK_IMPORTED_MODULE_8__);\n/* harmony import */ var _images_chinese_food_jpeg__WEBPACK_IMPORTED_MODULE_9__ = __webpack_require__(/*! ./images/chinese_food.jpeg */ \"./src/images/chinese_food.jpeg\");\n/* harmony import */ var _images_chinese_food_jpeg__WEBPACK_IMPORTED_MODULE_9___default = /*#__PURE__*/__webpack_require__.n(_images_chinese_food_jpeg__WEBPACK_IMPORTED_MODULE_9__);\n/* harmony import */ var _images_french_food_jpeg__WEBPACK_IMPORTED_MODULE_10__ = __webpack_require__(/*! ./images/french_food.jpeg */ \"./src/images/french_food.jpeg\");\n/* harmony import */ var _images_french_food_jpeg__WEBPACK_IMPORTED_MODULE_10___default = /*#__PURE__*/__webpack_require__.n(_images_french_food_jpeg__WEBPACK_IMPORTED_MODULE_10__);\n/* harmony import */ var _images_italian_food_jpeg__WEBPACK_IMPORTED_MODULE_11__ = __webpack_require__(/*! ./images/italian_food.jpeg */ \"./src/images/italian_food.jpeg\");\n/* harmony import */ var _images_italian_food_jpeg__WEBPACK_IMPORTED_MODULE_11___default = /*#__PURE__*/__webpack_require__.n(_images_italian_food_jpeg__WEBPACK_IMPORTED_MODULE_11__);\n/* harmony import */ var _images_mexican_food_jpeg__WEBPACK_IMPORTED_MODULE_12__ = __webpack_require__(/*! ./images/mexican_food.jpeg */ \"./src/images/mexican_food.jpeg\");\n/* harmony import */ var _images_mexican_food_jpeg__WEBPACK_IMPORTED_MODULE_12___default = /*#__PURE__*/__webpack_require__.n(_images_mexican_food_jpeg__WEBPACK_IMPORTED_MODULE_12__);\n/* harmony import */ var _images_japanese_food_jpeg__WEBPACK_IMPORTED_MODULE_13__ = __webpack_require__(/*! ./images/japanese_food.jpeg */ \"./src/images/japanese_food.jpeg\");\n/* harmony import */ var _images_japanese_food_jpeg__WEBPACK_IMPORTED_MODULE_13___default = /*#__PURE__*/__webpack_require__.n(_images_japanese_food_jpeg__WEBPACK_IMPORTED_MODULE_13__);\n/* harmony import */ var _images_spanish_food_jpeg__WEBPACK_IMPORTED_MODULE_14__ = __webpack_require__(/*! ./images/spanish_food.jpeg */ \"./src/images/spanish_food.jpeg\");\n/* harmony import */ var _images_spanish_food_jpeg__WEBPACK_IMPORTED_MODULE_14___default = /*#__PURE__*/__webpack_require__.n(_images_spanish_food_jpeg__WEBPACK_IMPORTED_MODULE_14__);\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nlet tabsContainer = document.querySelector(\"#content\");\n_js_header_js__WEBPACK_IMPORTED_MODULE_2__[\"loadPage\"](tabsContainer);\n_js_about_js__WEBPACK_IMPORTED_MODULE_3__[\"loadPage\"](tabsContainer);\n\nlet tabAbout = tabsContainer.querySelector(\"#mnAbout\");\nlet tabMenu = tabsContainer.querySelector(\"#mnMenu\");\nlet tabContact = tabsContainer.querySelector(\"#mnContact\");\n\ntabAbout.classList.add(\"activate\");\n\ntabAbout.addEventListener(\"click\",function() {\n  clearPageContainer();\n  controlTabsActivate(tabAbout, [tabMenu, tabContact]);\n  _js_about_js__WEBPACK_IMPORTED_MODULE_3__[\"loadPage\"](tabsContainer);\n});\n\ntabMenu.addEventListener(\"click\",function() {\n  clearPageContainer();\n  controlTabsActivate(tabMenu, [tabAbout, tabContact]);\n  _js_menu_js__WEBPACK_IMPORTED_MODULE_4__[\"loadPage\"](tabsContainer);\n});\n\ntabContact.addEventListener(\"click\",function() {\n  clearPageContainer();\n  controlTabsActivate(tabContact, [tabMenu, tabAbout]);\n});\n\nconst controlTabsActivate = (tabActivated, tabsDesactivated) => {\n  tabActivated.classList.add(\"activate\");\n  if (tabsDesactivated.length > 0) {\n      tabsDesactivated.forEach(function(tab) {\n          tab.classList.remove(\"activate\");\n      });\n  }\n}\n\n\nconst clearPageContainer = () => {\n  // let pagesContainer = tabsContainer.childNodes[3];\n  // if (pagesContainer.tagName == \"SECTION\") {\n    // tabsContainer.removeChild(pagesContainer);\n  // }\n  tabsContainer.removeChild(tabsContainer.childNodes[3]);\n}\n\n\n//# sourceURL=webpack:///./src/index.js?");

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

/***/ "./src/js/menu.js":
/*!************************!*\
  !*** ./src/js/menu.js ***!
  \************************/
/*! exports provided: loadPage */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"loadPage\", function() { return loadPage; });\n/* harmony import */ var _js_util_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ../js/util.js */ \"./src/js/util.js\");\n\n\nconst loadPage = (mainContent) => {\n\n  const h1FoodSectionTitle = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"h1\",\"Foods\",[],[]);\n\n  const divFoodSectionTitle = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"div\",\"\",[],[\"section-title\"]);\n  divFoodSectionTitle.appendChild(h1FoodSectionTitle);\n\n\n  const imagesFood = [];\n  imagesFood[\"german\"]    = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"img\",\"\",{\"src\":\"images/german_food.jpeg\"},[]);\n  imagesFood[\"italian\"]   = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"img\",\"\",{\"src\":\"images/italian_food.jpeg\"},[]);\n  imagesFood[\"french\"]    = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"img\",\"\",{\"src\":\"images/french_food.jpeg\"},[]);\n  imagesFood[\"mexican\"]   = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"img\",\"\",{\"src\":\"images/mexican_food.jpeg\"},[]);\n  imagesFood[\"brazilian\"] = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"img\",\"\",{\"src\":\"images/brazilian_food.jpeg\"},[]);\n  imagesFood[\"chinese\"]   = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"img\",\"\",{\"src\":\"images/chinese_food.jpeg\"},[]);\n  imagesFood[\"japanese\"]  = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"img\",\"\",{\"src\":\"images/japanese_food.jpeg\"},[]);\n  imagesFood[\"spanish\"]   = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"img\",\"\",{\"src\":\"images/spanish_food.jpeg\"},[]);\n\n  const titlesCountryFood = [];\n  titlesCountryFood[\"german\"]    = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"h2\",\"German\",[],[]);\n  titlesCountryFood[\"italian\"]   = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"h2\",\"Italian\",[],[]);\n  titlesCountryFood[\"french\"]    = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"h2\",\"French\",[],[]);\n  titlesCountryFood[\"mexican\"]   = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"h2\",\"Mexcian\",[],[]);\n  titlesCountryFood[\"brazilian\"] = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"h2\",\"Brazilian\",[],[]);\n  titlesCountryFood[\"chinese\"]   = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"h2\",\"Chinese\",[],[]);\n  titlesCountryFood[\"japanese\"]  = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"h2\",\"Japanese\",[],[]);\n  titlesCountryFood[\"spanish\"]   = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"h2\",\"Spanish\",[],[]);\n\n  const imagesFoodReferences = [];\n  imagesFoodReferences[\"german\"] = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"a\",\"\",{\"href\":\"#\"},[]).appendChild(imagesFood[\"german\"]);\n  imagesFoodReferences[\"italian\"] = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"a\",\"\",{\"href\":\"#\"},[]).appendChild(imagesFood[\"italian\"]);\n  imagesFoodReferences[\"french\"] = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"a\",\"\",{\"href\":\"#\"},[]).appendChild(imagesFood[\"french\"]);\n  imagesFoodReferences[\"mexican\"] = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"a\",\"\",{\"href\":\"#\"},[]).appendChild(imagesFood[\"mexican\"]);\n  imagesFoodReferences[\"brazilian\"] = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"a\",\"\",{\"href\":\"#\"},[]).appendChild(imagesFood[\"brazilian\"]);\n  imagesFoodReferences[\"chinese\"] = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"a\",\"\",{\"href\":\"#\"},[]).appendChild(imagesFood[\"chinese\"]);\n  imagesFoodReferences[\"japanese\"] = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"a\",\"\",{\"href\":\"#\"},[]).appendChild(imagesFood[\"japanese\"]);\n  imagesFoodReferences[\"spanish\"] = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"a\",\"\",{\"href\":\"#\"},[]).appendChild(imagesFood[\"spanish\"]);\n\n\n  const germanFood = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"div\",\"\",[],[\"food-details\"]);\n  germanFood.appendChild(titlesCountryFood[\"german\"]);\n  germanFood.appendChild(imagesFoodReferences[\"german\"]);\n\n  const italianFood = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"div\",\"\",[],[\"food-details\"]);\n  italianFood.appendChild(titlesCountryFood[\"italian\"]);\n  italianFood.appendChild(imagesFoodReferences[\"italian\"]);\n\n  const frenchFood = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"div\",\"\",[],[\"food-details\"]);\n  frenchFood.appendChild(titlesCountryFood[\"french\"]);\n  frenchFood.appendChild(imagesFoodReferences[\"french\"]);\n\n  const mexicanFood = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"div\",\"\",[],[\"food-details\"]);\n  mexicanFood.appendChild(titlesCountryFood[\"mexican\"]);\n  mexicanFood.appendChild(imagesFoodReferences[\"mexican\"]);\n\n  const brazilianFood = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"div\",\"\",[],[\"food-details\"]);\n  brazilianFood.appendChild(titlesCountryFood[\"brazilian\"]);\n  brazilianFood.appendChild(imagesFoodReferences[\"brazilian\"]);\n\n  const chineseFood = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"div\",\"\",[],[\"food-details\"]);\n  chineseFood.appendChild(titlesCountryFood[\"chinese\"]);\n  chineseFood.appendChild(imagesFoodReferences[\"chinese\"]);\n\n  const japaneseFood = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"div\",\"\",[],[\"food-details\"]);\n  japaneseFood.appendChild(titlesCountryFood[\"japanese\"]);\n  japaneseFood.appendChild(imagesFoodReferences[\"japanese\"]);\n\n  const spanishFood = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"div\",\"\",[],[\"food-details\"]);\n  spanishFood.appendChild(titlesCountryFood[\"spanish\"]);\n  spanishFood.appendChild(imagesFoodReferences[\"spanish\"]);\n\n\n  const foodsContainer = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"div\",\"\",[],[\"foods\"]);\n  foodsContainer.appendChild(germanFood);\n  foodsContainer.appendChild(italianFood);\n  foodsContainer.appendChild(frenchFood);\n  foodsContainer.appendChild(mexicanFood);\n\n  const foodsContainer2 = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"div\",\"\",[],[\"foods\"]);\n  foodsContainer2.appendChild(brazilianFood);\n  foodsContainer2.appendChild(chineseFood);\n  foodsContainer2.appendChild(japaneseFood);\n  foodsContainer2.appendChild(spanishFood);\n\n\n  const menuPage = _js_util_js__WEBPACK_IMPORTED_MODULE_0__[\"newElement\"](\"section\",\"\",{\"id\": \"sec-menu\"},[\"headline\"]);\n  menuPage.appendChild(divFoodSectionTitle);\n  menuPage.appendChild(foodsContainer);\n  menuPage.appendChild(foodsContainer2);\n\n\n\n  mainContent.appendChild(menuPage);\n\n  return mainContent;\n}\n\n\n\n\n//# sourceURL=webpack:///./src/js/menu.js?");

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