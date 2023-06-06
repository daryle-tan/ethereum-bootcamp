const Block = require("./Block")

class Blockchain {
  constructor() {
    // no block being added to the blockchain
    this.chain = [new Block()]
  }

  addBlock(newBlock) {
    // previous Hash is added to the current block
    newBlock.previousHash = this.chain[this.chain.length - 1].toHash()
    this.chain.push(newBlock)
  }

  isValid() {
    // checks if the previous Hash in the current block is equal to the previous hash in the block before
    for (let i = this.chain.length - 1; i > 0; i--) {
      let block = this.chain[i]
      let previous = this.chain[i - 1]
      if (block.previousHash.toString() !== previous.toHash().toString()) {
        return false
      }
    }
    return true
  }
}

module.exports = Blockchain
