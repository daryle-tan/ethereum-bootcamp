// a tree will keep track of one property: a reference to the root node
class Tree {
  constructor() {
    this.root = null
  }
  addNode(node) {
    let parent = this.root
    if (!this.root) {
      this.root = node
      //
    } else if (node.data < parent.data) {
      if (!parent.left) {
        parent.left = node
      } else {
        let newTree = new Tree()
        newTree.addNode(parent.left)
        newTree.addNode(node)
        parent.left = newTree.root
      }
    } else {
      if (!parent.right) {
        parent.right = node
      } else {
        let newTree = new Tree()
        newTree.addNode(parent.right)
        newTree.addNode(node)
        parent.right = newTree.root
      }
    }
  }
}

module.exports = Tree
