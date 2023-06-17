const { providers } = require("ethers")
const { ganacheProvider } = require("./config")

const provider = new providers.Web3Provider(ganacheProvider)

/**
 * Given an ethereum address find all the addresses
 * that were sent ether from that address
 * @param {string} address - The hexadecimal address for the sender
 * @async
 * @returns {Array} all the addresses that received ether
 */
async function findEther(address) {
  // create a new array
  let addresses = []
  // create an await function that gets the block number from the provider
  const blockNumber = await provider.getBlockNumber()
  // loop through the block numbers
  for (let i = 0; i <= blockNumber; i++) {
    // create another await function gets the block with a specific transaction
    const block = await provider.getBlockWithTransactions(i)
    // use the forEach method on the block transaction
    block.transactions.forEach((tx) => {
      // if the tx from is equal to the given address
      if (tx.from === address) {
        // then add the tx to the new array
        addresses.push(tx.to)
      }
    })
  }
  // return the new array
  return addresses
}

module.exports = findEther
