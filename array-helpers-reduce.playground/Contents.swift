

import UIKit

// MARK: 10. reduce(into:)

let ratings = [4, 8.5, 9.5, 2, 6, 3, 5.5, 7, 2.8, 9.8, 5.9, 1.5]
let results = ratings.reduce(into: [:]) { (results: inout [String: Int], rating: Double) in
  // into 레이블이 없는 reduce 메서드를 사용하면 아래와 같이 값 복사를 해서 변환 후 반환해야 한다.
  // into 레이블을 사용하면 result를 inout 변수로 접근해서 변환할 수 있다. 따라서 값복사 후 변환된 값을 반환하는 방식을 취할 필요가 없어진다. 원본 자체가 바뀌기 때문에.
//  var copy = results

  // dictionary에 default 를 지정하면, 특정 연산을 했을때 dictionary의 value가 nil일 경우 default값으로 계산을 할 수 있다.
  switch rating {
  case 1..<4: results["very bad", default: 0] += 1
  case 5..<6: results["OK", default: 0] += 1
  case 6..<8: results["Good", default: 0] += 1
  default: break
  }
//  return copy
}

print(results) // ["very bad": 4, "Good": 2, "OK": 2]

// MARK: 9. reduce
/*
struct Item  {
  let name: String
  let price: Double
}

struct Cart {
  // Cart 내에서만 변경될 수 있는 외부 읽기전용 변수
  private(set) var items: [Item] = []
  
  mutating func addItem(_ item: Item) {
    items.append(item)
  }
  
  /// price 총합을 반환
  var total: Double {
    // first argument is initial value, starting value
    items.reduce(0) { value, item -> Double in
      return value + item.price
    }
  }
}

var cart = Cart()
cart.addItem(Item(name: "Milk", price: 4.50))
cart.addItem(Item(name: "Bread", price: 2.50))
cart.addItem(Item(name: "Eggs", price: 12.50))
print(cart.total) // 모든 아이템의 price 합이 출력된다.

let items = [2.0, 4.0, 5.0, 7.0]
let total = items.reduce(0, +)
print(total)
*/
