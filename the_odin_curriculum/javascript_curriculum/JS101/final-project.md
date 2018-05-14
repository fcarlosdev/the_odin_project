### Introduction
You made it! By now you should have a _really_ firm grasp on the fundamentals of JavaScript.  Of course there's plenty more to learn, but you should be able to create quite a bit at this point.  Our final project is going to try to combine everything you've learned so far.. you're going to be making an on-screen calculator using JavaScript, HTML and CSS.

As usual with these things there are elements of this project that are not going to be trivially easy for you, but if you've been following the course so far you definitely have everything you need to finish it.  We're going to walk you through the various steps you can take, but again, how you actually implement them is up to you!


### Assignment

<div class="lesson-content__panel" markdown="1">
Here are some use cases (abilities you project needs to have):

1. Your calculator is going to contain functions for all of the basic math operators you typically find on simple calculators, so start by creating functions for the following items and testing them in your browser's console.
   1. add
   2. subtract
   3. multiply
   4. divide
2. Create a new function `operate` that takes an operator and 2 numbers and then calls one of the above functions on the numbers.
3. Create a basic HTML calculator with buttons for each digit, each of the above functions and an "Equals" key.
   1. Do not worry about wiring up the JS just yet.
   2. There should also be a display for the calculator, go ahead and fill it with some dummy numbers so you can get it looking right.
   3. Add a "clear" button.
4. Create the functions that populate the display when you click the number buttons... you should be storing the 'display value' in a variable somewhere for use in the next step.
5. Make the calculator work! You'll need to store the first number that is input into the calculator when a user presses an operator, and also save which operation has been chosen and then `operate()` on them when the user presses the "=" key.
   1. You should already have the code that can populate the display, so once `operate()` has been called, update the display with the 'solution' to the operation.
   2. This is the hardest part of the project.  You need to figure out how to store all the values and call the operate function with them.  Don't feel bad if it takes you a while to figure out the logic.
6. Gotchas: watch out for and fix these bugs if they show up in your code:
   1. Users should be able to string together several operations and get the right answer: `12 + 7 - 5 * 3` etc.
   2. You should round answers with long decimals so that they don't overflow the screen.
   2. Pressing `=` before entering all of the numbers or an operator could cause problems!
   3. Pressing "clear" should wipe out any existing data.. make sure the user is really starting fresh after pressing "clear"
   4. Display a snarky error message if the user tries to divide by 0... don't let it crash your calculator!
