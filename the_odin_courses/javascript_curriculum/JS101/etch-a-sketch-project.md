### Introduction
In this project you'll be creating a pretty neat toy for your portfolio to flex your DOM manipulation skills.  You're going to build a browser version of something between a sketchpad and an Etch-A-Sketch.

This project should _not_ be easy for you.  You'll probably have to Google frequently to get the right JavaScript methods and CSS to use - in fact, that's the point!  You _can_ build this using the tools that you have already learned and there are plenty of resources on the net for learning stuff that we haven't covered yet if you decide you need it.  We'll walk you through the basic steps, but it will be up to you to actually implement them.

If you get totally stuck drop by the chatroom.. someone will be there to point you in the right direction.

### Assignment

<div class="lesson-content__panel" markdown="1">
1. [Follow the instructions atop Odin's Google Homepage project](https://www.theodinproject.com/courses/web-development-101/lessons/html-css) to setup a git repository for this project.
2. Create a webpage with a 16x16 grid of square divs
   1. Create the divs using JavaScript... don't try making them by hand with copy and pasting in your html file!
   2. Best to put your grid squares inside another "container" div \(that one can go directly in your html\)
   3. There are several different ways to make the divs appear as a grid \(verses just one on each line\) feel free to use any or play with each of them:
      1. float/clear
      2. inline-block
      3. flexbox
      4. CSS Grid
   4. Be careful with borders and margins, they can adjust the size of the squares!
   5. "OMG, Why isn't my grid being created???"
      1. Open your browser's developer tools
      2. Check if there are any errors in the JavaScript console
      3. Check your "elements" pane to see if the elements have actually shown up but are somehow hidden.
      4. Go willy-nilly and add  `console.log` statements in your JavaScript to see if it's actually being loaded.
3. Set up a "hover" effect so that the grid divs change color when your mouse passes over them, leaving a \(pixelated\) trail through your grid like a pen would.
   1. Hint: "hovering" is what happens when your mouse enters a div and ends when your mouse leaves it.. you can set up event listeners for either of those events as a starting point.
   2. There are multiple ways to change the color of the divs, including:
      1. adding a new class to the div
      2. changing the div's background color using JavaScript.
4. Add a button to the top of the screen which will clear the current grid and send the user a popup asking for how many squares per side to make the new grid.  Once entered the new grid should be generated _in the same total space as before_ \(e.g. 960px wide\) and now you've got a new sketch pad.
   1. Research `button` tags in HTML and how you can make a JavaScript function run when one is clicked.
   2. Also check out `prompt`s
   3. You should be able to enter `64` and have a brand new 64x64 grid pop up without changing the total amount of pixels used
5. \(Optional\): Instead of just changing the color of your grid from black to white \(for example\) have each pass through it with the mouse change to a completely random RGB value.   Then try having each pass just add another 10% of black to it so that only after 10 passes is the square completely black.
6. Push your project to GitHub!
</div>

### Student Solutions
Submit a solution with a pull request to this [file](https://github.com/TheOdinProject/javascript_curriculum/blob/master/JS101/etch-a-sketch-project.md) on the Javascript Curriculum github repository. See the section on [Contributing](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md) for how.

- Add your solution below this line!
* [Johan Morin's solution](https://github.com/MorrisMalone/Etch-a-Sketch-Project) - [View in browser](https://morrismalone.github.io/Etch-a-Sketch-Project/)
* [Balazs Birta's solution](https://github.com/bbalazs92/etch-a-sketch) - [View in browser](https://bbalazs92.github.io/etch-a-sketch/)
* [walnutdust's solution](https://github.com/walnutdust/etch-a-sketch) - [View in browser](https://walnutdust.github.io/etch-a-sketch/)
* [Clifford Minks's solution](https://github.com/xxerror500xx/TOP_Etch-a-Sketch) | [View in browser](https://xxerror500xx.github.io/TOP_Etch-a-Sketch/)
* [Agnieszka's Solution](https://github.com/elPetit69/etch-a-sketch) - [View in browser](https://elpetit69.github.io/etch-a-sketch/)
* [Ryafl's Solution](https://github.com/ryafl/etch-a-sketchProject) - [View in browser](https://ryafl.github.io/etch-a-sketchProject/)
* [James Moore's Solution](https://github.com/James-N-M/etch-a-sketch) - [View in browser](https://rawgit.com/James-N-M/etch-a-sketch/master/index.html)
* [SarfrazAnjum's solution](https://github.com/SarfrazAnjum/etchASketch) - [View in browser](https://github.com/SarfrazAnjum/etchASketch/)
* [Jonathan Yiv's Solution](https://github.com/getify) - [View in Browser](https://jonathanyiv.github.io/etch-a-sketch/)
* [Bojana Karakacev's solution](https://github.com/SarfrazAnjum/etchASketch) - [View in browser](https://github.com/SarfrazAnjum/etchASketch)
* [Calvin's solution](https://github.com/Calyeefornia/etch-a-sketch) - [View in browser](https://calyeefornia.github.io/etch-a-sketch/)
* [Bojana Karakacev's solution](https://github.com/bojana12/project-javascript-jquery) - [View in browser](https://bojana12.github.io/project-javascript-jquery/dist/)
* [Jmooree30's solution](https://github.com/jmooree30/etch-a-sketch-v2) - [View in browser](https://jmooree30.github.io/etch-a-sketch-v2/)
* [Mtizim's solution](https://github.com/mtizim/odin_projects/tree/master/etchasketch) - [View in browser](https://mtizim.github.io/odin_projects/etchasketch.html)
* [Javier Machin's Solution, with optional features](https://github.com/Javier-Machin/EtchSketch-PizarraMagica) - [View in browser](https://javier-machin.github.io/EtchSketch-PizarraMagica/)
* [Nate Dimock's Solution](https://github.com/Flakari/sketchpad) - [View in browser](https://flakari.github.io/sketchpad/)
* [JocelynOcelyn's Solution](https://github.com/jocelynocelyn/etchasketch) - [View in browser](https://jocelynocelyn.github.io/etchasketch/)
* [g0-0py's Solution](https://github.com/g0-0py/EtchASketch) - [View in browser](https://g0-0py.github.io/EtchASketch/)
* [artkol's Solution](https://github.com/artkol/simple-sketchpad) - [View in browser](https://artkol.github.io/simple-sketchpad/index.html)
* [AttilaTheHen's Solution](https://github.com/AttilaTheHen/SketchPad) - [View in browser](https://attilathehen.github.io/SketchPad/)
* [codyloyd's solution](https://github.com/codyloyd/odin-etch-a-sketch) - [View in browser](http://codyloyd.com/odin-etch-a-sketch/)
* [Kimberlee's Solution](https://github.com/KimDube/web-development/tree/master/etch-a-sketch) - [View in Browser](https://kimdube.github.io/web-development/etch-a-sketch/etchasketch.html)
* [PongtheGreat's Solution](https://github.com/PongtheGreat/etch-a-sketch) - [View in browser](https://pongthegreat.github.io/etch-a-sketch/)
* [Jakub Cisowski's Solution](https://github.com/arashin1337/etch-a-sketch) - [View in browser](https://arashin1337.github.io/etch-a-sketch/)
* [Dareon4's Solution](https://github.com/Dareon4/etch-a-sketch) - [View in browser](https://dareon4.github.io/etch-a-sketch/)
* [Alexander Luna's Solution](https://github.com/Mycroft1891/my-odin-project/tree/master/web-development-101/sketch) - [View in Browser](https://mycroft1891.github.io/my-odin-project/web-development-101/sketch/index.html)
* [SamJamCul's Solution](https://github.com/SamJamCul/etch-a-sketch) - [View in Browser](https://samjamcul.github.io/etch-a-sketch/)
* [Niko Caron's Solution](https://github.com/ncaron/etch-a-sketch/) - [View in Browser](https://ncaron.github.io/etch-a-sketch/)
* [Nick Leake's Solution](https://github.com/nleake/etchasketch) - [View in Browser](https://nleake.github.io/etchasketch/)
* [Eduardo Massarani's Solution](https://github.com/edmassarani/the-odin-project/tree/master/projects/etch-a-sketch) - [View in Browser](https://edmassarani.github.io/the-odin-project/projects/etch-a-sketch/)
* [Technicolor1's Solution](https://github.com/technicolor1/odin-etch_sketch) - [View in Browser](https://technicolor1.github.io/odin-etch_sketch/)
* [simplybretterson's Solution](https://github.com/simplybretterson/sketchpad) - [View in Browser](https://simplybretterson.github.io/sketchpad)
* [CTavino's Solution](https://github.com/ctavino/etch-a-sketch) - [View in Browser](https://ctavino.github.io/etch-a-sketch/)
* [Tshepo Mohlamonyane's Solution](https://github.com/blavkboy/Vanilla-JS-Sketchpad) - [View in Browser](https://blavkboy.github.io/Vanilla-JS-Sketchpad/)
* [CurmudJim's Solution](https://github.com/CurmudJim/EtchASketch) - [View in Browser](https://curmudjim.github.io/EtchASketch/)
* [vartanbeno's solution](https://github.com/vartanbeno/sketchpad) - [View in browser](https://vartanbeno.github.io/sketchpad/)
* [Josiah's solution](https://github.com/jdonor/etch-a-sketch) - [View in browser](https://jdonor.github.io/etch-a-sketch/)
* [Ezra's solution](https://github.com/Azhorabai/etch-a-sketch) - [View in browser](https://azhorabai.github.io/etch-a-sketch/)
* [HSaad's solution](https://github.com/HSaad/etch-a-sketch) - [View in browser](https://hsaad.github.io/etch-a-sketch/)
* [Fabio's solution](https://github.com/ffabiorj/etch-a-sketch) - [View in browser](https://cdn.rawgit.com/ffabiorj/etch-a-sketch/5793f5ec/index.html)
* [Cameron's solution](https://github.com/cameronzsmith/etchasketch) - [View in browser](http://czsmith.me/etchasketch)
* [Zach Coursey's solution](https://github.com/zcoursey22/etch-a-sketch) - [View in browser](https://zcoursey22.github.io/etch-a-sketch)
* [axelerleo's solution](https://github.com/axelerleo/Etch-a-scratch) - [View in browser](https://axelerleo.github.io/Etch-a-scratch/)
* [bradabayor's solution](https://github.com/bradabayor/etch-a-sketch) - [View in browser](https://bradabayor.github.io/etch-a-sketch)
* [Encolpius's solution](https://github.com/Encolpius/etch-a-sketch) - [View in browser](http://narrow-activity.surge.sh/)
* [Ryoma's solution](https://github.com/ryozume/drawing_grids) - [View in browser](https://ryozume.github.io/drawing_grids/)
* [Joe Weston's solution](https://github.com/joeeeeeeeeeeeee/etch-a-sketch) - [View in browser](https://joeeeeeeeeeeeee.github.io/etch-a-sketch/)
* [Aziz Yakubov's solution](https://github.com/azizyakubov/etchasketch) - [View in browser](https://azizyakubov.github.io/etchasketch/)
* [Uy Binh's solution](https://github.com/uybinh/Etch-a-Sketch) - [View in browser](https://uybinh.github.io/Etch-a-Sketch/)
