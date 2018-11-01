import './css/style.css';
import Image from './images/beef-food.jpg';
import * as header from './js/header.js';
import * as about from './js/about.js';

let tabsContainer = document.querySelector("#content");
header.loadPage(tabsContainer);
about.loadPage(tabsContainer);

let tabAbout = tabsContainer.querySelector("#mnAbout");
let tabMenu = tabsContainer.querySelector("#mnMenu");
let tabContact = tabsContainer.querySelector("#mnContact");

tabAbout.classList.add("activate");

tabAbout.addEventListener("click",function() {
  controlTabsActivate(tabAbout, [tabMenu, tabContact]);
  about.loadPage(tabsContainer);
});

tabMenu.addEventListener("click",function() {
  controlTabsActivate(tabMenu, [tabAbout, tabContact]);

});

tabContact.addEventListener("click",function() {
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
