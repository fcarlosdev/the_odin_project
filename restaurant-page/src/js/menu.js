import * as UTILITY from '../js/util.js';

const getImage = (imageType) => {
  const images = {
    "german-food"    : UTILITY.newElement("img","",{"src":"images/german_food.jpeg"},[]),
    "italian-food"   : UTILITY.newElement("img","",{"src":"images/italian_food.jpeg"},[]),
    "french-food"    : UTILITY.newElement("img","",{"src":"images/french_food.jpeg"},[]),
    "mexican-food"   : UTILITY.newElement("img","",{"src":"images/mexican_food.jpeg"},[]),
    "brazilian-food" : UTILITY.newElement("img","",{"src":"images/brazilian_food.jpeg"},[]),
    "chinese-food"   : UTILITY.newElement("img","",{"src":"images/chinese_food.jpeg"},[]),
    "japanese-food"  : UTILITY.newElement("img","",{"src":"images/japanese_food.jpeg"},[]),
    "spanish-food"   : UTILITY.newElement("img","",{"src":"images/spanish_food.jpeg"},[]),
    "german-drink"   : UTILITY.newElement("img","",{"src":"images/german_drinks.jpeg"},[]),
    "italian-drink"  : UTILITY.newElement("img","",{"src":"images/italian_drinks.jpeg"},[]),
    "french-drink"   : UTILITY.newElement("img","",{"src":"images/french_drinks.jpeg"},[]),
    "mexican-drink"  : UTILITY.newElement("img","",{"src":"images/mexican_drinks.jpeg"},[]),
    "brazilian-drink": UTILITY.newElement("img","",{"src":"images/brazilian_drinks.jpeg"},[]),
    "chinese-drink"  : UTILITY.newElement("img","",{"src":"images/chinese_drinks.jpeg"},[]),
    "japanese-drink" : UTILITY.newElement("img","",{"src":"images/japanese_drinks.jpeg"},[]),
    "spanish-drink"  : UTILITY.newElement("img","",{"src":"images/spanish_drinks.jpeg"},[])
  }
  return images[imageType];
};

const getText = (fromType) => {
  const listOfTexts = {
    "german-food"    : UTILITY.newElement("h2","German",[],[]),
    "italian-food"   : UTILITY.newElement("h2","Italian",[],[]),
    "french-food"    : UTILITY.newElement("h2","French",[],[]),
    "mexican-food"   : UTILITY.newElement("h2","Mexican",[],[]),
    "brazilian-food" : UTILITY.newElement("h2","Brazilian",[],[]),
    "chinese-food"   : UTILITY.newElement("h2","Chinese",[],[]),
    "japanese-food"  : UTILITY.newElement("h2","Japanese",[],[]),
    "spanish-food"   : UTILITY.newElement("h2","Spanish",[],[]),
    "german-drink"   : UTILITY.newElement("h2","German",[],[]),
    "italian-drink"  : UTILITY.newElement("h2","Italian",[],[]),
    "french-drink"   : UTILITY.newElement("h2","French",[],[]),
    "mexican-drink"  : UTILITY.newElement("h2","Mexican",[],[]),
    "brazilian-drink": UTILITY.newElement("h2","Brazilian",[],[]),
    "chinese-drink"  : UTILITY.newElement("h2","Chinese",[],[]),
    "japanese-drink" : UTILITY.newElement("h2","Japanese",[],[]),
    "spanish-drink"  : UTILITY.newElement("h2","Spanish",[],[])
  }
  return listOfTexts[fromType];
};

const getLinkImage = (linkType) => {
  const linkImages = {
    "german-food"    : UTILITY.newElement("a","",{"href":"#"},[]),
    "italian-food"   : UTILITY.newElement("a","",{"href":"#"},[]),
    "french-food"    : UTILITY.newElement("a","",{"href":"#"},[]),
    "mexican-food"   : UTILITY.newElement("a","",{"href":"#"},[]),
    "brazilian-food" : UTILITY.newElement("a","",{"href":"#"},[]),
    "chinese-food"   : UTILITY.newElement("a","",{"href":"#"},[]),
    "japanese-food"  : UTILITY.newElement("a","",{"href":"#"},[]),
    "spanish-food"   : UTILITY.newElement("a","",{"href":"#"},[]),
    "german-drink"   : UTILITY.newElement("a","",{"href":"#"},[]),
    "italian-drink"  : UTILITY.newElement("a","",{"href":"#"},[]),
    "french-drink"   : UTILITY.newElement("a","",{"href":"#"},[]),
    "mexican-drink"  : UTILITY.newElement("a","",{"href":"#"},[]),
    "brazilian-drink": UTILITY.newElement("a","",{"href":"#"},[]),
    "chinese-drink"  : UTILITY.newElement("a","",{"href":"#"},[]),
    "japanese-drink" : UTILITY.newElement("a","",{"href":"#"},[]),
    "spanish-drink"  : UTILITY.newElement("a","",{"href":"#"},[])
  }
  return linkImages[linkType];
};

