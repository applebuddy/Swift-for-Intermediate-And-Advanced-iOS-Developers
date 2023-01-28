# Swift-for-Intermediate-iOS-Developers
Study with Udemy lecture, 'Swift for Intermediate and Advanced iOS Developers'
* lecture link : https://www.udemy.com/course/swift-for-intermediate-and-advanced-ios-developers/



## Section 4: Enumerations

### 객체를 Struct 대신 Enum으로 선언하면 얻을 수 있는 이점

- Teacher, Student 등 다양한 케이스로 정의가 되어야 할때 enum은 case정의를 통해 타입 분기를 할때 switch문을 활용하여 깔끔하게 처리할 수 있다.
  - 다양한 케이스 객체를 하나의 타입에 담아서 switch 문과 사용할때 default 분기 없이 보다 깔끔한 케이스 분기를 정의할 수 있게 된다.
  - 또한 타입 내의 다양한 객체를 처리할때 타입캐스팅을 할 필요가 줄어든다.
- 타입 하나만으로 케이스를 나누어 다양한 객체를 함께 묶거나 분기 처리할 수 있다. (enum의 다형성 활용)
  - 강타입 언어인 swift 정책에 어긋나는 Any타입 사용을 줄일 수 있다.
- 타입 하나에 대한 케이스가 추후 확장 되어도, 손쉽게 케이스를 확장하여 정의할 수 있다. (enum의 확장성)



### ⚠ enum이 항상 장점만 있는 것은 아니다. 

- 나누어지는 각각의 케이스가 공통적인 멤버를 다수 갖고 있을때, class는 서브클래싱을 통해 공통 멤버를 정의하고, 중복 정의를 줄일 수 있다.

- 반면, enum은 각각 케이스의 중복 멤버를 하나하나 정의해주어야 한다.

- 공통멤버가 추후 변동되지 않고 고정됨이 보장된다면, 서브클래싱이 가능한 class가 더 좋은 방법이 될 수도 있다.

  - 물론, 공통 멤버가 일정하지 않고, 언제든 바뀔 수 있다면, 더욱 쉽게 케이스 멤버 변형이 가능한 enum을 사용하는 것이 더 좋을 수 있다.
  - 특정 타입이 생기거나, 공통멤버가 바뀌는 경우에 대한 수정 소요가 enum을 사용할때 clsas subclassing 방식에 비해 용이하기 때문이다.

  

### enum + failable initializer를 활용하여 rawValue에 따른 세부 타입 설정 정의하기

~~~swift
import UIKit

enum ImageType: String {
  case jpg
  case bmp
  case png
  
  // jpg, jpeg 모두 jpg 타입으로 보고 싶다면? init?(rawValue: String) {} 생성자를 활용해볼 수 있다.
  init?(rawValue: String) {
    // 생성자에 들어간 rawValue가 jpg, jpeg일 경우에는 .jpg 타입으로 설정되도록 했다. 잘못된 rawValue가 들어가면 nil을 반환하는 failable initializer이다.
    switch rawValue.lowercased() {
    case "jpg", "jpeg": self = .jpg
    case "bmp": self = .bmp
    case "png": self = .png
    default: return nil
    }
  }
}
~~~




## Section 9: Async and Await

### 동기 코드에서 await 키워드와 함께 비동기 동작 실행하기

~~~swift
// MARK: 45. Performing Asynchronous Action from Synchronous Code
// task를 사용하면 블럭 내에서 await 예약어를 사용한 비동기 동작을 수행하여 비동기적으로 결과를 기다릴 수 있다.
Button {
	// iOS 13+
	Task {
	  // .. do something
	}
	// iOS 15+
	task {
	  // refresh the news
	  await newsSourceListViewModel.getSources()
	}
} label: {
	Text("Test Button")
}
~~~



## Section 10: Protocol Oriented Design

### 제네릭타입을 사용한 객체 vs 제네릭타입을 제거 후, 프토토콜 타입만 적용한 객체의 차이

~~~swift
// AirlineTicket 프로토콜을 준수하는 제네릭 타입을 갖는 클래스
class CheckoutServiceWithGeneric<Ticket: AirlineTicket> {
  var tickets: [Ticket]
  
  init(tickets: [Ticket]) {
    self.tickets = tickets
  }
  // AirlineTicket을 준수하는 여러개의 타입을 addTicket에서 취급할 수 없다..
  // AirlineTicket을 채택한 EconomyTicket을 기준으로 초기화가 되었으면, EconomyTicket타입만 취급 가능...
  func addTicket(_ ticket: Ticket) {
    self.tickets.append(ticket)
  }
}

// -> 현실 세계에선 economy, business, first ticket 모두 취급을 할 수 있어야 하는 경우가 있지만, 위 객체는 그게 안됨 😢
~~~

~~~swift
// 제네릭 타입을 제거하고, 대신 protocol 타입을 적용했다.
class CheckoutServiceWithoutGeneric {
  var tickets: [AirlineTicket]
  
  init(tickets: [AirlineTicket]) {
    self.tickets = tickets
  }
  // AirlineTicket을 준수하는 여러개의 타입을 addTicket에서 취급할 수 있게 되었다.
  func addTicket(_ ticket: AirlineTicket) {
    self.tickets.append(ticket)
  }
  // AirlineTicket을 채택한 다양한 타입을 취급 가능
  func processTickets() {
    tickets.forEach { print($0) }
  }
}
~~~

