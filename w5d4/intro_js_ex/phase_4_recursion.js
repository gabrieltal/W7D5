let range = function(start, end) {
  if (start+1 === end ) {
    return [start, end];
  } else if (start === end) {
    return [start];
  }

  let ranged = [start];
  let s = range(start+1, end);
  return ranged.concat(s);
};
// console.log(range(1, 4));

let sumRec = function(arr) {
  if (arr.length === 1) {
    return arr[0];
  }
  let sum = arr[0];
  let s = sumRec(arr.slice(1, arr.length));
  sum += s;
  return sum;
};

// let sumRecTest = [1, 2, 3];
// console.log(sumRec(sumRecTest));

let exp1 = function(base, pow) {
  return Math.pow(base, pow);
};

let exp2 = function(base, pow) {
  if (pow === 0) {
    return 1;
  } else if (pow === 1) {
    return base;
  }
  let sum = base;
  if (pow % 2 === 0) {
    sum = exp2(base, pow/2);
    sum = Math.pow(sum, 2);
  } else {
    sum = base * (Math.pow(exp2(base, (pow-1)/2), 2));
  }
  return sum;
};
Array.prototype.methodName = function () {

};
// let test1 = exp1(2, 3);
// let test2 = exp2(2, 3);
// console.log(test1);
// console.log(test2);

let fibonacci = function(n) {
  if(n === 1){
    return [0, 1];
  }
  else if ( n === 0 ){
    return [0];
  }
  let fib2 = fibonacci(n-2);
  let fib = fibonacci(n-1);
  let result = fib[fib.length-1] + fib2[fib2.length-1];

  let sum = fibonacci(n-1).concat([result]);
  return sum;

};

// console.log(fibonacci(6));

let deepDup = function(arr) {
  let dupArray = [];

  arr.forEach( (num) => {
    console.log(num);
    if(Array.isArray(num)){
      dupArray.push(deepDup(num));
    }
    else{
      dupArray.push(num);
    }
  });

  return dupArray;
};
//
// console.log(deepDup([1,[1,5,6],8,7]));
let bsearch = function(arr, target) {
  if (arr.length === 0) {
    return -1;
  }
  let mid = Math.floor(arr.length / 2);

  if (arr[mid] === target) {
    return mid;
  } else if (arr[mid] > target) {
    return bsearch(arr.slice(0, mid), target);
  } else {
    let res = bsearch(arr.slice(mid+1, arr.length), target);
    return (res === -1) ? -1 : mid + res + 1;
  }
};

// console.log(bsearch([1, 2, 3, 4, 5], 2));

let mergesort = function(arr){
  if(arr.length === 1){
    return arr;
  }

  let mid = Math.floor(arr.length / 2);
  return merg(mergesort(arr.slice(0, mid)), mergesort(arr.slice(mid, arr.length)));
};

function merg(arrLeft, arrRight ){
  console.log(arrRight, arrLeft);
  let result = [];
  while( arrLeft.length !== 0 || arrRight.length !== 0){
    if(arrLeft[0] < arrRight[0]){
      result.push(arrLeft.shift());
    }
    else {
      result.push(arrRight.shift());
    }
  }

  return result.concat(arrLeft).concat(arrRight);
}

console.log(mergesort([4, 6, 1, 90, 12, 35, 76, 2]));
