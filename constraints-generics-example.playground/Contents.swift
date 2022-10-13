//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

// MARK: 57. Equatable and Comparable Protocols
// Equatable: ==
// Comparable: < >

func lowest<T: Comparable>(list: [T]) -> T? {
  let sortedList = list.sorted {
    // 비교를 위해서는 Comparable protocol을 준수해야 한다. 따라서 제네릭 타입에 Comparable protocol 관련 제약을 추가한다.
    return $0 < $1
  }
  
  return sortedList.first
}

print(lowest(list: [4, 5, 6, 1, 200, -100, 999]))
print(lowest(list: ["a", "c", "d", "b"]))

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

protocol Fly { func fly() }
protocol Teleport { func teleport() }
protocol Strength { func throwObject() }
// SuperHero는 Flay, Teleport, Strength 프로토콜을 모두 준수하는 프로토콜 타입이다.
typealias SuperHero = Fly & Teleport & Strength

struct Electronman: SuperHero {
  func fly() {}
  func teleport() {}
  func throwObject() {}
}

func attack<T: SuperHero>(value: T) {
  
}

let electronMan = Electronman()
// electronMan은 Fly, Teleport & Strength를 모두 준수하는 SuperHero 프로토콜 타입이므로 인자로 넘겨서 사용이 가능하다.
attack(value: electronMan)

enum Card: Comparable {
  case ace
  case king
  case queen
  
  // 비교 조건 정의
  static func <(lhs:  Card, rhs: Card) ->  Bool {
    switch(lhs, rhs) {
    case (king, ace): return true
    case (queen, king): return true
    case (queen, ace): return true
    default: return false
    }
  }
}

let ace = Card.ace
let queen = Card.queen

if queen < ace { // queen < ace인경우 true를 반환한다.
  print("queen < ace")
}

print(lowest(list: [Card.ace, Card.queen, Card.king]))
