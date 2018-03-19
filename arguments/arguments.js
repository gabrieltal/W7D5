// sum(1, 2, 3, 4) === 10
// sum(1, 2, 3, 4, 5) === 15

function sum1() {
  let args = Array.from(arguments);
  let sum = 0;
  args.forEach((el)=> {
    sum+=el;
  });
  return sum;
}

// console.log(sum1(1,2,3));
// console.log(sum1(55,4,3,1,66,4,3,6,12,43));

function sum2(...args){
  let sum = 0;
  args.forEach((el)=> {
    sum+=el;
  });
  return sum;
}

// console.log(sum2(1,2,3));
// console.log(sum2(55,4,3,1,66,4,3,6,12,43));


Function.prototype.myBind = function () {
  let first = arguments[0];
  // console.log(arguments);
  let args = Array.from(arguments).slice(1);
  return (...anything) => {
    let args2 = Array.from(arguments);
    // console.log(anything);
    this.apply(first, args.concat(anything));
  };
};

class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

const markov = new Cat("Markov");
const breakfast = new Cat("Breakfast");


// markov.says("meow", "Ned");
// markov.says.myBind(breakfast, "meow", "Kush")();
// markov.says.myBind(breakfast)("meow", "a tree");
// markov.says.myBind(breakfast, "meow")("Markov");
// const notMarkovSays = markov.says.myBind(breakfast);
// notMarkovSays("meow", "me");

function curriedSum(numArgs) {
  const array = [];
  const _curriedSum = function (number) {
    array.push(number);
    if (numArgs === array.length) {
      let sum = 0;
      array.forEach( (el) => {
        sum += el;
      });
      return sum;
    } else{
      return _curriedSum;
    }
  };
  return _curriedSum;
}
//
// const sum3 = curriedSum(4);
// console.log(sum3(5)(30)(20)(2));

Function.prototype.curry = function (numArgs) {
  const array = [];

  // const curryBind = this._curriedSum.bind(this);
  const _curriedSum = (number) => {
    array.push(number);

    if (numArgs === array.length) {
      // return curryBind.apply(array);
      console.log(this);
      console.log(array);
      return this(array);
      // return Function.prototype.apply(this, array);
    } else{
      return _curriedSum;
    }
  };
  return _curriedSum;
};

const test = function (array) {
  let sum = 1;
  array.forEach( (el) => {
    sum *= el;
  });
  return sum;
};

const sum5 = test.curry(4);
console.log(sum5(5)(30)(20)(2));
