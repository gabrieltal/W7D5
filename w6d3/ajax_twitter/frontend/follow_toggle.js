
const APIUtil = require("./api_util");

class FollowToggle {
  constructor (el) {
    this.$el = $(el);
    this.userId = this.$el.data("user-id");
    this.followState = this.$el.data("initial-follow-state");
    this.render();

    this.$el.on('click', this.handleClick.bind(this));
  }

  render () {
    if (this.followState === "followed") {
      this.$el.html("unfollow");
    } else {

      this.$el.html("follow");
    }
  }

  handleClick(event) {
    // const follotToggle = this;
    event.preventDefault();
    if (this.followState === "followed") {
      APIUtil.unfollowUser(this.userId);
      this.followState = "unfollowed";
    } else {
      APIUtil.followUser(this.userId);
      this.followState = "followed";
    }

    this.render();
  }
}
module.exports = FollowToggle;


// let lola = {
//   name: "Lola",
//   sayHi: function () {
//     console.log("hi");
//   }
// };
//
// lola.sayHi();
//
// let unboundSayHi = lola.sayHi;
// unboundSayHi();
//
//
// function ajax(opts) {
//   // do the ajax ApplicationController
//   let success = opts.success;
//   success();
//
//   opts.succees();
// }
