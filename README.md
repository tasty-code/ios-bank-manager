# ios-bank-manager


[1. Team Introduce](#-team-blust3r-)

[2. Ground Rules](#-ground-rules)

[3. 순서도](#순서도)

[4. UML](#uml)

[5. 객체의 역할](#-객체의-역할과-책임)

[6. 학습키워드 및 학습내용](#-학습-키워드-및-학습-내용)

[7. STEP별 구현내용](#-step별-구현-내용)

[8. 트러블 슈팅](#-트러블-슈팅)

[9. 질문과 답변](#-질문과-답변)

</br>

## 💫 Team BLUST3R 💫
🏃🏻🏃🏻‍♂️💨 **프로젝트 기간:** `23.02.20` ~ `23.03.10`

|<img src="https://avatars.githubusercontent.com/u/71758542?v=4" width=200>|<img src="https://avatars.githubusercontent.com/u/45708630?v=4" width=200>|
|:---:|:---:|
|[Blu](https://github.com/bomyuniverse)|[Lust3r](https://github.com/llimental)|

<br>

## ⛳ Ground Rules

- 커밋 규칙
    - ✨ **Git Commit Convention**
        - Prefix 전체 소문자, **`[prefix]`**
        - `feat` = 주로 사용자에게 새로운 기능이 추가되는 경우
        - `fix` = 사용자가 사용하는 부분에서 bug가 수정되는 경우
        - `docs` = 문서에 변경 사항이 있는 경우
        - `style` = 세미콜론을 까먹어서 추가하는 것 같이 형식적인 부분을 다루는 경우 (코드의 변화가 생산적인 것이 아닌 경우)
        - `refactor` = production code를 수정하는 경우 (변수의 네이밍을 수정하는 경우)
        - `test` = 테스트 코드를 수정하거나, 추가하는 경우 (코드의 변화가 생산적인 것이 아닌 경우)
        - `chore` = 별로 중요하지 않은 일을 수정하는 경우 (코드의 변화가 생산적인 것이 아닌 경우)
        - +) `design` = UI 디자인을 변경했을 때
- 매 정각 15분 휴식
- STEP 진행도보다 프로젝트 이해, 학습을 위주로
- class, struct, enum 에서는 첫 줄 공백, func는 공백 없이 바로 코드 작성
- 코드가 없는 줄은 여백 없이
- 객체지향 체조 원칙에서 꼭 지킬 항목
    - 3) 모든 원시 값과 문자열을 포장합니다
    - 7) 3개 이상의 스위프트 기본 데이터 타입(Int, String, Double 등) 프로퍼티를 가진 타입을 구현하지 않습니다.
    - `?` 9) getter/setter를 구현하지 않습니다

<br>

## 순서도

<br>

## UML

<br>

## 🔍 객체의 역할과 책임

| 객체 | 타입 | 역할과 책임 |
| --- | --- | --- |
|BankManager|`class`|시스템 메뉴를 보여주고, 입력값에 따른 메뉴 분기를 하는 기능을 가짐|
|Node|`class`|각 Customer의 정보와 다음 Customer의 정보를 가짐|
|LinkedList|`class`|Customer Node를 가지고 만든 LinkedList|
|LinkedQueue|`class`|대기열로 기능할 수 있도록 LinkedList를 채택 후 기능 구현|
|Customer|`struct`|은행에 방문한 고객 객체. 대기번호와 WorkType을 가짐|
|Banker|`struct`|Customer의 대기번호를 받고, 업무를 처리하는 객체|
|Bank|`struct`|비동기 프로그래밍을 통해 멀티 스레드로 Banker를 이용, Customer의 업무를 처리하는 객체 |
|BankerProtocol|`protocol`|Banker 객체가 채택하는 프로토콜로, work시 출력할 메세지를 반환하는 기능을 가짐|
|UserInputReceivable|`protocol`|콘솔 기준으로 이용자의 메뉴 입력을 받기 위한 기능을 가짐|
|CustomerManageable|`protocol`|임의의 고객의 수와 임의의 WorkType을 메서드를 통해 얻어 customerQueue를 만드는 기능을 가짐|
|SystemMenu|`enum`|은행 개점과 종료의 메뉴를 보여주는 기능을 가짐|
|WorkList|`enum`|Customer의 WorkType을 가지는 enum 객체|

<br>

## 📚 학습 키워드 및 학습 내용
### 1. Linked-list
- 노드가 데이터와 포인터를 가지고 한 줄로 연결되어있는 방식으로 데이터를 저장하는 자료구조
- 포인터가 다음이나 이전 노드와의 연결을 담당
- 종류: 단일 연결리스트, 이중 연결리스트, 원형 연결리스트
- 장점: 자료의 추가와 삭제가 $O(1)$의 시간복잡도를 가짐
- 단점: 배열, 트리구조와 달리 특정 위치의 데이터를 검색하는 데에는 $O(n)$의 시간이 걸림

### 2. Queue
- 먼저 집어넣은 데이터가 먼저 나오는 FIFO구조
- 종류: 선형 큐, 환형 큐, 링크드 큐
- 프로젝트상 요구기능 분석
- Enqueue: queue에 값을 추가
- Dequeue: head를 queue에서 제거하고 값을 반환
- Clear: queue에 있는 모든 값을 제거
- Peek: dequeue와 다르게 queue에서 제거하지 않고 head의 값만 반환
- isEmpty: queue가 비어있는지 확인

### 3. Generics
- 타입에 의존하지 않는 범용 코드를 작성할 때 사용
- 서로 다른 Type을 Parameter로 받아 진행할 때, 코드의 재사용성을 높임
- 제네릭 함수
    - 함수 이름 뒤에 `<제네릭타입이름>`을 선언해 주면 해당 이름을 타입처럼 사용할 수 있음
    - `<T>`의 경우 T를 Type Parameter라고 부르는데, 이는 새로운 형식이 생성되는 것이 아니라 실제 함수가 호출될 때 해당 매개변수의 타입으로 대체되는 Placeholder 역할
    - 타입 파라미터의 경우 가독성을 위해 T나 V같은 단일문자, 혹은 Upper Camel Case를 사용

### 4. Unit Test
- 테스트 코드를 작성하는 이유
    - 코드의 안정성을 높일 수 있음
    - 유지보수에 유리함
    - 스펙을 문서화할 수도 있음
    - 깔끔한 코드를 작성할 수 있음

### 5. 재귀함수, 꼬리재귀함수
- 재귀함수
    - 함수 내에서 해당 함수를 호출하는 것
    - 스택에 함수 호출을 하나씩 쌓고 거꾸로 반환 값을 넘기며 계산을 수행
    - 필수 요소: 함수 탈줄 초건, 함수 호출, 리턴 값
    - 대표적인 예: 팩토리얼
    - 단점: 값이 커서 함수 호출을 아주 많이 해야 할 경우 stack overflow 발생
- 꼬리재귀함수
    - 함수를 호출하면서 스택을 재사용하는 것
    - 스택을 재사용하기 때문에 메모리를 아낄 수 있음
    - 컴파일 시점보다 런타임 시점에 이득을 얻음
    - 일반적인 재귀함수의 단점인 stack overflow를 방지할 수 있는 함수
    - return에 함수 호출 이외에 다른 연산자가 붙지 않는 경우에 적용
- 재귀 함수와 반복문의 장단점 비교
    ||재귀 함수|반복문|
    |:---:|:---:|:---:|
    |👍 **장점**|상대적으로 코드가 간결|상대적으로 속도가 빠름|
    |👎 **단점**|메모리를 많이 사용, 상대적으로 속도가 느림|상대적으로 복잡한 코드|

### 6. 값 타입, 참조 타입
- `Struct`
    - 값 타입: 데이터를 전달할 때 값을 복사하여 전달
    - 상속 불가
    - Swift 대부분의 큰 뼈대는 모두 구조체로 구성
- `Class`
    - 참조 타입: 데이터를 전달할 때 값의 메모리 위치를 전달
    - 단일 상속
    - Apple 프레임워크 대부분의 큰 뼈대는 모두 클래스로 구성
- **구조체와 클래스 중 어떤 것을 사용해야 할까?** (출처: [Apple 공식문서](https://developer.apple.com/documentation/swift/choosing-between-structures-and-classes))
    - 프로젝트의 성격과 데이터의 활용도에 따라 선택해서 사용함
    - 기본적으로 구조체를 사용
    - Objective-C와 상호 운용성이 필요한 경우 클래스 사용
    - 모델링 중인 데이터의 ID를 제어해야 하는 경우 클래스 사용
    - 프로토콜과 함께 구현체를 공유하여 행동을 채택하는 경우 구조체를 사용
    - 다음 조건 중 하나 이상에 해당한다면 구조체를 사용할 것을 권장
        - 연관된 값의 집합을 캡슐화하는 것만이 목적일 때
        - 캡슐화한 값을 참조하는 것보다 복사하는 것이 합당할 때
        - 구조체에 저장된 프로퍼티가 값 타입이며 참조하는 것보다 복사하는 것이 합당할 때
        - 다른 타입으로부터 상속받거나 자신을 상속할 필요가 없을 때

</br>

## 🔨 STEP별 구현 내용

### STEP 1
- **큐 타입 구현**
    - 은행에 도착한 고객이 임시로 대기할 대기열(Queue) 타입 직접 구현
    - Queue 타입 구현을 위한 Linked-list 타입 직접 구현
    - Queue 타입이 다양한 타입의 데이터를 처리할 수 있도록 Generics 기능 활용
    - Unit Test를 통한 Queue 타입의 기능 검증
    - 필수 구현 기능
        - `Enqueue`, `Dequeue`, `Clear`, `Peek`, `isEmpty`
- 🗝️ keyword: `Linked-list`, `Queue`, `Generics`, `Unit Test`
- [STEP 1 PR 🔗](https://github.com/tasty-code/ios-bank-manager/pull/13)

### STEP 2
- **타입 구현 및 콘솔앱 구현**
    - 은행/고객 타입 구현
        - n명의 은행원이 근무
        - n명의 고객이 업무 처리를 위해 대기
        - 모든 고객의 업무가 끝나면 은행 업무를 마감, 마감 시 처리한 고객 수, 총 업무시간 출력
        - 은행원은 한 번에 한 고객의 업무를 처리
        - 각 고객의 업무 처리 시간: 0.7초
        - 고객의 업무 처리 시작 시 고객 번호와 함께 안내 메세지 출력
        - 고객의 업무 처리 완료 시 고객 번호와 함께 안내 메세지 출력
        - 해당 타입 외 자유롭게 구현 가능
    - 콘솔앱 구현
        - Step2에서는 한 명의 은행원이 근무
        - 앱 실행 시 메뉴 출력
        - 개점 메뉴 선택 시 10~30 범위 내의 고객 대기열 생성
        - 고객의 업무를 모두 처리하면 마감 메세지 출력 후 다시 메뉴 출력
        - 종료 메뉴를 선택하면 프로그램 종료
- 🗝️ keyword: `재귀함수`, `꼬리재귀함수`, `값 타입`, `참조 타입`
- [STEP 2 PR 🔗](https://github.com/tasty-code/ios-bank-manager/pull/20)

### STEP 3
- **다중처리**
    - Step 3의 은행에는 3명의 은행원이 근무
        - 2명은 예금업무, 1명은 대출업무 처리
    - 고객의 업무 종류는 고객 생성 시 임의로 지정
    - 업무에 따른 소요시간
        - 대출: 1.1초
        - 예금: 0.7초
    - 고객 업무 시작/완료 시 안내 메세지에 고객 대기번호와 함께 업무도 함께 출력
- 🗝️ keyword: `Concurrency`, `Thread`, `Sync/Async`, `추상화`, `일반화`
- [STEP 3 PR 🔗]()

### STEP 4
- **UI 구현**
    - 코드만 사용하여 구현
    - 고객 정보를 표현할 커스텀 뷰 구현
        - 고객 정보: 고객 번호, 업무 종류
    - 대기열은 StackView 활용
        - 화면 전체를 여러개의 스택뷰로 구성
    - 화면 구성
        - 업무중인 고객 리스트, 대기중인 고객 리스트, 업무시간 타이머, 고객 10명 추가 버튼, 초기화 버튼
    - 고객 10명 추가 버튼을 누르면 임의의 고객 10명 추가
    - 초기화 버튼을 누르면 대기중인 고객과 타이머 모두 초기화
    - 대기중인 고객이 없으면 타이머가 멈춤
    - 고객이 추가되어 다시 업무를 실행하면 타이머가 동작
        - 초기화 전까지 업무시간은 초기화되지 않고 누적
- 🗝️ keyword: `Code-base`, `StackView`
- [STEP 4 PR 🔗]()

</br>

## 🚀 트러블 슈팅

### 1. Console App의 Unit Test Target 추가
- Unit Test를 위해 프로젝트에서 New Unit Test Target으로 Test Unit을 추가하고 코드를 작성했습니다. 그런데 `@testable import BankManagerConsoleApp` 을 했음에도 `undefined symbol` 오류가 발생하였습니다.
이유를 찾아본 결과 Application(iOS) 프로젝트의 경우에는 target으로 프로젝트를 선택하여 진행할 수 있지만, command line 프로젝트는 선택할 수 없어 테스트하고자 하는 파일에서 Test Unit에 `target membership`을 설정해 주어야 했습니다.
테스트를 진행하고자 하는 코드가 있는 LinkedList.swift, LinkedQueue.swift 파일에서 Test Unit을 `target membership`에서 설정해준 후 문제를 해결할 수 있었습니다.
  

### 2. Queue를 Linked-list로 구현 시의 시간복잡도

- STEP 1이 공개된 후 학습해야 할 키워드를 추출하고, 개인적으로 학습하는 것을 우선으로 진행하였습니다. 그리고 코드 이해도를 위하여 각자 `LinkedQueue`(Linked-list로 구현된 Queue)를 구현해본 후 서로의 코드에 대해 질문하고 논의해 보았습니다.    
논의한 내용을 바탕으로 추가로 이해가 필요한 부분에 대해 함께 학습하고, 기존에 작성한 코드를 전부 삭제한 후 짝 프로그래밍으로 코드를 작성하였습니다.
    - 👨🏻‍💻 **Lust3r's Code (단방향 Linked-list)**
        ```swift
        func enqueue(data: T) {
            var head: Node<T>?
            var node = head

            if head == nil {
                head = Node(data: data)

                return
            }

            while node.next != nil {
                node = node.next
            }
            node.next = Node(data: data)
        }
        ```
    - 💙 **Blue's Code (단방향 Linked-list + rear 프로퍼티)**
        ```swift
        // LinkedQueue의 enqueue
        mutating func enqueue(data: T) {
            nodes.append(data)
        }

        // LinkedList의 append 기능
        mutating func append(_ data: T) {
            let newNode = Node(data: data)

            count += 1

            if head == nil {
                head = newNode
                tail = head

                return
            }

            tail?.next = newNode
            tail = newNode
        }
        ```
- 단방향 Linked-list만 사용한 첫 번째 코드는 `rear`(제일 나중에 추가된 노드를 확인하는)프로퍼티가 없어서 `while` 반복문을 사용하여 노드의 `next`가 `nil`이 될 때까지 탐색하는 코드라서 시간복잡도가 $O(n)$이 될 것이라 판단하였습니다.
시간복잡도가 $O(n)$이 된다면, 자료의 추가와 삭제가 $O(1)$의 시간복잡도를 가진다는 Linked-list의 장점이 사라진다고 생각하여 논의 후 새로운 코드를 작성 시 시간복잡도가 $O(1)$이 될 수 있도록 작성해 보았습니다.

### 3. Queue 연결 타입 문제 해결
- 처음 customerQueue에 customer의 수(random)만큼 `enqueue`를 해줄 때, `Node<Customer>`를 넣어줬기 때문에 디버깅 과정에서 head와 node가 각각 data와 next를 갖고 있는 문제가 있었습니다.
넣어줘야 하는 데이터 타입에 대해 다시 고민했고, enqueue 자체가 Node를 Queue에 넣어주는 것이기 때문에 value에 데이터 타입인 Customer를 넣어주면 된다는 결론을 낼 수 있었습니다.
그렇게 해서 다음과 같은 코드를 구현하여 enqueue 작업을 정상적으로 할 수 있었습니다.
    ```swift
    for waitingNumber in 1...maxCount {
        customerQueue.enqueue(value: Customer(waitingOrder: waitingNumber))
    }
    ```

### 4. 메뉴 반복 문제 해결
- 메인 메뉴를 어떻게 반복을 할까 고민을 하다 while 반복문으로 감싸는 것 대신 재귀함수를 사용하여 메뉴를 출력하고 수행하는 메서드를 불러오면 되겠다는 생각을 했습니다.
결과값에 함수 출력만 있는 꼬리재귀로 코드의 간결화는 물론 재귀함수에 비해 안정성을 높일 수 있었습니다.
    ```swift
    switch SystemMenu(rawValue: userInput) {
        case .open:
            bank.open()
            return execute()
        case .close:
            break
        case .none:
            break
    }
    ```

### 5. Bankmanager 역할 분리
- 기존에는 main에서 BankManager의 `startBusiness()` 메서드만 호출하고, BankManager가 모든 일을 처리했습니다.
그러나 기술명세상에서는 은행원이 고객의 일을 처리해야 하고, 은행 타입 구현이 명시되어 있어 분리를 하게 되었습니다.
최종적으로 Bank 타입을 구현하면서 BankManager는 전체적인 반복되는 업무 틀만 관리하는 역할을 하고, Bank는 CustomerQueue를 생성하여 큐 내부에 존재하는 고객의 대기번호를 은행원에게 전달하여 일을 처리할 수 있는 역할을 합니다.

</br>

## 🙋🏻 질문과 답변
### 1. 전반적인 네이밍
- 최대한 실제 상황에 맞게, API 가이드라인에 맞춰 네이밍을 수정하였습니다.
혹시 네이밍만 보고 역할을 파악하기 어려운 것이 있다면 코멘트 부탁드립니다!
코멘트 주신 부분에 대해서 더 고민해보고 수정하도록 하겠습니다.

    > **리뷰어 🍿콘(@protocorn93)의 의견**
    >
    > 음~ 저는 뭐 이런 네이밍도 크게 나쁘다고 생각이 들진 않아요. 물론 어느정도 역할을 유추할 수 있는 네이밍이 들어가면 좋죠! 이런 경우에는 Value 와 같은 네이밍을 사용할 것 같아요. 변수도 data보단 value가 더 어울리는 것 같구요.


### 2. `usleep()` vs `Thread.sleep()`
- 처음에는 `usleep()`에 시간을 주어 0.7초를 지연시켰습니다. 하지만 `rawValue` 그대로 입력하여 메세지 출력간 delay를 주는 것보다 현재 Step에서는 main 스레드에서만 작업이 진행되고 있기 때문에(한 명의 은행원이 customer queue를 담당) customer 한 명이 은행원과 업무를 보는 동안에는 다른 customer는 대기를 해야하는 상황이 main 스레드의 동기적 처리와 비슷하다고 판단하였습니다.
그래서 `Thread`의 `sleep` 기능을 활용하여 은행원이 갖고 있는 `processingTime`을 파라미터로 메세지 출력간 delay를 주는 방식을 사용하게 되었습니다.

    > **리뷰어 🍿콘(@protocorn93)의 의견**
    >
    > LinkedList와 LinkedQueue는 사실 엄연히 다른 객체라고 봐요. LinkedQueue가 LinkedList를 활용할 뿐이죠. LinkedQueue가 내부적으로 다른 형태의 LinkedList를 사용할 수도 있어요.

### 3. Generic Type 사용 시 Type Parameter 네이밍 질문
- Generic 타입 사용 시 Type Parameter의 경우 가독성을 위해 T나 V같은 단일문자, 혹은 Upper Camel Case를 사용하는 것으로 학습하였고, 저희는 T를 사용하였습니다.    
하지만 위와 같은 네이밍을 피하고 명확히 작성해야 한다는 의견도 있어 Type Parameter를 사용할 때 네이밍을 어떻게 하면 좋을지 궁금합니다!

    > **리뷰어 🍿콘(@protocorn93)의 의견**
    >
    > 네이밍이 너무 모호해요. 추상화를 학습하고 연습하시다보니 이렇게 너무 많은것을 축약해버린 것 같기도 해요. 그리고 추상화를 진행하는 이유에 대해서도 고민해볼 필요가 있어요.

### 4. Unit Test 진행 시 중복되는 기능에 대한 질문
- 현재 저희가 작성한 코드에서는 `LinkedQueue`의 메서드들이 `LinkedList`의 메서드와 프로퍼티로 구성되어 있습니다. 더 포괄적인 객체인 `LinkedQueue`를 테스트하면 `LinkedList` 또한 테스트가 진행된다고 생각하였습니다.    
혹시 저희 코드처럼 한 객체가 다른 객체의 기능을 활용하는 경우 테스트 케이스가 중복될 위험이 있더라도 각각 Unit Test를 진행해 주는 것이 좋을까요?
(**LinkedList**: `append()`, `removeFirst()`)
(**LinkedQueue**: `enqueue(data:)`, `dequeue()`)

    > **리뷰어 🍿콘(@protocorn93)의 의견**
    >
    > 이 두 선택지에서 현재 프로그램에서 무엇을 사용하는지는 딱히 크게 중요한 것 같지는 않아요. 두 분이 말씀해주신 의도대로 Thread.sleep이 좀 더 편리해보이긴 해요!
