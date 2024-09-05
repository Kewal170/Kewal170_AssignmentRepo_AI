// What if I ask you to find a nonce for the following input -

// Dev => Karan | Rs 100
// Karan => Darsh | Rs 10

const crypto = require("crypto");

function findNonce(inputString, prefix) {
  let nonce = 0;
  let combinedString, hash;
  while (true) {
    // Combine the input string with the nonce
    combinedString = inputString + nonce;
    // Hash the combined string
    hash = crypto.createHash("sha256").update(combinedString).digest("hex");
    // Check if the hash starts with the specified prefix
    if (hash.startsWith(prefix)) {
      return { nonce, hash };
    }
    nonce++;
  }
}

// The input string based on the given data
const inputString1 = "Dev => Karan | Rs 100";
const inputString2 = "Karan => Darsh | Rs 10";

// Specify the prefix you want the hash to start with
const prefix = "00000"; // You can change this prefix as needed

const result1 = findNonce(inputString1, prefix);
console.log(`Nonce: ${result1.nonce}`);
console.log(`Hash: ${result1.hash}`);

const result2 = findNonce(inputString2, prefix);
console.log(`Nonce: ${result2.nonce}`);
console.log(`Hash: ${result2.hash}`);
