// MARK: 22. Property Observers (didSet, willSet)
// property observer에는 didSet, willSet이 있다. wiilSet에서는 newValue, didSet에서는 oldValue를 사용 가능하다.

import UIKit

struct Website {
  
  init(url: String) {
    // initializer 종료 시에 호출될 코드를 defer block에 넣어서 실행할 수 있다.
    defer { self.url = url } // [didSet 실행 됨] 해당 라인 코드를 넣으면, 생성자 종료 후 url 출력 시, percentEncoding 상태의 url이 출력된다.
    self.url = url // [didSet 실행되지 않음] 생성자 초기화 코드만으로는 didSet의 동작이 적용되지 않는다.
  }
  
  var url: String {
    didSet {
      url = url.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? url
    }
    
    willSet {
      
    }
  }
}

var website = Website(url: "www.movies.com/?search=Lord of the Rings")
print(website) // url의 didSet이 실행되어야 해당 라인의 url이 percentEndcoding 상태로 출력이 됨.
print(website.url)
website.url = "www.movies.com/?search=Lord of the Rings"
print(website) // 생성자 실행 간 didSet이 실행되지 않았다면 해당 라인 부터 percentEncoding 상태의 url이 출력됨.
