//: A UIKit based Playground for presenting user interface
  
// MARK: 23. Getting Started with Initializers (Initializers in Struct)
// struct는 기본 생성자가 제공된다. 하지만 일부 변수만 받아서 처리하는 생성자는 별도로 처리해야한다.

import UIKit

struct Student {
  let firstName: String
  let lastName: String
  let grade: String
  
  /*
  init(firstName: String, lastName: String) {
    self.firstName = firstName
    self.lastName = lastName
    // 초기화가 필요한 변수를 모두 인자로 받지 않더라도, 생성자에서 default 값을 설정해주면 문제 없다.
    // 하지만 해당 생성자만 정의될 경우, 기존의 default init 을 호출하지 못한다.
    self.grade = ""
  }
   */
}

extension Student {
  init(firstName: String, lastName: String) {
    self.firstName = firstName
    self.lastName = lastName
    // extension에 커스텀 생성자를 정의하면, default 생성자와 커스텀 생성자를 모두 호출할 수 있다.
    self.grade = ""
  }
}

let student = Student(firstName: "John", lastName: "Doe")
let student2 = Student(firstName: "Mon", lastName: "Cat", grade: "Third")

//import PlaygroundSupport
//
//class MyViewController : UIViewController {
//    override func loadView() {
//        let view = UIView()
//        view.backgroundColor = .white
//
//        let label = UILabel()
//        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
//        label.text = "Hello World!"
//        label.textColor = .black
//
//        view.addSubview(label)
//        self.view = view
//    }
//}
//// Present the view controller in the Live View window
//PlaygroundPage.current.liveView = MyViewController()
