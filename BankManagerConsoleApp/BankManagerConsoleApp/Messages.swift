//
//  Messages.swift
//  BankManagerConsoleApp
//
//  Created by dopamint on 2/1/24.
//

enum Messages {
    case menu
    case exit
    case openBank
    case taskStart(number: Int, taskType: String)
    case taskDone(number: Int, taskType: String)
    case closeBank(customerCount: Int, totalTime: String)
    case menuError
    case numberError
}

extension Messages {
    func printMessage() {
        switch self {
        case .menu:
            print("1 : 은행계정\n2 : 종료")
            print("입력 : ", terminator: "")
        case .exit:
            print("프로그램을 종료합니다.")
        case .openBank:
            print("은행 문이 열렸습니다.")
        case .taskStart(let number, let taskType):
            print("\(number) 고객 \(taskType)업무 시작")
        case .taskDone(let number, let taskType):
            print("\(number) 고객 \(taskType)업무 종료")
        case .closeBank(let customerCount, let totalTime):
            print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerCount)명 이며, 총 업무시간은 \(totalTime)초 입니다.")
        case .menuError:
            print("올바른 메뉴를 선택해주세요.")
        case .numberError:
            print("숫자를 입력해주세요.")
        }
    }
}
