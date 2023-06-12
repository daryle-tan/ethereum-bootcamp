const TrieNode = require("./TrieNode")

class Trie {
  constructor() {
    // root will be an instance of TrieNode that contains a null key
    this.root = new TrieNode(null)
  }

  insert(word) {
    let node = this.root

    for (let i = 0; i < word.length; i++) {
      // if the current letter is not a child of the node
      if (!node.children[word[i]]) {
        // create a child node for the root node.
        node.children[word[i]] = new TrieNode(word[i])
      }
      node = node.children[word[i]]

      if (i === word.length - 1) {
        node.isWord = true
      }
    }
    console.log(node)
  }

  contains(word) {
    let node = this.root
    for (let i = 0; i < word.length; i++) {
      if (node.children[word[i]]) {
        node = node.children[word[i]]
      } else {
        return false
      }
    }
    return node.isWord
  }
}

module.exports = Trie
