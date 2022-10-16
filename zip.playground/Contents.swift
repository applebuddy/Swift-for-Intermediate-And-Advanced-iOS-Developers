import UIKit

// MARK: 11. zip
// 두개의 Sequence에 대한 각 동일 위치의 Element끼리 쌍을 출력한다. 쌍을 짓지 못하는 Element들은 결과에서 제외된다.

let students = ["Alex", "Mary", "John", "Steven"]
let grades = [3.4, 2.8]
let pair = zip(students, grades)

pair.forEach {
  // students의 Element갯수는 4개이지만, grade의 Element 갯수가 2개 뿐이므로 2개의 쌍만 출력된다. (Observable, Publisher를 zip할때도 동일한 조직으로 동작)
  /*
  Alex, 3.4
  Mary, 2.8
  */
  print("\($0), \($1)")
}
