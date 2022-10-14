// MARK: 51. Understanding Inheritance in Protocols

import UIKit

struct Course {
  let courseNumber: String
  let name: String
  let creditHours: Int
}

protocol Student {
  var courses: [Course] { get set }
  mutating func enroll(_ course: Course)
}

extension Student {
  mutating func enroll(_ course: Course) {
    courses.append(course)
  }
}

protocol VerifiedStudent: Student {
  func verify() -> Bool
}

extension VerifiedStudent {
  //  VerifiedStudent는 Student protocol을 준수하고 있으므로, VerfiedStudent extension에서 Student protocol의 메서드도 구현할 수 있다.
  func enroll(_ course: Course) {
    if verify() {
      print("Enroll in course")
    }
  }
  
  func verify() -> Bool {
    return true
  }
}

struct InternationalStudent: VerifiedStudent {
  var courses: [Course] = []
  
  // Student, VerifiedStudent protocol에 정의된 enroll(_:), verify() 메서드를 구현하지 않았지만, 각 protocol extensnioi에 default implementation이 있으므로 컴파일 에러는 발생하지 않으며, InternationStudent protocol을 채택하는 객체들은 각 protocol의 default 구현 내용대로 메서드를 사용할 수 있다.
}

// InternationalStudent struct는 VerifiedStudent만 채택하고 있지만 VerifiedStudent는 Student를 준수하므로 Student, VerifiedStduent의 extensnio method를 모두 사용이 가능하다. (extensnion method가 구현되어 있다면)
let internasionalStudent = InternationalStudent()
internasionalStudent.enroll(Course(courseNumber: "1234", name: "Main", creditHours: 3))
