const { keccak256 } = require("ethereum-cryptography/keccak")
const { utf8ToBytes } = require("ethereum-cryptography/utils")

function hashMessage(message) {
  // convert the string message into an array of binary data
  const arrBytes = utf8ToBytes(message)
  // convert that array into a keccak256 hash
  const hash = keccak256(arrBytes)
  // return the hash
  return hash
}

module.exports = hashMessage
