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

const createHeading = (heading,content,attributes,styles) => {
  return UTILITY.newElement(heading,content,attributes,styles);
}

const wrapImgWithLink = (imageType) => {
  let linkObject = UTILITY.newElement("a","",{"href":"#"},[])
  linkObject.appendChild(imageType);
  return linkObject;
}

const formatFoodName = (text) => {
  return text.slice(0,1).toUpperCase().concat(text.slice(1,text.indexOf("-")));
}

const getElementsSettings = (type) => {

  const elementsType = {
    "food": {
      germanFood   :{type: "div", name: "german-food",   attributes: [], styles: ["food-details"], subElement: "h2" },
      italianFood  :{type: "div", name: "italian-food",  attributes: [], styles: ["food-details"], subElement: "h2" },
      frenchFood   :{type: "div", name: "french-food",   attributes: [], styles: ["food-details"], subElement: "h2" },
      mexicanFood  :{type: "div", name: "mexican-food",  attributes: [], styles: ["food-details"], subElement: "h2" },
      brazilianFood:{type: "div", name: "brazilian-food",attributes: [], styles: ["food-details"], subElement: "h2" },
      chineseFood  :{type: "div", name: "chinese-food",  attributes: [], styles: ["food-details"], subElement: "h2" },
      japaneseFood :{type: "div", name: "japanese-food", attributes: [], styles: ["food-details"], subElement: "h2" },
      spanishFood  :{type: "div", name: "spanish-food",  attributes: [], styles: ["food-details"], subElement: "h2" }
    },
    "drink": {
      germanDrink   :{type: "div", name: "german-drink",   attributes: [], styles: ["food-details"], subElement: "h2" },
      italianDrink  :{type: "div", name: "italian-drink",  attributes: [], styles: ["food-details"], subElement: "h2" },
      frenchDrink   :{type: "div", name: "french-drink",   attributes: [], styles: ["food-details"], subElement: "h2" },
      mexicanDrink  :{type: "div", name: "mexican-drink",  attributes: [], styles: ["food-details"], subElement: "h2" },
      brazilianDrink:{type: "div", name: "brazilian-drink",attributes: [], styles: ["food-details"], subElement: "h2" },
      chineseDrink  :{type: "div", name: "chinese-drink",  attributes: [], styles: ["food-details"], subElement: "h2" },
      japaneseDrink :{type: "div", name: "japanese-drink", attributes: [], styles: ["food-details"], subElement: "h2" },
      spanishDrink  :{type: "div", name: "spanish-drink",  attributes: [], styles: ["food-details"], subElement: "h2" }
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
    // element.addChild(createH2Title(formatFoodName(settings[e].name)));
    element.addChild(createHeading(settings[e].subElement,
                                   formatFoodName(settings[e].name)));
    element.addChild(wrapImgWithLink(getImage(settings[e].name)));
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
  divFoodSectionTitle.appendChild(createHeading("h1","Foods",[],[]));

  const divDrinkSectionTitle = UTILITY.newElement("div","",[],["section-title"]);
  divDrinkSectionTitle.appendChild(createHeading("h1","Drinks",[],[]));

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
