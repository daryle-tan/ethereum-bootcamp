const axios = require("axios")

// copy-paste your URL provided in your Alchemy.com dashboard
const ALCHEMY_URL =
  "https://eth-goerli.g.alchemy.com/v2/YnLNNtl_fSYkvO83uJyHmsQ9nE70wZz4"

axios
  .post(ALCHEMY_URL, {
    jsonrpc: "2.0",
    id: 1,
    method: "eth_getTransactionCount",
    params: [
      "0xb443", // block 46147
      "latest", // retrieve the full transaction object in transactions array
    ],
  })
  .then((response) => {
    console.log(response.data.result)
  })
