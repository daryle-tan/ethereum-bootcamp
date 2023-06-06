class Transaction {
  constructor(inputUTXOs, outputUTXOs) {
    ;(this.inputUTXOs = inputUTXOs), (this.outputUTXOs = outputUTXOs)
  }
  execute() {
    const anySpent = this.inputUTXOs.some((utxo) => utxo.spent)
    if (anySpent) {
      throw new Error("We can't double spend!")
    }
  }
}

module.exports = Transaction
