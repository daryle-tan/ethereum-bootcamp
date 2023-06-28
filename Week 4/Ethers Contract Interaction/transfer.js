/**
 * Transfer funds on the contract from the current signer
 * to the friends address
 *
 * @param {ethers.Contract} contract - ethers.js contract instance
 * @param {string} friend - a string containing a hexadecimal ethereum address
 * @return {promise} a promise of the transfer transaction
 */
async function transfer(contract, friend) {
  const send = await contract.transfer(friend, 500)
  return send
}

module.exports = transfer
