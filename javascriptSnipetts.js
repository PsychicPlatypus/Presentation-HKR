// Mutability vs Immutability

/**
 * This is very bad and a good way to lose your sanity
 */

const originalArray = [1, 2, 3];
const modifiedArray = originalArray;

// Modifying the modifiedArray
modifiedArray.push(4);

console.log(originalArray); // Output: [1, 2, 3, 4]
console.log(modifiedArray); // Output: [1, 2, 3, 4]

/**
 * This is better because it keeps all the ambiguity away
 */

const originalArray_ = [1, 2, 3];

const newArray_ = [...originalArray_, 4];

console.log(originalArray_); // Output: [1, 2, 3]
console.log(newArray_); // Output: [1, 2, 3, 4]

/**
 * This made me lose my mind
 */

const originalPerson = {
    name: "Alice",
    age: 30,
};

const modifiedPerson = originalPerson;

// Modifying the modifiedPerson
modifiedPerson.age = 31;

console.log(originalPerson); // Output: { name: 'Alice', age: 31 }
console.log(modifiedPerson); // Output: { name: 'Alice', age: 31 }

/**
 * ...when I was first learning JS
 */

const immutablePerson = {
    name: "Alice",
    age: 30,
};

const immutableModifiedPerson = { ...immutablePerson, age: 31 }; // Create a new object with the age changed

console.log(immutablePerson); // Output: { name: 'Alice', age: 30 }
console.log(immutableModifiedPerson); // Output: { name: 'Alice', age: 31 }

// Currying example

const add = (a) => (b) => a + b;
const result = add(1)(2);
console.log(result); // Output: 3

// Write live
function converter(unit, factor, offset) {
    offset = offset || 0;
    return (input) => `${((offset + input) * factor).toFixed(2)} ${unit}`;
}

// 1 kg = 2.2 lbs
const kgToLbs = converter("lbs", 2.2);
// 1 mile = 1.62 km
const milesToKm = converter("km", 1.62);
// 1 kg = 0.31 stone
const kgToStone = converter("stone", 0.15747, 0.1);

console.log(kgToLbs(1)); // Output: 2.20 lbs
console.log(milesToKm(1)); // Output: 1.62 km
console.log(kgToStone(1)); // Output: 0.31 stone
