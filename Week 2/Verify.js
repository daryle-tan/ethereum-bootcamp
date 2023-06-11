function verifyProof(proof, node, root, concat) {
  for (let i = 0; i < proof.length; i++) {
    // if current proof element is left
    // assign node to the combination of current node to given node
    if (proof[i].left) {
      node = concat(proof[i].data, node)
      // otherwise assign node to the combination of given node to current node
    } else {
      node = concat(node, proof[i].data)
    }
  }
  return node === root
}

module.exports = verifyProof
