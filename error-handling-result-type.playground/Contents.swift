// MARK: - Section 12. Handling Error for Async Architecture
// MARK: 60. Using Result Type
  
import UIKit

struct Post: Decodable {
  let title: String
  let body: String
}

enum NetworkError: Error {
  case badURL
  case invalidData
  case decodingError
}

// 일반 콜백 클로져 대신 Result타입을 활용했을때
// Result 타입을 사용하면 성공, 실패 콜백 클로져를 하나로 함쳐서 처리하기 용이하다.
// 하나의 completion 인자만으로 콜백이벤트를 처리할 수 있다.
func getPosts(with url: URL, completion: @escaping (Result<[Post], NetworkError>) -> Void) {
  URLSession.shared.dataTask(with: url) { data, response, error in
    guard let data = data, error == nil else {
      completion(.failure(.invalidData))
      return
    }
    
    guard let posts = try? JSONDecoder().decode([Post].self, from: data) else {
      completion(.failure(.decodingError))
      return
    }
         
    completion(.success(posts))
  }
  .resume()
}

guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
  throw NetworkError.badURL
}

getPosts(
  with: url,
  completion: { result in
    switch result {
    case .success(let posts):
      print(posts)
    case .failure(let error):
      print(error)
    }
  }
)
