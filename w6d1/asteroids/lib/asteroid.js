const MovingObject = require("./moving_object.js");

window.MovingObject = MovingObject;

const Util = {
  randomVec(length) {
    const deg = 2 * Math.PI * Math.random();
    return Util.scale([Math.sin(deg), Math.cos(deg)], length);
  },
  // Scale the length of a vector by the given amount.
  scale(vec, m) {
    return [vec[0] * m, vec[1] * m];
  }
};

function Asteroid(option) {
  console.log("HEYYY");
  const options = {pos: option.pos, vel: Util.randomVec(50), radius: 5, color: "gray" };
  MovingObject.new(options);
}

module.exports = Asteroid;
