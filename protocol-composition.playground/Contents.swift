// MARK: 52. Protocol Composition
  
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

protocol VerifiedStudent {
  func verify() -> Bool
}

// VerifiedStudent 뿐만 아니라 Student를 채택해야 아래 extension 기능 사용이 가능하다.
extension VerifiedStudent where Self: Student {
  func enroll(_ course: Course) {
    if verify() {
      print("Verified and Enrolled")
    }
  }
  
  func verify() -> Bool {
    return true
  }
}

// VerifiedStudent를 채택하면서 Student 프로토콜도 동시에 채택한 경우, verify 메서드를 사용할 수 있다.
struct InternationalStudent: Student, VerifiedStudent {
  var courses: [Course] = []
}

struct InternationalAdult: VerifiedStudent {
  func verify() -> Bool {
    return false
  }
  
  var courses: [Course] = []
}

let student = InternationalStudent()
print(student.verify())
student.enroll(Course(courseNumber: "1234", name: "Math", creditHours: 3))
let aduit = InternationalAdult()
print(aduit.verify())
// * adult는 Student를 채택하지 않도 있는 타입이므로 아래 extension VerifiedStudent wehre Self: Student { ... } 에 구현된 기능을 사용할 수 없다 ㅜㅜ (직접 구현해서 쓰거나, Student 프로토콜을 준수하도록 만들어야 함)
// * 에러 발생 : Referencing instance method 'enroll' on 'VerifiedStudent' requires that 'InternationalAdult' conform to 'Student'
// aduit.enroll(Course(courseNumber: "1234", name: "Math", creditHours: 3))