const wrapImgWithLink = (linkObject, imageType) => {
  linkObject.appendChild(imageType);
  return linkObject;
}

const getElementsSettings = (type) => {

  const elementsType = {
    "food": {
      germanFood   :{type: "div", name: "german-food",   attributes: [], styles: ["food-details"] },
      italianFood  :{type: "div", name: "italian-food",  attributes: [], styles: ["food-details"] },
      frenchFood   :{type: "div", name: "french-food",   attributes: [], styles: ["food-details"] },
      mexicanFood  :{type: "div", name: "mexican-food",  attributes: [], styles: ["food-details"] },
      brazilianFood:{type: "div", name: "brazilian-food",attributes: [], styles: ["food-details"] },
      chineseFood  :{type: "div", name: "chinese-food",  attributes: [], styles: ["food-details"] },
      japaneseFood :{type: "div", name: "japanese-food", attributes: [], styles: ["food-details"] },
      spanishFood  :{type: "div", name: "spanish-food",  attributes: [], styles: ["food-details"] }
    },
    "drink": {
      germanDrink   :{type: "div", name: "german-drink",   attributes: [], styles: ["food-details"] },
      italianDrink  :{type: "div", name: "italian-drink",  attributes: [], styles: ["food-details"] },
      frenchDrink   :{type: "div", name: "french-drink",   attributes: [], styles: ["food-details"] },
      mexicanDrink  :{type: "div", name: "mexican-drink",  attributes: [], styles: ["food-details"] },
      brazilianDrink:{type: "div", name: "brazilian-drink",attributes: [], styles: ["food-details"] },
      chineseDrink  :{type: "div", name: "chinese-drink",  attributes: [], styles: ["food-details"] },
      japaneseDrink :{type: "div", name: "japanese-drink", attributes: [], styles: ["food-details"] },
      spanishDrink  :{type: "div", name: "spanish-drink",  attributes: [], styles: ["food-details"] }
    }
  }
  return elementsType[type];
}

const generateBlockElements = (settings) => {

  const listOfElements = [];

  Object.keys(settings).forEach(function(e) {
    const element = UTILITY.Element(settings[e].type);
    element.applyAttributes(settings[e].attributes);
    element.applyStyles(settings[e].styles);
    element.addChild(getText(settings[e].name));
    element.addChild(
      wrapImgWithLink(getLinkImage(settings[e].name),getImage(settings[e].name))
    );
    listOfElements[e] = element;
  });

  return listOfElements;

}

const addElementsToContainer =(elements, container) => {

  elements.forEach(function(element) {
    container.appendChild(element.getElement());
  });

}

const loadPage = (mainContent) => {

  const divFoodSectionTitle = UTILITY.newElement("div","",[],["section-title"]);
  divFoodSectionTitle.appendChild(UTILITY.newElement("h1","Foods",[],[]));

  const divDrinkSectionTitle = UTILITY.newElement("div","",[],["section-title"]);
  divDrinkSectionTitle.appendChild(UTILITY.newElement("h1","Drinks",[],[]));

  const objectsFood = generateBlockElements(getElementsSettings("food"));
  const foodsContainer = UTILITY.newElement("div","",[],["foods"]);
  const foodsContainer2 = UTILITY.newElement("div","",[],["foods"]);
  addElementsToContainer(Object.values(objectsFood).slice(0,4),foodsContainer);
  addElementsToContainer(Object.values(objectsFood).slice(4,8),foodsContainer2);

  const objectsDrink = generateBlockElements(getElementsSettings("drink"));
  const drinksContainer = UTILITY.newElement("div","",[],["drinks"]);
  const drinksContainer2 = UTILITY.newElement("div","",[],["drinks"]);
  addElementsToContainer(Object.values(objectsDrink).slice(0,4),drinksContainer);
  addElementsToContainer(Object.values(objectsDrink).slice(4,8),drinksContainer2);

  const menuPage = UTILITY.newElement("section","",{"id": "sec-menu"},["headline"]);
  menuPage.appendChild(divFoodSectionTitle);
  menuPage.appendChild(foodsContainer);
  menuPage.appendChild(foodsContainer2);
  menuPage.appendChild(divDrinkSectionTitle);
  menuPage.appendChild(drinksContainer);
  menuPage.appendChild(drinksContainer2);

  mainContent.appendChild(menuPage);

  return mainContent;
}

export { loadPage };
