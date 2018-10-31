import './css/style.css';
import Image from './images/beef-food.jpg';
import * as header from './js/header.js';
import * as about from './js/about.js';

let tabsContainer = document.querySelector("#content");
header.loadPage(tabsContainer);
about.loadPage(tabsContainer);
