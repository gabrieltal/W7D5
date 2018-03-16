Array.prototype.bubbleSort = function () {
  let sorted = false;

  while (!sorted) {
    sorted = true;
    for (let i = 0; i < this.length - 1; i++) {
      if (this[i] > this[i+1]) {
        [this[i], this[i+1]] = [this[i+1], this[i]];
        sorted = false;
      }
    }
  }
  return this;
};
//
// let bubbleTest = [3, 4, 1, 2, 10];
// console.log(bubbleTest.bubbleSort());

String.prototype.substrings = function () {
  let subArr = [];
  for (let i = 0; i < this.length; i++) {
    if(this.length === 0 || this.length === 1){
      continue;
    }
    subArr.push(this.slice(i, this.length));
  }
  return subArr;
};

let stringTest = "test";
console.log(stringTest.substrings());
