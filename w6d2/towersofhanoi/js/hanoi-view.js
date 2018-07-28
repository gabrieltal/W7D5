class HanoiView {
  constructor (game, rootEl) {
    this.game = game;
    this.rootEl = rootEl;
    this.setupTowers();
    this.render();

    $('ul').on("click", e => {
      this.originTower = $(e.currentTarget);
      console.log(this.originTower);

    });
    if (typeof this.originTower !== "undefined") {
      $('ul').on("click", e => {
        this.targetTower = $(e.currentTarget);
        console.log(this.originTower, this.targetTower);
      });
    }
  }

  setupTowers() {
    const $tw1 = $('<ul>').addClass('tower1');
    const $tw2 = $('<ul>').addClass('tower2');
    const $tw3 = $('<ul>').addClass('tower3');

    for (let i = 1; i < 4; i++) {
      const $disk = $('<li>').addClass('disk').addClass(`disk${i}`);
      $tw1.append($disk);
    }

    this.rootEl.append($tw1, $tw2, $tw3);
  }

  render() {
    $("ul").empty();
    const towers = this.game.towers;
    for (let i = 0; i < towers.length; i++) {
      towers[i].reverse().forEach(disk => {
        const $lidisk = $('<li>').addClass('disk').addClass(`disk${disk}`);
        $(`.tower${i+1}`).append($lidisk);
      });
    }

  }
}
module.exports = HanoiView;
