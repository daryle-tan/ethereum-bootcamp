const SHA256 = require("crypto-js/sha256")
const TARGET_DIFFICULTY =
  BigInt(0x0fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff)
const MAX_TRANSACTIONS = 10

const mempool = []
const blocks = []

function addTransaction(transaction) {
  // TODO: add transaction to mempool
  mempool.push(transaction)
}

function mine() {
  // TODO: mine a block
  const newBlock = { id: blocks.length }

  const hash = SHA256(JSON.stringify(newBlock))
  blocks.push({ newBlock, hash })
}

module.exports = {
  TARGET_DIFFICULTY,
  MAX_TRANSACTIONS,
  addTransaction,
  mine,
  blocks,
  mempool,
}
