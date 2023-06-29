require("@nomicfoundation/hardhat-toolbox")
require("dotenv").config()
// require("@nomiclabs/hardhat-waffle")

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.4",

  networks: {
    sepolia: {
      url: process.env.ALCHEMY_RPC_URL,
      accounts: [process.env.PRIVATE_KEY],
    },
  },
}

// to deploy npx hardhat run scripts/deploy.js --network <network name>
