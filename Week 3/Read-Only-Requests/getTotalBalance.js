require("dotenv").config()
const { API_KEY } = process.env
const axios = require("axios")
const url = `https://eth-mainnet.g.alchemy.com/v2/${API_KEY}`

async function getTotalBalance(addresses) {
  const batch = addresses.map((addy, i) => ({
    // TODO: fill in with several JSON RPC requests
    jsonrpc: "2.0",
    id: i,
    method: "eth_getBalance",
    params: [addy],
  }))
  const response = await axios.post(url, batch)
  // use this if you want to inspect the response data!
  console.log(batch)

  // return the total balance of all the addresses
  return response.data.reduce((a, c) => a + parseInt(c.result), 0)
}

module.exports = getTotalBalance