7. EXTRA CREDIT: Users can get floating point numbers if they do the math required to get one, but they can't type them in yet.  Add a `.` button and let users input decimals!  Make sure you don't let them type more than one though: `12.3.56.5`. It is hard to do math on these numbers. \(disable the decimal button if there's already one in the display\)
8. EXTRA CREDIT: Make it look nice!  This can be a good portfolio project... but not if it's UGLY.  At least make the  operations a different color from the keypad buttons.
9. EXTRA CREDIT: Add a "backspace" button, so the user can undo if they click the wrong number.
10. EXTRA CREDIT: Add keyboard support!
</div>

### Student Solutions
Submit a solution with a pull request to this [file](https://github.com/TheOdinProject/javascript_curriculum/blob/master/JS101/final-project.md) on the Javascript Curriculum github repository. See the section on [Contributing](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md) for how.

- Add your solution below this line!

- [Javier Machin's solution](https://github.com/Javier-Machin/Calculator) - [View in Browser](https://javier-machin.github.io/Calculator/)
- [Calvin's solution](https://github.com/Calyeefornia/Calculator) - [View in Browser](https://calyeefornia.github.io/Calculator/)
- [Nate Dimock's solution](https://github.com/Flakari/calculator) - [View in Browser](https://flakari.github.io/calculator/)
- [SarfrazAnjum's solution](https://github.com/SarfrazAnjum/Calculator) - [View in Browser](https://github.com/SarfrazAnjum/Calculator)
- [Jonathan Yiv's solution](https://github.com/JonathanYiv/calculator) - [View in Browser (not Mobile)](https://github.com/JonathanYiv/calculator)
- [Jmooree30's solution](https://github.com/jmooree30/calculator) - [View in Browser](https://jmooree30.github.io/calculator/)
- [Mtizim's solution](https://github.com/mtizim/odin_projects/tree/master/calculator) - [View in Browser](https://mtizim.github.io/odin_projects/calculator.html)
- [JocelynOcelyn's solution](https://github.com/jocelynocelyn/calculator) - [View in Browser](https://jocelynocelyn.github.io/calculator/)
- [OthmanAmoudi's solution](https://github.com/OthmanAmoudi/javascript-calculator) - [View in Browser](https://codepen.io/theweeknd/full/GMNdGb/)
- [105ron's solution](https://github.com/105ron/calculator) - [View in browser](https://105ron.github.io/calculator/)
- [codyloyd's solution](https://github.com/codyloyd/odin-calculator) - [View in browser](http://codyloyd.com/odin-calculator/)
- [dejanmijatovic's solution](https://github.com/Anhatel/calculator-project)
- [PongtheGreat's solution](https://github.com/PongtheGreat/simple_calculator) - [View in browser](https://pongthegreat.github.io/simple_calculator/)
- [Alexander Luna's solution](https://github.com/Mycroft1891/my-odin-project/tree/master/web-development-101/calculator) - [View in Browser](https://mycroft1891.github.io/my-odin-project/web-development-101/calculator/index.html)
- [Dareon4's solution](https://github.com/Dareon4/calculator) - [View in Browser](https://dareon4.github.io/calculator/)
- [Niko Caron's solution](https://github.com/ncaron/react-calculator) - [View in Browser](https://ncaron.github.io/react-calculator/)
- [g0-0py's solution](https://github.com/g0-0py/Simple-Calculator) - [View in Browser](https://g0-0py.github.io/Simple-Calculator/)
- [Jakub Cisowski's solution](https://github.com/arashin1337/calculator) - [View in Browser](https://arashin1337.github.io/calculator/)
- [Eduardo Massarani's solution](https://github.com/edmassarani/the-odin-project/tree/master/projects/calculator) - [View in Browser](https://edmassarani.github.io/the-odin-project/projects/calculator/)
- [Naveen M V's solution](https://github.com/naveencode/calculator) - [View in Browser](https://naveencode.github.io/calculator/)
- [AttilaTheHen's solution](https://github.com/AttilaTheHen/calculator) - [View in Browser](https://attilathehen.github.io/calculator/)
- [Laura Ilona's solution](https://github.com/laurailona/calculator) - [View in Browser](https://laurailona.github.io/calculator/)
- [SamJamCul's solution](https://github.com/SamJamCul/calculator) - [View in Browser](https://samjamcul.github.io/calculator/)
- [simplybretterson's solution](https://github.com/simplybretterson/calculator) - [View in Browser](https://simplybretterson.github.io/calculator/)
- [vartanbeno's solution](https://github.com/vartanbeno/calculator) - [View in browser](https://vartanbeno.github.io/calculator/)
- [Zach Coursey's solution](https://github.com/zcoursey22/calculator) - [View in browser](https://zcoursey22.github.io/calculator/)
- [HSaad's solution](https://github.com/HSaad/calculator) - [View in browser](https://hsaad.github.io/calculator/)
- [Josiah's solution](https://github.com/jdonor/calculator) - [View in browser](https://jdonor.github.io/calculator/)
- [Bridget Nyirongo's solution](https://github.com/Bridget12/basiccalculculator) - [View in browser](https://bridget12.github.io/basiccalculculator/)
- [CurmudJim's solution](https://github.com/CurmudJim/JS_Calculator) - [View in Browser](https://curmudjim.github.io/JS_Calculator/)
- [Joe Weston's solution](https://github.com/joeeeeeeeeeeeee/project-calculator) - [View in Browser](https://joeeeeeeeeeeeee.github.io/project-calculator/)
- [Technicolor1's solution](https://github.com/technicolor1/simpleCalculator) - [View in Browser](https://technicolor1.github.io/simpleCalculator/)
