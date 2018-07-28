class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();

  }

  bindEvents() {
    $('.square').on("click", e => {

      const $selectedSquare = $(e.currentTarget);

      let pos = $selectedSquare.attr("data-pos");
      pos = pos.split(",");
      pos = pos.map(el => parseInt(el));


      try {
        this.game.playMove(pos);

        const mark = this.game.currentPlayer;

        $selectedSquare.append(mark);
        $selectedSquare.addClass('player-mark-' + mark);

        if (this.game.isOver()) {
          $('.square').addClass('over');
          $('.square').off();
          console.log(this.game.board.winner());
          if (this.game.board.winner() !== null) {
            this.$el.after(`<footer>${mark} won!!</footer>`);
            this.game.board.winning_pos.forEach(winPos => {
              let winPoS = winPos[0] + "," + winPos[1];

              $(`.square[data-pos="${winPoS}"]`).addClass("winner");
            });
          } else {
            this.$el.after(`<footer>No winners, you LOSERS!!</footer>`);
          }
        }
      }
      catch(err) {
        alert("Invalid move, you FOOL!");
      }
    });

  }

  makeMove($square) {

      this.bindEvents();

  }

  setupBoard() {
    const $ul = $('<ul>').addClass('board');
    for (let i = 0; i < 3; i++) {
      for (let j = 0; j < 3; j++) {
        const $square = $('<li>').addClass('square').attr("data-pos", [i, j]);
        $ul.append($square);
      }
    }
    this.$el.append($ul);
  }
}

module.exports = View;
