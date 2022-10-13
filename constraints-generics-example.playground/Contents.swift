//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

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
