// MARK: - Section 5. Properties
// MARK: 20. Lazy Stored Properties
// * 최초 딱 한번만 초기화를 시키고 싶은 경우에 lazy properties를 사용할 수 있다. lazy properties는 유일하게 최초 접근을 할때 초기화를 진행한다.
  
import UIKit

enum Level {
  case easy
  case medium
  case hard
}

struct Exam {
  var level: Level
  lazy private(set) var questions: [String] = {
    
    sleep(5)
    
    switch level {
    case .easy:
      return ["What is 1+2", "what is 1+2", "what is 2+3"]
    case .medium:
      return ["What is 12+12", "what is 12+32", "what is 52+3"]
    case .hard:
      return ["What is 120+102", "what is 301+832", "what is 922+1035"]
    }
  }()
}

// mutating getter가 있으므로 상수(let)으로 선언할 수 없다. var로 선언한다.
/*
var exam = Exam(level: .easy)
print(exam.questions)
var hardExam = exam
hardExam.level = .hard // lazy property가 한번 easy로 초기화 된 후 hard로 재설정을 해보았지만...
print("wait for 1 second")
sleep(1)
print(hardExam.questions) // .easy 케이스에 대한 정보가 출력된다...
 */

var exam = Exam(level: .easy)
var hardExam = exam
hardExam.level = .hard // lazy property를 사용하기 전에 hard 케이스로 변경 후,
print("wait for 1 second")
sleep(1)
print(hardExam.questions) // questions를 실행하면, hard에 대한 정보가 나온다. 최초 초기화 이후, 다시 변경되지 않고, 초기상태를 유지한다...
// 최초 딱 한번만 초기화를 시키고 싶은 경우에 lazy properties를 사용할 수 있다. lazy properties는 유일하게 최초 접근을 할때 초기화를 진행한다.
