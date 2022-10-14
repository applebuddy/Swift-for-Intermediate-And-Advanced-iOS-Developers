// MARK: 36. Handling Errors Using Do-Catch
// explanation of error propagation and bubbling the error
  
import UIKit

struct Pizza {
  let dough: String
  let toppings: [String]
}

enum PizzaBuilderError: Error {
  case doughBurnt
  case noToppings(String) // enum의 기본 문법 기능 중 하나인 연관 데이터를 추가로 넣어서 에러 데이터로 참고 가능
}

struct PizzaBuilder {
  func prepare() -> Pizza? {
    do {
      // do 블럭 내에서 다양한 throws 메서드를 호출할 수 있고 이때 발생하는 error를 걸러낼 수 있다. 이것을 error bubbling, error propagation이라고 한다.
      let dough = try prepareDough()
      let toppings = try prepareToppings()
      return Pizza(dough: dough, toppings: toppings)
    } catch {
      print("Unable to prepare pizza")
      return nil
    }
  }
  
  private func prepareDough() throws -> String {
    // prepare the dough
    throw PizzaBuilderError.doughBurnt
  }
  
  private func prepareToppings() throws -> [String] {
    // prepare the toppiings
    throw PizzaBuilderError.noToppings("Chicken and Onions are missing")
  }
}
