const SHA256 = require("crypto-js/sha256")

class Block {
  constructor(data) {
    this.data = data
  }
  toHash() {
    const hash = SHA256(this.data)
    return hash // a hash!
  }
}

module.exports = Block
