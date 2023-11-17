# 🏦 은행창구 관리 앱
고객이 랜덤으로 생성되어 3명의 은행원이 동시에 업무를 처리하는 앱입니다.

## 👨🏻‍💻 프로젝트 참여자
|SwainYun|COMDORI|
|:--:|:--:|
|<img src="https://avatars.githubusercontent.com/u/99116619?v=4" width=200>|<img src="https://avatars.githubusercontent.com/u/22284092?v=4" width=200>|


## 📆 프로젝트 기간
> 2023.10.30. ~ 2023.11.17.

<br>

## 🍀 프로젝트 핵심사항
- [x] Linked-list 자료구조의 이해 및 구현
- [x] Queue 자료구조의 이해 및 구현
- [x] Generic 개념 이해 및 적용
- [x] 타입 추상화 및 일반화
- [x] 동시성 프로그래밍과 기반기술(GCD 등)의 이해
- [x] Thread 개념에 대한 이해
- [x] 동시성 프로그래밍 중 UI 요소 업데이트의 주의점 이해
- [x] 커스텀 뷰 구현과 StackView 활용
- [x] Xcode 프로젝트 관리 구조의 이해와 응용


## 📸 스크린샷
|콘솔|UI Ver|
|:--:|:--:|
|<img src="https://hackmd.io/_uploads/HJfHYBNV6.png" width=300 height=650>|<img src="https://hackmd.io/_uploads/HyfukXmVT.gif" width=300>|


## 🎋 프로젝트 디렉토리 구조
```
ios-bank-manager
├── BankManager.swift
├── BankManagerConsoleApp
│   ├── BankManagerConsoleApp
│   │   ├── DataStructure
│   │   │   ├── LinkedList.swift
│   │   │   └── Queue.swift
│   │   ├── Models
│   │   │   ├── Customer.swift
│   │   │   ├── InterfaceMenu.swift
│   │   │   ├── Teller.swift
│   │   │   └── WorkType.swift
│   │   ├── Namespace
│   │   │   └── InterfaceMessage.swift
│   │   └── main.swift
│   └── BankManagerConsoleAppTests
│       └── BankManagerConsoleAppTests.swift
├── BankManagerUIApp
│   ├── BankManagerUIApp
│   │   ├── AppDelegate.swift
│   │   ├── Assets.xcassets
│   │   │   ├── AccentColor.colorset
│   │   │   │   └── Contents.json
│   │   │   ├── AppIcon.appiconset
│   │   │   │   └── Contents.json
│   │   │   └── Contents.json
│   │   ├── Base.lproj
│   │   │   └── LaunchScreen.storyboard
│   │   ├── Extensions
│   │   │   └── UIViewComponentsConvenienceInitializers.swift
│   │   ├── Info.plist
│   │   ├── SceneDelegate.swift
│   │   ├── Utilities
│   │   │   ├── Bank.swift
│   │   │   └── BankTimer.swift
│   │   ├── ViewController.swift
│   │   └── Views
│   │       └── CustomerLabel.swift
│   ├── BankManagerUIAppTests
│   │   ├── BankManagerUIAppTests.swift
│   │   └── Info.plist
│   └── BankManagerUIAppUITests
│       ├── BankManagerUIAppUITests.swift
│       └── Info.plist
└── README.md
```

## 🚀 트러블 슈팅

- **Console App의 Unit Test 불러오기 오류** 
> Unit Test를 위해 프로젝트에서 `New Unit Test Target`으로 `Test Unit`을 추가하고 테스트할 코드를 작성했습니다. 그런데 `@testable import BankManagerConsoleApp` 을 했음에도 `undefined symbol` 오류가 발생하였습니다. 해결하려고 스키마 설정에서 `Executable`을 `Test Unit`앱 으로 설정해주고, `Queue.swift`,`LinkedList.swift` 파일의 `target membership` 설정해주고서야 테스트가 완료되었습니다.

- **StackView 동적 관리**
```swift
func removeArrangedSubviews(_ views: [UIView]) {
    views.forEach {
        self.removeArrangedSubview($0)
        $0.removeFromSuperview()
    }
}
```
> `removeArrangedSubview()` 메서드는 스택 뷰 배열에서 제거하는 메서드이다. 이 메서드는 뷰 계층 구조 상에서도 요소를 제거해주는 것은 아니기 때문에 스택 뷰 배열에서 제거해주었더라도 메모리에 살아있기 때문에 뷰 요소에 접근할 수 있다.
> 따라서 `removeFromSuperview()` 메서드를 호출해서 뷰 계층 구조와의 링크를 해제해주어야 비로소 메모리에서 제거되고 화면에 보이지 않게 된다.

