class Transaction {
  constructor(inputUTXOs, outputUTXOs, fee) {
    ;(this.inputUTXOs = inputUTXOs), (this.outputUTXOs = outputUTXOs)
    this.fee = fee
  }
  execute() {
    const anySpent = this.inputUTXOs.some((utxo) => utxo.spent)
    if (anySpent) {
      throw new Error("We can't double spend!")
    }

    const inputAmount = this.inputUTXOs.reduce((a, c) => {
      return a + c.amount
    }, 0)
    const outputAmount = this.outputUTXOs.reduce((a, c) => {
      return a + c.amount
    }, 0)
    if (inputAmount < outputAmount) {
      throw new Error("Insufficient Funds!")
    }
    // mark the input UTXOs as spent
    this.inputUTXOs.forEach((utxo) => {
      utxo.spend()
    })

    this.fee = inputAmount - outputAmount
  }
}

module.exports = Transaction
