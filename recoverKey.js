const secp = require("ethereum-cryptography/secp256k1")
const hashMessage = require("./hashMessage")

async function recoverKey(message, signature, recoveryBit) {
  // hash the message
  const messageHash = hashMessage(message)
  // recover the public with the messageHash, signature, and recoveryBit
  return secp.recoverPublicKey(messageHash, signature, recoveryBit)
}

module.exports = recoverKey
