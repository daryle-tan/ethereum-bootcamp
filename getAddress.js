const secp = require("ethereum-cryptography/secp256k1")
const { keccak256 } = require("ethereum-cryptography/keccak")

function getAddress(publicKey) {
  const firstByte = publicKey.slice(1)
  const keccakHash = keccak256(firstByte)
  return keccakHash.slice(-20)
}

module.exports = getAddress
