
// MARK: - Section 3. Functions
// MARK: 12. In-Out Functions
// in-out parameter는 단순 값 복사가 아닌 값이 저장된 메모리 주소 값을 함수 내, 외부에서 사용 가능하다. 인자는 앞에 &를 붙여 넣어서 사용한다.
  
import UIKit
import PlaygroundSupport

struct User {
  var userId: Int?
  var name: String
}

func saveUser(_ user: User) {
  // 일반적인 방식으로 인자를 받으면 let 타입으로 받으며, 값 참조 방식으로 들어온다.
  // 일반적으로 받은 인자를 지역적으로 재할당해서 변화시킨 후 반환할 수도 있지만... 재할당을 해야한다.
  // code to save the user
//  user.userId = 100
}

func saveUserWithInOutParameter(_ user: inout User) {
  user.userId = 100
}

var user = User(name: "Mon")
saveUser(user)
// inout parameter는 &를 붙여서 넘긴다.
saveUserWithInOutParameter(&user)


