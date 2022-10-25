//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

// MARK: 57. Equatable and Comparable Protocols
// * Equatable은 타입 간의 동일 여부 판단에, Comparable은 비교 판단에 사용된다.
// 1) Equatable: ==
// 2) Comparable: < >

func lowest<T: Comparable>(list: [T]) -> T? {
  let sortedList = list.sorted {
    // 비교를 위해서는 Comparable protocol을 준수해야 한다. 따라서 제네릭 타입에 Comparable protocol 관련 제약을 추가한다.
    return $0 < $1
  }
  
  return sortedList.first
}

print(lowest(list: [4, 5, 6, 1, 200, -100, 999]))
print(lowest(list: ["a", "c", "d", "b"]))

// Comparable 사용 예시
enum Card: Comparable {
  case ace
  case king
  case queen
  
  // 비교 조건 정의를 할 수 있다.
  static func <(lhs: Card, rhs: Card) -> Bool {
    switch(lhs, rhs) {
    case (king, ace): return true // king < ace일 경우 true
    case (queen, king): return true // queen < king일 경우 true
    case (queen, ace): return true // queen < ace일 경우 true
    default: return false // 그 외에는 false
    }
  }
}

let ace = Card.ace
let queen = Card.queen

if queen < ace { // queen < ace인경우 true를 반환한다.
  print("queen < ace : \(queen < ace)") // true
}

print(lowest(list: [Card.ace, Card.queen, Card.king]))

// Equatable 사용 예시
struct WeirdMan: Equatable {
  var papa: Int
  static func ==(lhs: WeirdMan, rhs: WeirdMan) -> Bool {
    print("lhs.papa : \(lhs.papa), rhs.papa : \(rhs.papa)")
    return (lhs.papa * 2) == rhs.papa
  }
}

let firstMan = WeirdMan(papa: 2)
let secondMan = WeirdMan(papa: 3)
let thirdMan = WeirdMan(papa: 4)
// WeirdMan 만의 기준으로 == 연산자로 동일 여부를 판단한다.
print("firstMan == secondMan : \(firstMan == secondMan)") // false
// firstMan.papa의 2배는 thirdMan.papa의 값과 동일하기에 true가 반환된다.
print("firstMan == thirdMan : \(firstMan == thirdMan)") // true

// MARK: 56. Example 2 - Constraints in Generics
/*
struct Movie: Encodable {
  let title: String
}

// Encoding을 위해서 사용되는 T 제네릭타입은 Encodable을 준수해야 한다.
func serializeToData<T: Encodable>(_ value: T) -> Data? {
  return try? JSONEncoder().encode(value)
}

print(serializeToData(Movie(title: "Batman")))
*/

// Fly, Teleport, Strength 프로토콜을 채택 및 준수하여 사용하기 위해서는 각각 fly, teleport, throwObject 메서드를 구현해야한다.
/*
protocol Fly { func fly() }
protocol Teleport { func teleport() }
protocol Strength { func throwObject() }

extension Fly {
  func fly() {
    print("I believe I can fly.")
  }
}

// SuperHero는 Flay, Teleport, Strength 프로토콜을 모두 준수하는 프로토콜 타입이다.
// Codable도 Decodable & Encodable 로 되어있는데 이는 디코딩, 인코딩을 모두 지원하는 타입을 정의한다.
typealias SuperHero = Fly & Teleport & Strength

// SuperHero 타입을 채택한 Electronman은 Fly, Teleport, Strength 프로토콜을 모두 준수해야한다.
struct Electronman: SuperHero {
//  func fly() {} // fly()를 준수해야하지만, extension Fly { ... } 에 default implementation이 있어서 괜찮았다.
  func teleport() {}
  func throwObject() {}
}

func attack<T: SuperHero>(value: T) {
  // ...
}

let electronMan = Electronman()
electronMan.fly() // I believe I can fly.
// electronMan은 Fly, Teleport & Strength를 모두 준수하는 SuperHero 프로토콜 타입이므로 인자로 넘겨서 사용이 가능하다.
attack(value: electronMan)
*/
