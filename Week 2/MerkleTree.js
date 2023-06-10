class MerkleTree {
  constructor(leaves, concat) {
    this.leaves = leaves
    this.concat = concat
  }
  getRoot(leaves = this.leaves) {
    let layer = []
    // if there is only 1 leaf node left, then that is the root node
    if (leaves.length === 1) {
      console.log("here", leaves)
      return leaves[0]
    }
    // loop through the tree and combine the leaves
    for (let i = 0; i < leaves.length; i += 2) {
      // add the pair of leaves to create a layer
      if (leaves[i + 1]) {
        layer.push(this.concat(leaves[i], leaves[i + 1]))
      } else {
        layer.push(leaves[i])
      }
    }
    // recursively call the function until there is 1 node left
    return this.getRoot(layer)
  }
}

module.exports = MerkleTree