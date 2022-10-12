
// MARK: 14. Functions as Variables, Passing Functions to Functions

import UIKit
import PlaygroundSupport

let hello = {
  print("Hello closure")
}

let hello2: (String) -> () = { name in
  print("Hello \(name)")
}

hello() // Hello closure
hello2("MungGu") // Hello MungGu

// 클로져의 인자, 반환 타입은 함수처럼 다양할 수 있다.
let pow: (Int, Int) -> Int = { number, times in
  // 인자 없이, $0, $1 등으로 첫번째, 두번째 인자를 첩근해서 처리할 수도 있다.
  // return $0 * $1
  return number * times
}

// 한줄로 표현할 경우 return 을 명시하지 않아도 코드가 동작
let pow2: (Int, Int) -> Int = { $0 * $1 }

let result = pow2(5, 3)
print(result)

//

func getPosts() -> [String] {
  var posts: [String] = []
  DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
    posts = ["Hello World", "Introduction to closures"]
  }
  return posts
}

func getPostsWithCompletion(_ completion: @escaping ([String]) -> ()) {
  var posts = [String]()
  DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
    posts = ["Hello World", "Introduction to closures"]
    // non-escaping closure인 경우, 함수 종료 후에는 해당 클로져를 사용할 수 없다.
    // 함수 종료 후에도 사용하기 위해서는 escaping closure를 사용해야한다.
    completion(posts)
  }
}

print(getPosts()) // []가 반환된다... 비동기 코드의 설정 코드가 적용되지 않았기 때문
getPostsWithCompletion { result in
  // escaping closure를 사용할때 self가 강한참조로 캡쳐되면 교착상태에 빠지고 메모리 해제가 안될 수 있으니, 캡쳐리스트 명시를 해서 self가 강한참조로 캡쳐되지 않도록 한다. 그 외 방법으로는 escaping closure를 사용하지 않는 것이다. async await / functional programming 방식으로 사용하여 관련 문제를 방지할 수 있다.
  print(result) // 약 2초 후 ["Hello World", "Introduction to closures"]가 출력 됨
}
