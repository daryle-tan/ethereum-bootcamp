require("dotenv").config()
const { Alchemy, Network } = require("alchemy-sdk")
const { firstTopic, secondTopic } = require("./topics")
// prefix both the topics with 0x
const topics = [firstTopic(), secondTopic()].map((x) => "0x" + x)

const config = {
  apiKey: process.env.API_KEY,
  network: Network.ETH_MAINNET,
}

const alchemy = new Alchemy(config)

async function totalDaiTransferred(fromBlock, toBlock) {
  const logs = await alchemy.core.getLogs({
    address: "0x6b175474e89094c44da98b954eedeac495271d0f", // <-- TODO #1: fill in the dai address here
    fromBlock,
    toBlock,
    topics,
  })
  // let totalDaiAmount = BigInt(0);
  // for(let i = 0; i < logs.length; i++) {
  //     totalDaiAmount += BigInt(logs[i].data);
  // }
  let totalDaiAmount = logs
    .map((log) => BigInt(log.data))
    .reduce((a, c) => a + c)
  // take a look at the first log in the response
  // console.log(logs);
  // <-- TODO #2: return the total dai transferred during this timeframe
  return totalDaiAmount
}

module.exports = totalDaiTransferred
