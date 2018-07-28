const View = require("./ttt-view");
const Game = require("../solution/game");

$( () => {
  const game = new Game();
  const tttview = new View(game, $('.ttt'));

  tttview.makeMove();

});
