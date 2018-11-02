import './css/style.css';
import './css/menu_page.css';
import * as header from './js/header.js';
import * as about from './js/about.js';
import * as menu from './js/menu.js';

import Image from './images/beef_food.jpeg';

import Image2 from './images/german_food.jpeg';
import Image3 from './images/american_food.jpeg';
import Image4 from './images/brazilian_food.jpeg';
import Image5 from './images/chinese_food.jpeg';
import Image6 from './images/french_food.jpeg';
import Image7 from './images/italian_food.jpeg';
import Image8 from './images/mexican_food.jpeg';
import Image9 from './images/japanese_food.jpeg';
import Image10 from './images/spanish_food.jpeg';

import Image11 from './images/german_drinks.jpeg';
import Image12 from './images/italian_drinks.jpeg';
import Image13 from './images/french_drinks.jpeg';
import Image14 from './images/mexican_drinks.jpeg';
import Image15 from './images/brazilian_drinks.jpeg';
import Image16 from './images/chinese_drinks.jpeg';
import Image17 from './images/japanese_drinks.jpeg';
import Image18 from './images/spanish_drinks.jpeg';


let tabsContainer = document.querySelector("#content");
header.loadPage(tabsContainer);
about.loadPage(tabsContainer);

let tabAbout = tabsContainer.querySelector("#mnAbout");
let tabMenu = tabsContainer.querySelector("#mnMenu");
let tabContact = tabsContainer.querySelector("#mnContact");

tabAbout.classList.add("activate");

tabAbout.addEventListener("click",function() {
  clearPageContainer();
  controlTabsActivate(tabAbout, [tabMenu, tabContact]);
  about.loadPage(tabsContainer);
});

tabMenu.addEventListener("click",function() {
  clearPageContainer();
  controlTabsActivate(tabMenu, [tabAbout, tabContact]);
  menu.loadPage(tabsContainer);
});

tabContact.addEventListener("click",function() {
  clearPageContainer();
  controlTabsActivate(tabContact, [tabMenu, tabAbout]);
});

const controlTabsActivate = (tabActivated, tabsDesactivated) => {
  tabActivated.classList.add("activate");
  if (tabsDesactivated.length > 0) {
      tabsDesactivated.forEach(function(tab) {
          tab.classList.remove("activate");
      });
  }
}


const clearPageContainer = () => {
  let pagesContainer = tabsContainer.childNodes[3];
  if (pagesContainer !== undefined && pagesContainer.tagName == "SECTION") {
    tabsContainer.removeChild(pagesContainer);
  }
  // tabsContainer.removeChild(tabsContainer.childNodes[3]);
}
