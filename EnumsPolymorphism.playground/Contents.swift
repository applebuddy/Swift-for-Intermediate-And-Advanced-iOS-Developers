  
import UIKit

// MARK: 16. Hiding Type Using Enums

struct Teacher {
  let name: String
  let courses: [String]
}

struct Student {
  let name: String
  let courses: [String]
  var grade: String?
}

let teacher = Teacher(name: "John Doe", courses: ["Math", "Science"])
let student = Student(name: "Patrick hoffman", courses: ["Math", "History"])
// Student, Teacher 타입을 하나의 배열에 담을 수가 없다 ㅠㅠ [Any] 로 하면 되긴하지만... 강타입 언어인 swift의 특성에 위배되서 좋지 못하다..
let users: [Any] = [teacher, student]

for user in users {
  // [Any] 타입을 순회할때 switch + type casting을 통해서 타입을 분기하여 출력할 수 있긴 하다.
  // enum을 사용해 보자!
  switch user {
  case let user as Student:
    print(user.grade ?? "")
  case let user as Teacher:
    print(user.courses)
  default:
    print("Not student or teacher")
  }
}

enum User {
  case teacher(Teacher)
  case student(Student)
}

// case가 다르지만, 모두 User 열거형 타입이다. [Any] 타입을 사용할 필요가 없이 [User] 타입으로 사용하면 된다.
let allUsers = [User.teacher(teacher), User.student(student)]

for user in allUsers {
  // struct -> enum으로 바꾸게 되면서 얻게 된 이점
  // 1) default 분기도 필요없고, 타입캐스팅도 필요없다.
  // 2) [Any] 타입을 사용하지 않기 떄문에 강타입 언어인 swift 특성에 위배되지도 않는다.
  // 3) User타입 하나만으로 케이스를 나누어 다양한 객체를 분기하여 다룰 수 있엇다.(enum의 다형성) 이것이 열거형의 장점.
  switch user {
  case .student(let student):
    print(student.grade ?? "")
  case .teacher(let teacher):
    print(teacher.courses)
  }
}
