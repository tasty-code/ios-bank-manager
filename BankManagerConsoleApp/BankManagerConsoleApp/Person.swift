final class Person<T> {
    let data: T
    var next: Person<T>?
    
    init(data: T, next: Person<T>? = nil) {
        self.data = data
        self.next = next
    }
}
