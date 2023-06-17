const ethers = require("ethers")
const { Wallet, utils } = ethers
const { wallet1 } = require("./wallets")

// TODO: replace all undefined values
const signaturePromise = wallet1.signTransaction({
  value: utils.parseEther("1", "ethers"),
  to: "0xdD0DC6FB59E100ee4fA9900c2088053bBe14DE92",
  // prefix combined with gasLimit of 21000 Wei
  gasLimit: 0x5208,
})

module.exports = signaturePromise
