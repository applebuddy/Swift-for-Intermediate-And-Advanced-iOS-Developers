//: A UIKit based Playground for presenting user interface
  
// MARK: 24. Convenience Initializers
import UIKit
import PlaygroundSupport

class Car {
  var make: String
  var model: String
  var color: String
  
  init(make: String, model: String, color: String) {
    self.make = make
    self.model = model
    self.color = color
  }
  
  // convenience init을 사용하면 일부 변수를 인자로 받지 않았을때 초기화할 default 값을 지정할 수 있다.
  // convenience init 내부에서는 self.init을 호출해야한다.
  convenience init(make: String, model: String) {
    self.init(make: make, model: model, color: "gold")
  }
}

let car = Car(make: "ddd", model: "mmm") // color 인자를 안받아도, color 변수는 default 값인 "gold"로 초기화 됩니다.
let car2 = Car(make: "eee", model: "bbb", color: "white")
