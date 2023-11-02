struct QueueManager {
    private var queue: Queue<Customer>

    init(queue: Queue<Customer> = Queue<Customer>()) {
        self.queue = queue
    }
    
    func getQueue() -> Queue<Customer> {
        return queue
    }
    
    func clearQueue() {
        queue.clear()
    }
}
