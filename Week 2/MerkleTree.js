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
      // if the 2 consecutive leaves can be combined then
      // add the pair of leaves to create a layer
      if (leaves[i + 1]) {
        layer.push(this.concat(leaves[i], leaves[i + 1]))
        // otherwise use the left node to add to the layer
      } else {
        layer.push(leaves[i])
      }
    }
    // recursively call the function until there is 1 node left
    return this.getRoot(layer)
  }

  getProof(index, tree = this.leaves, proof = []) {
    // if there is only one layer return the proof
    if (tree.length === 1) return proof
    // create an empty object that will go into the proof > newlayer
    let item = {}
    // create a layer that we will add to the proof
    const newLayer = []

    // loop through the tree and increment by 2 and add the indexes
    for (let i = 0; i < tree.length; i += 2) {
      // if there is a leaf on the. right side then combine the left and right
      // leaves and add to the newLayer
      if (tree[i + 1]) {
        newLayer.push(this.concat(tree[i], tree[i + 1]))
        // otherwise add the current(most right) leaf to the new layer
      } else {
        newLayer.push(tree[i])
      }
    }
    // if the given index is even then data is the leaf of index + 1, left is false
    if (index % 2 === 0) {
      item.data = tree[index + 1]
      item.left = false
      // otherwise data is index the leaf of index - 1, left is true
    } else {
      item.data = tree[index - 1]
      item.left = true
    }
    // if index is equal to the last leaf index of the tree AND the length of the tree is odd
    // then recursively call the function because it is a binary tree, length must be 2
    if (index === tree.length - 1 && tree.length % 2 === 1) {
      return this.getProof(Math.floor(index / 2), newLayer, proof)
    }
    // add the item of data and left to the proof
    proof.push(item)
    // recursively call the function
    // remember to cut our index in half and round down to get the index for the next layer
    return this.getProof(Math.floor(index / 2), newLayer, proof)
  }
}

module.exports = MerkleTree