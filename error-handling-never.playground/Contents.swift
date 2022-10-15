// MARK: 62. Impossible Failure and Result
// Failure 케이스를 처리하고 싶지 않다면, Failure 타입으로 Never를 사용할 수 있다.
  
import UIKit

struct Category {
  let name: String
}

enum FakeError: Error {
//  case noData
}

protocol Service {
  associatedtype Value
  associatedtype MyError: Error // it must conform the Error protocol
  func load(completion: (Result<Value, MyError>) -> Void)
}

class CategoryService: Service {
  func load(completion: (Result<[Category], Never>) -> Void) {
    completion(.success([
      Category(name: "Fiction"), Category(name: "Horror"), Category(name: "Kids")
    ]))
  }
}

// -> FakeError가 error case가 없다면, Result타입을 분기처리할때 failure 케이스를 명시하지 않아도 컴파일 에러가 발생하지 않는다.
// 이렇게 에러가 발생하지 않도록 하려한다면, Never를 사용할 수 있다.
CategoryService().load { result in
  switch result {
  case .success(let categories):
    print(categories)
  }
}
