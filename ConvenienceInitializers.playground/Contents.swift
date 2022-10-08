//: A UIKit based Playground for presenting user interface
  
// MARK: 24. Convenience Initializers
import UIKit
import PlaygroundSupport

// protocol을 사용해서 특정 protocol을 채택한 객체에 대하여 required init이 필요함을 명확히 정의할 수 있다.
protocol CarType {
  init(make: String, model: String)
}

// subclass 할 일이 없는 class는 final 키워드를 붙여주어 subclass하지 않는 class임을, 상속으로 인한 dynamic dispatch가 필요없을을 명확하게 할 수 있다.
final class Car: CarType {
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
  // MARK: 26. Required Initializers
  
  required convenience init(make: String, model: String) {
    self.init(make: make, model: model, color: "gold")
  }

  /*
  required convenience init(make: String, model: String) {
    self.init(make: make, model: model, color: "gold")
  }
  
  class func makeCar(make: String, model: String) -> Self {
    // class 타입의 Self를 construct할때는 required 지정이 된 initializer를 사용해야 한다.
    // error message : 'Constructing an object of class type 'Self' with a metatype value must use a 'required' initializer'
    let car = self.init(make: make, model: model)
    // setup engine
    // setup fuel lines
    // setup tires
    return car
  }
   */
}

// MARK: 25. Subclassing
// Car를 상속받은 Tasla는 Car의 프로퍼티, 생성자를 사용 가능합니다.
// 26) Car가 final class로 정의가 된 순간, 상속이 불가능하므로, Tasla는 Car를 상속할 수 없습니다.
/*
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
 */

let car = Car(make: "ddd", model: "mmm") // color 인자를 안받아도, color 변수는 default 값인 "gold"로 초기화 됩니다.
let car2 = Car(make: "eee", model: "bbb", color: "white")
//let tasla = Tasla(make: "wefwf", model: "wefwef", color: "wfewfew")
