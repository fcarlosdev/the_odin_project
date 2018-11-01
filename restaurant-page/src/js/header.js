import * as UTILITY from '../js/util.js';

const loadPage = (mainContent) => {

  const h1Tag = UTILITY.newElement("h1","International Cousine",[],[]);

  const header = UTILITY.newElement("div","",[],["header"]);
  header.appendChild(h1Tag);

  const bannerArea = UTILITY.newElement("div","",{"id": "banner"},["centralize"]);
  bannerArea.appendChild(header);

  const aboutItemBar = UTILITY.newElement("div","ABOUT",{"id": "mnAbout"},["menu-item"]);
  const menuItemBar = UTILITY.newElement("div","MENU",{"id": "mnMenu"},["menu-item"]);
  const contactItemBar = UTILITY.newElement("div","CONTACT",{"id": "mnContact"},["menu-item"]);

  const tabsBar = UTILITY.newElement("div","",[],["menu"]);
  tabsBar.appendChild(aboutItemBar);
  tabsBar.appendChild(menuItemBar);
  tabsBar.appendChild(contactItemBar);

  mainContent.appendChild(bannerArea);
  mainContent.appendChild(tabsBar);

  return mainContent;
};

export { loadPage };
