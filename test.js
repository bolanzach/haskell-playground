const sum = (a) => (b) => a + b;

console.log(sum(1)(2));

// const add10 = (x) => sum(10)(x);
const add10 = sum(10);

console.log(add10(3));
