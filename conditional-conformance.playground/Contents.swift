//: A UIKit based Playground for presenting user interface
  
// MARK: 64. Conditional Conformance

import UIKit
import PlaygroundSupport

protocol CartProtocol {
  func computeTotal() -> Double
}

struct CartItem {
  let name: String
  let price: Double
}

struct Cart: CartProtocol {
  let items: [CartItem]
  
  func computeTotal() -> Double {
    return items.reduce(0) { (value, item) in
      return value + item.price
    }
  }
}

/*
 // 아래 extension으로는 stores에서 computeTotal()을 호출할 수 없다.
extension Array where Element: CartProtocol {
  // 2차원 객체 배열의 total 가격을 계산할 수 있는 메서드를 Array extension 내에 구현
  func computeTotal() -> Double {
    self.reduce(0) { (value, cart) in
      return value + cart.computeTotal()
    }
  }
}
 */
// 아래와 같이 Element뿐만 아니라 Array 또한 CartProtocol을 준수하도록 하여 extension에 메서드를 구현하면 Array 자체에서도 computeTotal 메서드를 접근하여 사용할 수 있다.
extension Array: CartProtocol where Element: CartProtocol {
  // 2차원 객체 배열의 total 가격을 계산할 수 있는 메서드를 Array extension 내에 구현
  func computeTotal() -> Double {
    self.reduce(0) { (value, cart) in
      return value + cart.computeTotal()
    }
  }
}

let carts = [
  Cart(items: [CartItem(name: "MILK", price: 1.0), CartItem(name: "Banana", price: 2.0), CartItem(name: "Apple", price: 3.0)]),
  Cart(items: [CartItem(name: "Berry", price: 10.0), CartItem(name: "Good", price: 20.0)])
]

// extension Array: CartProtocol where Element: CartProtocol { ... } 에 구현된 computeTotal 메서드를 접근 가능
let stores = [
  carts, carts
]

print(carts.computeTotal())
print(stores.computeTotal())
