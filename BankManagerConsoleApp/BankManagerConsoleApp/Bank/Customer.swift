struct Customer {
    let waitingNumber: Int
    let taskTime: Double = 0.7
    
    init(waitingNumber: Int) {
        self.waitingNumber = waitingNumber
    }
}
