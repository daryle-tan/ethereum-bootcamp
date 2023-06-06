const secp = require("ethereum-cryptography/secp256k1")
const { keccak256 } = require("ethereum-cryptography/keccak")

function getAddress(publicKey) {
  // the first byte ensures the public key is in compressed form
  const publicKeyArr = publicKey.slice(1)
  // keccak hash the rest of the public key
  const keccakHash = keccak256(publicKeyArr)
  // return the last 20 bytes of the keccak hash
  return keccakHash.slice(-20)
}

module.exports = getAddress
