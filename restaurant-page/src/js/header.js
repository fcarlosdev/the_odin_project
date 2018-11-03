import * as UTILITY from '../js/util.js';

const loadPage = (mainContent) => {

  const h1Tag = UTILITY.newSimpleElement("h1","International Cousine",[],[]);

  const header = UTILITY.newSimpleElement("div","",[],["header"]);
  header.appendChild(h1Tag);

  const bannerArea = UTILITY.newSimpleElement("div","",{"id": "banner"},["centralize"]);
  bannerArea.appendChild(header);

  const aboutItemBar = UTILITY.newSimpleElement("div","ABOUT",{"id": "mnAbout"},["menu-item"]);
  const menuItemBar = UTILITY.newSimpleElement("div","MENU",{"id": "mnMenu"},["menu-item"]);
  const contactItemBar = UTILITY.newSimpleElement("div","CONTACT",{"id": "mnContact"},["menu-item"]);

  const tabsBar = UTILITY.newSimpleElement("div","",[],["menu"]);
  tabsBar.appendChild(aboutItemBar);
  tabsBar.appendChild(menuItemBar);
  tabsBar.appendChild(contactItemBar);

  mainContent.appendChild(bannerArea);
  mainContent.appendChild(tabsBar);

  return mainContent;
};

export { loadPage };
