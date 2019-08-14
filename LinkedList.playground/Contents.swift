import UIKit

class LinkedList<T> {
    
    // MARK: - Properties
    var head : Node<T>?
    
    // MARK: - Adding elements
    func append(element: T) {
        let newNode = Node(data: element)
        
        guard var node = head else { head = newNode; return}
        
        while node.next != nil {
            node = node.next!
        }
        
        node.next = newNode
    }
    
    func push(element: T) {
        let newNode = Node(data: element)
        newNode.next = head
        head = newNode
    }
    
    func append(element: T, after node: Node<T>) {
        
        let newNode = Node(data: element)
        newNode.next = node.next
        node.next = newNode
    }
    
    // MARK: - Deleting elements
    func popElement() {
        head = head?.next
    }
    
    func removeElementAt(index: Int) {
        
        // prevent invalid indices
        guard index >= 0 else {return}
        
        var nodeHolder = head
        var counter = 0
        
        // check for head removal
        guard index != 0 else {nodeHolder = nodeHolder?.next; return}
        
        while nodeHolder != nil && counter < index - 1 {
            nodeHolder = nodeHolder?.next
            counter += 1
        }
        
        nodeHolder?.next = nodeHolder?.next?.next
    }
    
    // MARK: - Show list contents
    func printList() {
        var node = head
        while node != nil {
            print(node!.data)
            node = node!.next
        }
    }
    
}

// MARK: - Node Object
extension LinkedList {
    
    class Node<T> {
        var data : T
        var next : Node<T>?
        
        init(data: T) {
            self.data = data
        }
    }
    
}

var list = LinkedList<String>()

list.append(element: "The Head")
list.append(element: "second element")
//list.push(element: "the new Head HAHAH")
//list.append(element: "I am in the middle", after: list.head!.next!)

list.printList()

list.removeElementAt(index: -2)

print("\n\nAfter Update:\n")
list.printList()

list.popElement()
list.popElement()

print("\n\nAfter Update:\n")
list.printList()
