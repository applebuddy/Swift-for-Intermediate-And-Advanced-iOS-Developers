// MARK: - Section 2. Understanding Swift Collections
// MARK: 5. Iterating
// for문 루프로 값을 순회할 수 있는 Array collection는 Sequence 프로토콜을 채택하고 있다. Sequence 프로토콜을 준수하기 위해서는 makeIterator -> some IteratorProtocol(next 메서드를 구현해야하는 프로토콜을 반환)
// to conform Sequence protocol, we should implement makeIterator() -> some IteratorProtocol {} method so that we can iterate that as a custom rule of next() method in IteratorProtocol. then, we can iterate elements for that conforming Sequence protocol.
import UIKit

let names  = ["Alex", "John", "Mary"]

var nameIterator = names.makeIterator()
// 다음 element가 존재할때까지 계속 출력을 한다.
while let name = nameIterator.next() {
  print(name)
}

/*
for name in names {
  print(name)
}
*/

/*
// IteratorProtocol의 정의 내용, Sequenceem들은 아래와 같은 프로토콜을 채택하고 있다.
protocol IteratorProtocol {
  associatedtype Element
  
  mutating func next() -> Element?
}
*/

struct Countdown: Sequence {
  let start: Int
  
  func makeIterator() -> some IteratorProtocol {
    return CountdownIterator(self)
  }
}

struct CountdownIterator: IteratorProtocol {
  let countdown: Countdown
  var currentValue = 0
  
  init(_ countdown: Countdown) {
    self.countdown = countdown
    self.currentValue = countdown.start
  }
  // Iterator를 순회할때 next에 정의된 방식대로 다음 값이 출력된다.
  mutating func next() -> Int? {
    if currentValue > 0 {
      let value = currentValue
      currentValue -= 1
      return value
    } else {
      return nil
    }
  }
}

let countdown = Countdown(start: 10)
var countdownIterator = countdown.makeIterator()
while let next = countdownIterator.next() {
  print(next)
}
//for count in countdown {
//  print(count)
//}
