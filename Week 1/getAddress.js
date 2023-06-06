const secp = require("ethereum-cryptography/secp256k1")
const { keccak256 } = require("ethereum-cryptography/keccak")

function getAddress(publicKey) {
  const noFirstByte = publicKey.slice(1)
  const keccakHash = keccak256(noFirstByte)
  return keccakHash.slice(-20)
}

module.exports = getAddress
