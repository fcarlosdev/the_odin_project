import * as UTILITY from '../js/util.js';

const loadPage = (mainContent) => {

  const h2MealsTag = UTILITY.newElement("h2","Delicious Meals",[],[]);

  const mealElement = UTILITY.newElement("div","",[],["service-type","meal"]);
  mealElement.appendChild(h2MealsTag);

  const h2DrinksTag = UTILITY.newElement("h2","Good Drinks",[],[]);

  const drinksElement = UTILITY.newElement("div","",[],["service-type","drinks"]);
  drinksElement.appendChild(h2DrinksTag);

  const h2DessertsTag = UTILITY.newElement("h2","Tasty Desserts",[],[]);

  const dessertsElement = UTILITY.newElement("div","",[],["service-type","desserts"]);
  dessertsElement.appendChild(h2DessertsTag);

  const headLine = UTILITY.newElement("div","",[],["headline"]);
  headLine.appendChild(mealElement);
  headLine.appendChild(drinksElement);
  headLine.appendChild(dessertsElement);

  const aboutPage = UTILITY.newElement("section","",[],[]);
  aboutPage.appendChild(headLine);

  mainContent.appendChild(aboutPage);
  return mainContent;
};

export { loadPage };
