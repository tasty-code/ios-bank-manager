//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 노드 클래스: 링크드 리스트의 각 노드를 나타냄
class Node<T> {
    var value: T // // 현재 노드가 저장하는 값
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
        // 새로운 노드를 생성하고 값을 설정합니다.
        let newNode = Node(value: value)

        // 큐가 비어있을 경우
        if isEmpty() {
            // 큐의 시작과 끝 부분을 새로운 노드로 설정합니다.
            front = newNode
            rear = newNode
        } else {
            // 큐가 비어있지 않을 경우
            // 현재 끝 노드의 다음을 새로운 노드로 설정합니다.
            rear?.next = newNode

            // 큐의 끝 부분을 새로운 노드로 업데이트합니다.
            rear = newNode
        }
    }

    // 큐에서 데이터 제거 및 반환
    mutating func dequeue() -> T? {
        // 현재 큐의 맨 앞에 있는 노드를 가져옵니다.
        guard let currentFront = front else { return nil }
        // 현재 front를 다음 노드로 이동시킵니다.
        front = currentFront.next
        // 큐가 비어있다면 rear도 초기화합니다.
        if front == nil {
            rear = nil
        }
        // 제거된 데이터를 반환합니다.
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
