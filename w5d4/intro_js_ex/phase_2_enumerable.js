Array.prototype.myEach = function (callback) {
  for (let i = 0; i < this.length; i++) {
    callback(this[i]);
  }
};

// let myEachTest = [1, 2, 3, 4, 5];
// myEachTest.myEach((num)=>{
//   return num * 2;
// });



Array.prototype.myMap = function(callback) {
  let mappedArray = [];

  this.myEach(function(num){
      mappedArray.push(callback(num));
  });
  return mappedArray;
};

// let myEachTest = [1, 2, 3];
// let array = myEachTest.myMap((num)=>{
//   return num * 2;
// });

// console.log(array);

Array.prototype.myReduce = function(callback, initValue) {
  let counter = 0;
  if (initValue === undefined) {
    initValue = this[0];
    counter++;
  }

  for (counter; counter < this.length; counter++) {
    initValue += callback(this[counter]);
  }
  return initValue;
};

//
// let reduceTest = myEachTest.myReduce((num)=> {
//   return num * 1;
// });
// console.log(reduceTest);
