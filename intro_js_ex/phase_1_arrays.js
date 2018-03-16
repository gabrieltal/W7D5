Array.prototype.uniq = function(){
  const uniqArray = [];
  this.forEach( (num) => {
    if(!uniqArray.includes(num))
    {
      uniqArray.push(num);
    }
  });
  return uniqArray;
};

// let array = [1, -1, 2, 3, 4, -4];
// console.log(array.uniq());

Array.prototype.twoSum = function () {
  let twoSumArray = [];
  for (var i = 0; i < this.length-1; i++) {
    for (var y = i+1; y < this.length; y++) {
      if ((this[i] + this[y] === 0) && (i !== y)) {
          twoSumArray.push([i, y]);
      }
    }
  }
  return twoSumArray;
};

// let array = [1, -1, 2, 3, 4, -4];
// console.log(array.twoSum());

Array.prototype.transpose = function() {
  let transposeArr = [];
  let counter = 0;
  while (counter < this.length) {
    transposeArr.push([]);
    counter++;
  }
  for (var i = 0; i < this.length; i++) {
    for (var y = 0; y < this.length; y++) {
      transposeArr[i][y] = this[y][i];
      }
    }
    return transposeArr;
};

// let transposeArrayTest = [
//   [1,2,3],
//   [4,5,6],
//   [7,8,9]
// ];
//
// console.log(transposeArrayTest.transpose());
