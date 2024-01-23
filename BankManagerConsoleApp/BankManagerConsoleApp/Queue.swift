import Foundation

protocol Queue {
    var isEmpty: Bool { get }
    
    func enqueue()
    func dequeue()
    func clear()
    func peek()
}
