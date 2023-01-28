# Swift-for-Intermediate-iOS-Developers
Study for Udemy lecture, 'Swift for Intermediate and Advanced iOS Developers'
* lecture link : https://www.udemy.com/course/swift-for-intermediate-and-advanced-ios-developers/




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

