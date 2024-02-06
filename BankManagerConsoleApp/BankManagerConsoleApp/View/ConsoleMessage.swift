//
//  ConsoleMessage.swift
//  BankManagerConsoleApp
//
//  Created by Doyoung An on 1/30/24.
//

/// 뷰에 해당하는 콘솔 메시지를 관리
struct ConsoleMessage {
    
    /// 은행 메뉴 메세지
    func bankMenu() {
        print("1 : 은행 개점 \n2 : 종료")
        print("입력: ", terminator: "")
    }
    
    /// 사용자 입력 오류 메시지
    func inputErrorMessage() {
        print("잘못된 입력입니다.")
    }
    
    /// 프로그램 종료 메시지
    func appExitMessage() {
        print("프로그램을 종료합니다.")
    }
    
    /// 고객 업무 시작 메시지
    func taskStartMessage(customerNumber: Int, task: String) {
        print("\(customerNumber)번 고객 \(task)업무 시작")
    }
    
    /// 고객 업무 완료 메시지
    func taskEndMessage(customerNumber: Int, task: String) {
        print("\(customerNumber)번 고객 \(task)업무 완료")
    }
    
    /// 은행 마감 메시지
    func bankClosingMessage(totalCustomers: Int, time: Double) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomers)명이며, 총 업무시간은 \(String(format: "%.2f", time))초입니다.")
    }
}
