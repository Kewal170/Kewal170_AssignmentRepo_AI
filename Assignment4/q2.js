// What if I ask you that the input string should start with devadnani26 ? How would the code change?

const crypto = require("crypto");

function findHash(prefix, baseStr) {
  let input = 0;
  let inputStr, hash;
  while (true) {
    inputStr = baseStr + input.toString();
    hash = crypto.createHash("sha256").update(inputStr).digest("hex");
    if (hash.startsWith(prefix)) {
      return { inputStr, hash };
    }
    input++;
  }
}

const res = findHash("00000", "devadnani26");
console.log(`Input: ${res.inputStr}`);
console.log(`Hash: ${res.hash}`);
