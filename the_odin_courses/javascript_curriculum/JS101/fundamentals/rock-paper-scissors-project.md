### Introduction
We're going to make a simple implementation of grade-school classic "rock paper scissors".  If you don't know what that is check the [wikipedia article](https://en.wikipedia.org/wiki/Rock%E2%80%93paper%E2%80%93scissors) or [this](https://www.wikihow.com/Play-Rock,-Paper,-Scissors) ridiculous step-by-step.  For the moment we're just going to play the game from the browser console, but we will revisit it and add a front end later so don't forget to keep the code on GitHub! You might notice some 'view in browser' links in the student solutions - this is coming in a later lesson.  When you get there don't forget to come back and add  your link!

### Assignment

<div class="lesson-content__panel" markdown="1">
1. Start a new git repo for your project.
2. Create a blank HTML document with a script tag.  This game is going to be played
    completely from the console, so don't worry about putting anything else in there.
3. Your game is going to play against the computer, so begin with a function called `computerPlay` that will randomly return either 'Rock', 'Paper' or 'Scissors'.  We'll use this function in the game to make the computer's play.
4. Write a function that plays a single round of Rock Paper Scissors.  The function should take two parameters - the `playerSelection` and `computerSelection` - and then return a string that declares the winner of the round like so: `"You Lose! Paper beats Rock"`
   1. make your function case insensitive (so users can input `rock`, `ROCK`, `RocK` or any other variation)

   2. __Important note:__ you want to `return` the results of this function call, _not_ `console.log()` them.  To test this function console.log the results:

      ~~~javascript
      function playRound(playerSelection, computerSelection) {
      	// your code here!
      }

      const playerSelection = 'rock'
      const computerSelection = computerPlay()
      console.log(playRound(playerSelection, computerSelection))
      ~~~

      ​
5. Write a NEW function called `game()`. Use the previous function _inside_ of this one to play a 5 round game that keeps score and reports a winner or loser at the end.
   1. At this point you should still just be using `console.log()` to display the results of each round and the winner at the end.
   2. Use `prompt()` to get input from the user. [Read the docs here if you need to.](https://developer.mozilla.org/en-US/docs/Web/API/Window/prompt)
   3. Feel free to re-work your previous functions if you need to.  Specifically, you might want to change the return value to something more useful.
   4. Feel free to create more "helper" functions if you think it would be useful.

</div>

### Student Solutions
Submit a solution with a pull request to this [file](https://github.com/TheOdinProject/javascript_curriculum/blob/master/JS101/fundamentals/rock-paper-scissors-project.md) on the Javascript Curriculum github repository. See the section on [Contributing](http://github.com/TheOdinProject/curriculum/blob/master/contributing.md) for how.

- Add your solution below this line!
- [Tony Nyagah's solution](https://github.com/TonyNyagah/rock-paper-scissors)
- [hypnagogiasmic's solution](https://github.com/hypnagogiasmic/rps) - [View in browser](https://rawgit.com/hypnagogiasmic/rps/master/rps-new.html)
- [Kerstin Wagner's solution](https://github.com/KWagner91/rock-paper-scissors)
- [ayanlehd's solution](https://github.com/ayanlehd/rock_paper_scissors)
- [Jon Yoo's solution](https://github.com/jonyoowa/rock-paper-scissors-browser) - [View in browser](https://jonyoowa.github.io/rock-paper-scissors-browser/)
- [D1789's solution](https://github.com/D1789/RPS1) - [View in browser](https://rawgit.com/D1789/RPS1/master/index.html)
- [Edmond Alosa's solution](https://github.com/eddalosa/rockPaperScissor) - [View in browser](https://eddalosa.github.io/rockPaperScissor/)
- [Paul-EN's solution](https://github.com/Paul-EN/rock-paper-scissors/blob/master/index.html) - [View in browser](https://paul-en.github.io/rock-paper-scissors/) - [UI version](https://github.com/Paul-EN/rock-paper-scissors-v2) - [View in browser](https://paul-en.github.io/rock-paper-scissors-v2/)
- [Alexander John's solution](https://github.com/alexander-john/rock-paper-scissors) - [View in browser](https://alexander-john.github.io/rock-paper-scissors/)
- [Kerstin Wagner's solution](https://github.com/KWagner91/rock-paper-scissors) - [View in browser](https://kwagner91.github.io/)
- [Johan Morin's console solution](https://github.com/MorrisMalone/rock_scissors_paper.git) - [UI solution](https://github.com/MorrisMalone/rock_scissors_paper)
- [Matt Claghorn's console solution](https://github.com/Claggy/rock-paper-scissors) - [View in browser](https://claggy.github.io/rock-paper-scissors/)
- [Bartek Butrym's solution](https://github.com/BartekButrym/rock-paper-scissors)
- [Fabien Kovacic's solution](https://github.com/Fabious/rock-paper-scissors) - [View in browser](https://fabious.github.io/rock-paper-scissors/)
- [mindovermiles262's Solution](https://github.com/mindovermiles262/odin-js101-solutions/tree/master/project-rock-paper-scissors)
- [Jonathan Yiv's solution](https://github.com/JonathanYiv/rock-paper-scissors) - [View in browser](https://jonathanyiv.github.io/rock-paper-scissors/)
- [Uglješa Ijačić's solution](https://github.com/ugitch/rock-paper-scissors)
- [Samuel Master's UI solution](https://github.com/redeyetuning/rock-paper-scissors/) - [View in browser](https://redeyetuning.github.io/rock-paper-scissors/)
- [SarfrazAnjum Solution](https://github.com/SarfrazAnjum/Rock-Paper-Scissors)
- [Bojana Karakacev's solution](https://github.com/bojana12/rock-paper-scissors) - [View in browser](https://bojana12.github.io/rock-paper-scissors/dist/) - [UI version](https://github.com/bojana12/rock-paper-scissors-UI) - [View in browser](https://bojana12.github.io/rock-paper-scissors-UI/dist/)
- [James Moores's Gui solution](https://rawgit.com/James-N-M/rock-paper-scissors/master/index.html)
- [Jmooree30's solution](https://github.com/jmooree30/rock-paper-scissors) - [View in browser](https://jmooree30.github.io/rock-paper-scissors/)
- [Luján Fernaud's solution](https://github.com/lujanfernaud/js-rock-paper-scissors) - [View in browser](http://lujanfernaud.com/js-rock-paper-scissors/)
- [Clifford Minks's console solution](https://github.com/xxerror500xx/TOP_RPSGame.git) - [View in browser](https://xxerror500xx.github.io/TOP_RPSGame/)
- [Nate Dimock's solution](https://github.com/Flakari/rock-paper-scissors) - [View in browser](https://flakari.github.io/rock-paper-scissors/) | [GUI Solution](https://github.com/Flakari/rock-paper-scissors-gui) - [View in browser](https://flakari.github.io/rock-paper-scissors-gui/)
- [leosoaivan's solution](https://github.com/leosoaivan/rockpaperscissor)
- [ThirtyThreeB's solution](https://github.com/ThirtyThreeB/rock-paper-scissors) - [View in browser](https://thirtythreeb.github.io/rock-paper-scissors/)
- [PongtheGreat's solution](https://github.com/PongtheGreat/RPS) - [View in browser](https://pongthegreat.github.io/RPS/)
- [codyloyd's solution](https://github.com/codyloyd/odin-rock-paper-scissors) - [GUI version!](http://codyloyd.com/odin-rock-paper-scissors/)
- [Tshepo Mohlamonyan's solution](https://github.com/blavkboy/rock_paper_scissors.git)
- [g0-0py's solution](https://github.com/g0-0py/Rock-Paper-Scissors) - [View in browser](https://g0-0py.github.io/Rock-Paper-Scissors/)  |  [GUI](https://github.com/g0-0py/Rock-Paper-Scissors-GUI) - [View in browser](https://g0-0py.github.io/Rock-Paper-Scissors-GUI/)
- [Kimberlee's solution](https://github.com/KimDube/web-development/tree/master/rock-paper-scissors) - [View in browser](https://kimdube.github.io/web-development/rock-paper-scissors/)
- [SamJamCul's solution](https://github.com/SamJamCul/rock-paper-scissors) - [View in browser](https://samjamcul.github.io/rock-paper-scissors/)
- [Djokole's solution](https://github.com/djokole/RPS) - [View in browser](https://djokole.github.io/RPS/)
- [artkol's solution](https://github.com/artkol/simple-rps-game) - [View in browser](https://artkol.github.io/simple-rps-game/)
- [Shanemcc94's solution](https://github.com/shanemcc94/rock-paper-scissors) - [View in browser](https://shanemcc94.github.io/rock-paper-scissors/)
- [dejanmijatovic's solution](https://github.com/Anhatel/rock-paper-scissors)
- [technicolor1's solution](https://github.com/technicolor1/odin-rockpaperscissors) - [View in browser](https://technicolor1.github.io/odin-rockpaperscissors/)
- [Jakub Cisowski's solution](https://github.com/arashin1337/rock-paper-scissors) - [View in browser](https://arashin1337.github.io/rock-paper-scissors/)
- [Alexander Luna's solution](https://github.com/Mycroft1891/my-odin-project/tree/master/web-development-101/rps) - [View in browser](https://mycroft1891.github.io/my-odin-project/web-development-101/rps/index.html)
- [Niko Caron's solution](https://github.com/ncaron/RPSLS) - [View in browser](https://ncaron.github.io/RPSLS/)
- [Dareon4's solution](https://github.com/Dareon4/rock-paper-scissors) - [View in browser](https://dareon4.github.io/rock-paper-scissors/)
- [Agnieszka'a solution](https://github.com/elPetit69/gui-rock-paper-scissors) - [View in browser](https://elpetit69.github.io/gui-rock-paper-scissors/)
- [Eduardo Massarani's solution](https://github.com/edmassarani/the-odin-project/tree/master/projects/jankenpon/gui-version) - [View in browser](https://edmassarani.github.io/the-odin-project/projects/jankenpon/gui-version/)
- [Nick Leake's solution](https://github.com/nleake/odin-js-rockPaperScissors)
- [Javier Machin's solution](https://github.com/Javier-Machin/RockPaperScis) - [View in browser](https://javier-machin.github.io/RockPaperScis/)
- [CurmudJim's solution](https://github.com/CurmudJim/top_rps_js) - [View in browser](https://curmudjim.github.io/top_rps_js/)
- [Encolpius's solution](https://github.com/Encolpius/rock-paper-scissors) - [View in browser](https://encolpius.github.io/rock-paper-scissors/)
- [PaullyFIRE's solution](https://github.com/paullyFIRE/RockPaperScissors) - [View in browser](https://paullyfire.github.io/RockPaperScissors/)
- [vartanbeno's solution](https://github.com/vartanbeno/rock-paper-scissors) - [View in browser](https://vartanbeno.github.io/rock-paper-scissors/)
- [Alexey Leonov's solution](https://github.com/axelerleo/rock-skissors-paper) - [View in browser](https://axelerleo.github.io/rock-skissors-paper/)
- [Fabio Oliveira's solution](https://github.com/ffabiorj/rock_paper_scissors) - [View in browser](https://cdn.rawgit.com/ffabiorj/rock_paper_scissors/dab5e260/index.html)
- [Franklyn Afeso's solution](https://github.com/afeso/janken)
- [Matt Hagner's solution](https://github.com/hagnerd/improved-rock-paper-scissors) - [View in browser](https://hagnerd.github.io/improved-rock-paper-scissors/)
- [WausauBill's Solution](https://github.com/WausauBill/WausauBill.github.io/tree/master/the_odin_project/roshambo) - [View in Browser](https://wausaubill.github.io/the_odin_project/roshambo/index.html)
- [Ryoma's solution](https://github.com/ryozume/rock_paper_scissors) - [View in browser](https://ryozume.github.io/rock_paper_scissors_withJS/)
- [bradabayor's Solution](https://github.com/bradabayor/rock-paper-scissors) - [View in Browser](https://bradabayor.github.io/rock-paper-scissors)
- [HSaad's solution](https://github.com/HSaad/rock-paper-scissors) - [View in browser](https://hsaad.github.io/rock-paper-scissors/)
- [jmurinello's solution](https://github.com/jmurinello/rock-scissors-paper)
- [Cody Selman's solution](https://github.com/CodySelman/rock-paper-scissors) - [View in browser](https://codyselman.github.io/rock-paper-scissors/index.html)
- [Zach Coursey's solution](https://github.com/zcoursey22/rock-paper-scissors) - [View in browser](https://zcoursey22.github.io/rock-paper-scissors)
- [Nikhil Patel's Solution](https://github.com/nikhilpatel87/rock-paper-scissors/blob/master/index.html)
- [Ivan Martinez' Solution](https://github.com/ivanmaru86/rock-paper-scissors)
- [Jamie's Solution](https://github.com/Zorafins/rock-paper-scissors/blob/master/index.html)
- [Balake's Solution](https://github.com/Balake/rock-paper-scissors/blob/master/index.html)
- [Joe Weston's Solution](https://github.com/joeeeeeeeeeeeee/rock-paper-scissors) - [View in browser](https://joeeeeeeeeeeeee.github.io/rock-paper-scissors)
- [Suraj's solution](https://github.com/surajsingla333/rock-paper-scissors) - [View in browser](https://surajsingla333.github.io/rock-paper-scissors)
- [Benny's Solution](https://github.com/Deckins/rock_paper_scissors) - [View in browser](https://deckins.github.io/rock_paper_scissors/)
- [Aziz Yakubov's solution](https://github.com/azizyakubov/rock-paper-scissors) - [View in browser](https://azizyakubov.github.io/rock-paper-scissors/)
