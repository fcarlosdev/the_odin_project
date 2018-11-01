import * as UTILITY from '../js/util.js';

const loadPage = (mainContent) => {

  const h1FoodSectionTitle = UTILITY.newElement("h1","Foods",[],[]);

  const divFoodSectionTitle = UTILITY.newElement("div","",[],["section-title"]);
  divFoodSectionTitle.appendChild(h1FoodSectionTitle);


  const imagesFood = [];
  imagesFood["german"]    = UTILITY.newElement("img","",{"src":"images/german_food.jpeg"},[]);
  imagesFood["italian"]   = UTILITY.newElement("img","",{"src":"images/italian_food.jpeg"},[]);
  imagesFood["french"]    = UTILITY.newElement("img","",{"src":"images/french_food.jpeg"},[]);
  imagesFood["mexican"]   = UTILITY.newElement("img","",{"src":"images/mexican_food.jpeg"},[]);
  imagesFood["brazilian"] = UTILITY.newElement("img","",{"src":"images/brazilian_food.jpeg"},[]);
  imagesFood["chinese"]   = UTILITY.newElement("img","",{"src":"images/chinese_food.jpeg"},[]);
  imagesFood["japanese"]  = UTILITY.newElement("img","",{"src":"images/japanese_food.jpeg"},[]);
  imagesFood["spanish"]   = UTILITY.newElement("img","",{"src":"images/spanish_food.jpeg"},[]);

  const titlesCountryFood = [];
  titlesCountryFood["german"]    = UTILITY.newElement("h2","German",[],[]);
  titlesCountryFood["italian"]   = UTILITY.newElement("h2","Italian",[],[]);
  titlesCountryFood["french"]    = UTILITY.newElement("h2","French",[],[]);
  titlesCountryFood["mexican"]   = UTILITY.newElement("h2","Mexcian",[],[]);
  titlesCountryFood["brazilian"] = UTILITY.newElement("h2","Brazilian",[],[]);
  titlesCountryFood["chinese"]   = UTILITY.newElement("h2","Chinese",[],[]);
  titlesCountryFood["japanese"]  = UTILITY.newElement("h2","Japanese",[],[]);
  titlesCountryFood["spanish"]   = UTILITY.newElement("h2","Spanish",[],[]);

  const imagesFoodReferences = [];
  imagesFoodReferences["german"] = UTILITY.newElement("a","",{"href":"#"},[]).appendChild(imagesFood["german"]);
  imagesFoodReferences["italian"] = UTILITY.newElement("a","",{"href":"#"},[]).appendChild(imagesFood["italian"]);
  imagesFoodReferences["french"] = UTILITY.newElement("a","",{"href":"#"},[]).appendChild(imagesFood["french"]);
  imagesFoodReferences["mexican"] = UTILITY.newElement("a","",{"href":"#"},[]).appendChild(imagesFood["mexican"]);
  imagesFoodReferences["brazilian"] = UTILITY.newElement("a","",{"href":"#"},[]).appendChild(imagesFood["brazilian"]);
  imagesFoodReferences["chinese"] = UTILITY.newElement("a","",{"href":"#"},[]).appendChild(imagesFood["chinese"]);
  imagesFoodReferences["japanese"] = UTILITY.newElement("a","",{"href":"#"},[]).appendChild(imagesFood["japanese"]);
  imagesFoodReferences["spanish"] = UTILITY.newElement("a","",{"href":"#"},[]).appendChild(imagesFood["spanish"]);


  const germanFood = UTILITY.newElement("div","",[],["food-details"]);
  germanFood.appendChild(titlesCountryFood["german"]);
  germanFood.appendChild(imagesFoodReferences["german"]);

  const italianFood = UTILITY.newElement("div","",[],["food-details"]);
  italianFood.appendChild(titlesCountryFood["italian"]);
  italianFood.appendChild(imagesFoodReferences["italian"]);

  const frenchFood = UTILITY.newElement("div","",[],["food-details"]);
  frenchFood.appendChild(titlesCountryFood["french"]);
  frenchFood.appendChild(imagesFoodReferences["french"]);

  const mexicanFood = UTILITY.newElement("div","",[],["food-details"]);
  mexicanFood.appendChild(titlesCountryFood["mexican"]);
  mexicanFood.appendChild(imagesFoodReferences["mexican"]);

  const brazilianFood = UTILITY.newElement("div","",[],["food-details"]);
  brazilianFood.appendChild(titlesCountryFood["brazilian"]);
  brazilianFood.appendChild(imagesFoodReferences["brazilian"]);

  const chineseFood = UTILITY.newElement("div","",[],["food-details"]);
  chineseFood.appendChild(titlesCountryFood["chinese"]);
  chineseFood.appendChild(imagesFoodReferences["chinese"]);

  const japaneseFood = UTILITY.newElement("div","",[],["food-details"]);
  japaneseFood.appendChild(titlesCountryFood["japanese"]);
  japaneseFood.appendChild(imagesFoodReferences["japanese"]);

  const spanishFood = UTILITY.newElement("div","",[],["food-details"]);
  spanishFood.appendChild(titlesCountryFood["spanish"]);
  spanishFood.appendChild(imagesFoodReferences["spanish"]);


  const foodsContainer = UTILITY.newElement("div","",[],["foods"]);
  foodsContainer.appendChild(germanFood);
  foodsContainer.appendChild(italianFood);
  foodsContainer.appendChild(frenchFood);
  foodsContainer.appendChild(mexicanFood);

  const foodsContainer2 = UTILITY.newElement("div","",[],["foods"]);
  foodsContainer2.appendChild(brazilianFood);
  foodsContainer2.appendChild(chineseFood);
  foodsContainer2.appendChild(japaneseFood);
  foodsContainer2.appendChild(spanishFood);


  const menuPage = UTILITY.newElement("section","",{"id": "sec-menu"},["headline"]);
  menuPage.appendChild(divFoodSectionTitle);
  menuPage.appendChild(foodsContainer);
  menuPage.appendChild(foodsContainer2);



  mainContent.appendChild(menuPage);

  return mainContent;
}

export { loadPage };
