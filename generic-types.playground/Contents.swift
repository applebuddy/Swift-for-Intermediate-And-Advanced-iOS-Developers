// MARK: 58. Creating a Generic Type

import UIKit

// 제네릭타입은 <...> 꺽쇠 안에 리스트 형태로 정의할 수 있으며 각 제네릭 타입 별로 각기 다른 제약을 줄 수 있다. Result 타입이 그 예시 중 하나이다. Success타입에는 제약이 없지만 where 절을 통해 Failure 제네릭에 대한 제약(Error 프로토콜을 준수해야함)을 주고 있는 것을 볼 수 있다.
// enum Result<Success, Failure> where Failure : Error

enum NetworkError: Error {
  case badURL
}

// Codable은 Encodable, Decodable을 모두 준수하는 타입이다.
// 실제 구현 부 -> public typealias Codable = Decodable & Encodable
struct Post: Codable {
  let title: String
}

// 제네릭타입 T, K는 각각 Codable, Error 프로토콜을 준수해야만 한다.
// 제네릭타입에는 클래스, 프로토콜 타입을 통해 제약을 줄 수 있다. 그 외 struct, String 타입등은 안됨
enum Callback<T: Codable, K: Error> {
  case success(T)
  case failure(K)
}

func getPosts(completion: (Callback<[Post], NetworkError>) -> Void) {
  // get all posts
  let posts = [Post(title: "Hello World"), Post(title: "Hello Yaho"), Post(title: "hi bye")]
  // Callback에서 정의하고 있는 제네릭타입의 제약상태에 맞게 Callback 타입을 사용할 수 있다.
    completion(.success(posts)) // posts는 Codable을 준수함
//  completion(.failure(.badURL)) // badURL은 NetworkError 타입임
}

getPosts { result in
  switch result {
  case .success(let posts):
    // posts는 Codable을 준수하는 [Post] 타입이다.
    print(posts) // [Post] 정보가 출력
  case .failure(let error):
    // error는 Error를 준수하는 NetworkError 타입이다.
    print(error) // badURL
  }
}
