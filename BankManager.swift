//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 노드 클래스: 링크드 리스트의 각 노드를 나타냄
class Node<T> {
    var value: T
    var next: Node? // 다음 노드를 가리키는 포인터

    init(value: T) {
        self.value = value 
    }
}

// 큐 구조체: Enqueue, Dequeue, Peek, isEmpty, Clear 큐 동작을 구현
struct Queue<T> {
    private var front: Node<T>? // 큐의 시작 부분을 나타내는 포인터
    private var rear: Node<T>? // 큐의 끝 부분을 나타내는 포인터

    // 큐에 데이터 추가
    mutating func enqueue(_ value: T) {
        let newNode = Node(value: value)
        if isEmpty() {
            front = newNode
            rear = newNode
        } else {
            rear?.next = newNode
            rear = newNode
        }
    }

    // 큐에서 데이터 제거 및 반환
    mutating func dequeue() -> T? {
        guard let currentFront = front else { return nil }
        front = currentFront.next
        if front == nil {
            rear = nil
        }
        return currentFront.value
    }

    // 큐의 맨 앞에 있는 데이터 반환 (제거하지 않음)
    func peek() -> T? {
        return front?.value
    }

    // 큐가 비어있는지 확인
    func isEmpty() -> Bool {
        return front == nil
    }

    // 큐 비우기
    mutating func clear() {
        front = nil
        rear = nil
    }
}