- **UI 렌더링 부하**
> UI를 그리는 작업은 메인스레드에서 동작한다.
> 다른 작업이 메인스레드에 던져질 때 UI를 그리는 작업이 다른 작업에 우선순위가 밀려서 UI 렌더링이 끊기거나 특히 고객 수가 많아지면 스크롤, Label 노출 등의 작업이 버벅이는 현상이 발생했다.
> 이를 메인스레드에서 async하게 처리하게 되면 작업의 종료와 관계없이 메인스레드는 다른 일을 보내고 있을 것이므로 이를 해결할 수 있었다.

- **은행원 업무 동시적으로 작동안함**
> Global() 큐를 여러개 만들면 큐가 여러개 생겨서 동작하는 줄 알았지만 프로젝트를 진행하면서 알게된점이 큐1개에 여러 Task가 enqueue방식으로 쌓여서 dequeue 할때 동시적으로 나가는것을 알게되었습니다. 그러므로 커스텀큐를 여러개 만들 필요가 없어짐을 깨달았다.

- **고객 업무 처리가 Concurrent한 환경임에도 Serial하게 동작하는 버그에 대하여**
> ConCurrent 환경에서 async로 전달한 작업이면 업무 시작과 종료가 고객 dequeue 순서와는 관련없이 이루어질 것으로 예상했으나 Serial하게 동작하는 버그가 있었다.
```swift
final class Bank {
    // 생략...
    
    func work(completion: @escaping () -> Void) {
        gatherCustomers()
        
        tellers.forEach { teller in
            DispatchQueue.global().async(group: dispatchGroup) { [self] in
                while customerQueue.isEmpty == false {
                    semaphore.wait()
                    guard let customer = customerQueue.peek(), customer.workType == teller.workType else {
                        semaphore.signal()
                        continue
                    }
                    
                    guard let customer = customerQueue.dequeue() else { return }
                    
                    semaphore.signal()
                    
                    teller.service(to: customer) { [self] in
                        servicedCustomersCount += 1
                        totalServicedTimes += customer.workType.timeCost
                    }
                }
            }
        }
        
        dispatchGroup.wait()
        InterfaceMessage.printBankDidClose(servicedCustomersCount: servicedCustomersCount, totalServicedTimes: totalServicedTimes)
        completion()
    }
}
```
> 확인해보니 `guard let customer = customerQueue.peek()` 코드 구간에서 많은 비율로 WorkType 비교에 실패하고 있었고 Thread explosion 현상도 같이 발생했다.
```swift
extension LinkedList: QueueProtocol {
    // 생략...
    
    func peek() -> Value? {
        return self.tail?.value
    }
}
```
> 원인은 Linked-List 자료구조의 `peek()` 메서드가 가장 앞의 노드 값을 반환하는 것이 아닌 가장 뒤의 노드 값을 반환하게 되어있었다.
> 이를 수정한 이후, 각 Thread는 고객을 dequeue하여 가져갈 순서와 비교할 순서가 어느 정도 맞아 떨어지게 되어 WorkType 비교 실패 횟수를 획기적으로 줄일 수 있게 되었고 정상적으로 dequeue된 고객은 async하게 처리가 잘 되어 원래 예상했던 정상적인 동작으로 수행함을 확인했다.

-----------------------------------------------

## 느낀 점
### SwainYun
1. DispatchQueue 작업 대기열로 보내기 위해서 어디부터 어디까지 중괄호 블럭으로 감싸야 내가 원하는대로 동작할 지 감이 잡히지 않았던 프로젝트 였다.
2. Serial vs Concurrent 그리고 Sync vs Async 라는 개념을 명확하게 머릿 속에 집어넣고 진행해야함을 뼈저리게 느꼈다.
3. Protocol Oriented Programming과 SOLID 원칙 적용에 대하여 다양한 시도를 해볼 수 있었던 소중한 경험이었다.

### COMDORI
- GCD 동시성 프로그래밍에 대해서 깊게 파고 들 수 있는 계기가 되어서 추후 프로젝트에서 동시적인 작업이 필요하다면 활용할 수 있을것 같다.
- UI를 코드로 작성하는 계기가 되어 스토리보드에 UI객체들이 어떻게 올라가는지 알 수 있었습니다. 덕분에 스택 구조와 오토레이아웃 개념도 다시 훓고 갈 수 있는 좋은 경험이 되었습니다.
- Protocol을 다양하게 활용하는 방법과 @escaping 클로저를 통해 새로운 문법 작성법도 알 수 있었습니다.
