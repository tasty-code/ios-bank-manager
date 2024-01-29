final class Bank {
    private var customerCount: Int
    private var customerQueue: LinkedListQueue<Customer>
    private let customerCountRange: ClosedRange<Int> = 10...30
    
    init() {
        self.customerCount = 0
        self.customerQueue = LinkedListQueue<Customer>()
    }
}

extension Bank {
    func process() {
        Message.menu.printMessage()
        Message.input.printMessage()
        
        guard let selectedMenu = selectMenu() else {
            Message.wrongInput.printMessage()
            process()
            return
        }
        
        if selectedMenu == Menu.exit.value {
            return
        }
        
    }
    
    private func selectMenu() -> Int? {
        guard let input = readLine(),
              let selectedMenu = Int(input),
              (Menu.open.value...Menu.exit.value) ~= selectedMenu else {
            return nil
        }
        return selectedMenu
    }
}
