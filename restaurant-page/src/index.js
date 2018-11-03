import './css/style.css';
import './css/menu_page.css';
import './css/contact_page.css';
import * as header from './js/header.js';
import * as about from './js/about.js';
import * as menu from './js/menu.js';
import * as contact from './js/contact.js';


let tabsContainer = document.querySelector("#content");
header.loadPage(tabsContainer);
about.loadPage(tabsContainer);

const importImages = () => {
  let req = require.context("./images", false, /\.(png|svg|jpg|gif|jpeg)$/);
  req.keys().forEach(function(key){
      req(key);
  });
  return req;
}


importImages();

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
  contact.loadPage(tabsContainer);
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
  tabsContainer.removeChild(tabsContainer.childNodes[3]);
}
