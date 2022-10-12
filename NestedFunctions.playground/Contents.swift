// MARK: 13. Nested Functions (중첩 함수)
// 'function inside the function'
  
import UIKit

struct Pizza {
  let sauce: String
  let toppings: [String]
  let crust: String
}

class PizzaBuilder {
  func prepare() -> Pizza {
    // nested function
    // 아래 중첩함수들은 prepare 메서드 내에서만 사용될 수 있다.
    // 물론 중첩함수로 항상 사용할 필요는 없지만, 중첩함수를 사용하면 해당 함수의 사용 범위르 보다 명확하게 지정할 수 있다. 예를들면 만약 아래 중첩함수들을 외부에 선언한다면 해당 함수가 private한지, internal한지, public한지 항상 고민해주어야 하지만 중첩함수로 정의함으로써 사용 범위가 명확해지는 장점이 있다.
    func prepareSauce() -> String {
      return "Tomato Souce"
    }
    
    func prepareCrust() -> String {
      return "Hand Tossed"
    }
    
    func prepareToppings() -> [String] {
      return ["Chiicken", "Mushiroom", "Onions"]
    }
    
    let crust = prepareCrust()
    let sauce = prepareSauce()
    let toppings = prepareToppings()
    
    return Pizza(sauce: sauce, toppings: toppings, crust: crust)
  }
}

let pizzaBuilder = PizzaBuilder()
