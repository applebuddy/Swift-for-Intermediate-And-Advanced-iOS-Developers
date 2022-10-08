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

// MARK: 25. Subclassing
// Car를 상속받은 Tasla는 Car의 프로퍼티, 생성자를 사용 가능합니다.
class Tasla: Car {
  var range: Double
  
  // 아래와 같이 Tasla의 프로퍼티도 인자로 받아 초기화가 가능하다.
  // 하지만 아래와 같은 생성자만 있으면, 부모클래스(Car)의 생성자들은 사용 불가능하다.
  /*
  init(make: String, model: String, color: String, range: Double) {
    self.range = range
    super.init(make: make, model: model, color: color)
  }
   */
  // 부모 클래스의 생성자를 오버라이드 하면, 부모클래스의 designated, convenience initializer 생성자들을 호출하여 사용할 수 있다.
  override init(make: String, model: String, color: String) {
    self.range = 300.0
    super.init(make: make, model: model, color: color)
  }
}

let car = Car(make: "ddd", model: "mmm") // color 인자를 안받아도, color 변수는 default 값인 "gold"로 초기화 됩니다.
let car2 = Car(make: "eee", model: "bbb", color: "white")
let tasla = Tasla(make: "wefwf", model: "wefwef", color: "wfewfew")
