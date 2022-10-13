// MARK: 58. Creating a Generic Type

import UIKit

// 제네릭타입은 리스트 형태로 정의할 수도 있으며 각 제네릭 타입에 각기 다른 제약을 줄 수 있다. Result 타입이 그 예시 중 하나이다.
// enum Result<Success, Failure> where Failure : Error

enum NetworkError: Error {
  case badURL
}

struct Post: Codable {
  let title: String
}

enum Callback<T: Codable, K: Error> {
  case successs(T)
  case failure(K)
}

func getPosts(completion: (Callback<[Post], NetworkError>) -> Void) {
  // get all posts
  let posts = [Post(title: "Hello World"), Post(title: "Hello Yaho"), Post(title: "hi bye")]
  // Callback에서 정의하고 있는 제네릭타입의 제약상태에 맞게 Callback 타입을 사용할 수 있다.
//  completion(.successs(posts)) // posts는 Codable을 준수함
  completion(.failure(.badURL)) // badURL은 NetworkError 타입임
}

getPosts { result in
  switch result {
  case .successs(let posts):
    print(posts)
  case .failure(let error):
    print(error)
  }
}
