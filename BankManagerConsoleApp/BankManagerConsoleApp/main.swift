let banker = Banker()
let bank = Bank(banker: banker)
let bankManager = BankManager(bank: bank)

bankManager.openBank()
