/**
 * Modify the `value` stored in the contract
 *
 * @param {ethers.Contract} contract - ethers.js contract instance
 * @return {promise} a promise of transaction
 */
async function setValue(contract) {
  const result = await contract.modify(1)
  return result
}

module.exports = setValue
