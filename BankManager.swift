import Foundation

class Node<T> {
    // class 사용이유 node의 next가 다음 node의 주소를 가리킨다. 그래서 참조 타입을 사용하는 것
    
    var data: T // 데이터 타입이 옵셔널일 이유가 있을까?
    var next: Node<T>?
    
    init(data: T, next: Node? = nil) {
        self.data = data
        self.next = next
    }
    
    deinit {
        print("\(data)끝")
    }
}

// LinkedList의 타입을 class? struct?
class LinkedList<T> {
    private var head: Node<T>? // 가장 첫 번째의 node를 가리킨다.
    //tail을 만들까? 있으면 enqueue를 할때 while을 통해서 마지막까지 보고서 넣는 것이 아니라 그냥 tail의 바로 뒤에 추가가 가능하다.
    
    // 배열을 생성 안하는 이유: 배열을 사용하면 이름만 linkedList고 실제로는 배열이다.
    
    func enqueue(data: T) {
        
        if head == nil { // head가 없다면 아무런 값이 list에 없기 때문
            head = Node(data: data)
            return
        }
        
        var node = head
        
        while node?.next != nil { // 가장 마지막 node를 찾는 과정
            node = node?.next
            
        }
        
        node?.next = Node(data: data)
       
    }
    
    func dequeue() -> Node<T>? {
        
        let outNode = head
    
        // 기존 head를 반환
        // 기존 head에서 가르키는 node가 head가 된다.
        head = head?.next
        outNode?.next = nil // nil을 꼭 넣어 줘야 하나>?
        return outNode
    } // outNode를 삭제해줘야하는거 아닌가? : dequeue시 자동으로 해제가된다. deinit으로 확인이 가능하다.
    
    func clear() {
        head = nil
    }
    // 참조를 안하기 때문에 자동으로 equeue를 했던 것들은 해제가 된다.
    
    func peek() -> T? {
    
        return head?.data
        
    }
    
    func isEmpthy() -> Bool {
        
        if head == nil {
            return true
        } else {
            return false
        }
        
    }

}
