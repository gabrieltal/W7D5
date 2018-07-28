




Function.prototype.inherits = function (superclass){
  const Surrogate = function Surrogate () {};
  Surrogate.prototype = superclass.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
};


function MovingObject (name) {
  this.name = name;
}
MovingObject.prototype.test = function () {
  console.log(`${this.name}`);
};
function Ship (name) {
  MovingObject.call(this, name);
}
Ship.inherits(MovingObject);

function Asteroid () {

}
Asteroid.inherits(MovingObject);

const ship = new Ship("rocket");
ship.test();
