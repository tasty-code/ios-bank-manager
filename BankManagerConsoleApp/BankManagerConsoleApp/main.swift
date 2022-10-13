//
//  main.swift
//  BankManagerConsoleApp
//
//  Created by 정재근 on 2022/10/12.
//

import Foundation

print("1 : 은행개점")
print("2 : 종료")
print("입력 :", terminator: " ")
let input = readLine()!
let myung = Int.random(in: 10...30)
var queue = Queue<Int>()
var count = 0
var time: Double = 0.0
for i in 1...myung {
    queue.enqueue(i)
}
for i in 1...myung {
    print("\(i)번 고객 업무 시작")
    queue.dequeue()
    print("\(i)번 고객 업무 종료")
    count += 1
    time += 0.7
}
let str = String(format: "%.2f", time)
print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 10명이며, 총 업무시간은 \(str)초 입니다.")
