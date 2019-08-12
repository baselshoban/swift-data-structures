import UIKit

class LinkedList<T> {
    
    var head : Node<T>?
    
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
    
    func printList() {
        var node = head
        while node != nil {
            print(node!.data)
            node = node!.next
        }
    }
    
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
list.push(element: "the new Head HAHAH")
list.append(element: "I am in the middle", after: list.head!.next!)

list.printList()
