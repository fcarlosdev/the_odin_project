import * as UTILITY from '../js/util.js';

const loadPage = (mainContent) => {

  const pMeal = UTILITY.newElement("p",
        "Enjoy of our great variety of foods of the four corners of " +
        " the world, with all of its colors, flavors an culture.",
        [],[]);

  const h2MealsTag = UTILITY.newElement("h2","Delicious Meals",[],[]);

  const mealElement = UTILITY.newElement("div","",[],["service-type"]);
  mealElement.appendChild(h2MealsTag);
  mealElement.appendChild(pMeal);

  const pDrink = UTILITY.newElement("p",
        "Drink the since the most simple soda to the most exoctic " +
        "drink that you can imagine.",
        [],[]);

  const h2DrinksTag = UTILITY.newElement("h2","Good Drinks",[],[]);

  const drinksElement = UTILITY.newElement("div","",[],["service-type"]);
  drinksElement.appendChild(h2DrinksTag);
  drinksElement.appendChild(pDrink);

  const pDessert = UTILITY.newElement("p",
        `Prove an imense collection of flavors of desserts that you ` +
        `can't even imagine that are exists`
        ,[],[]);

  const h2DessertsTag = UTILITY.newElement("h2","Tasty Desserts",[],[]);

  const dessertsElement = UTILITY.newElement("div","",[],["service-type"]);
  dessertsElement.appendChild(h2DessertsTag);
  dessertsElement.appendChild(pDessert);

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
