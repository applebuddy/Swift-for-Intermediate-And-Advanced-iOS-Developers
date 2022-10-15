// MARK: - Section 12. Handling Error for Async Architecture
// MARK: 59. Before Result Type - Using Success and Failure Callbacks
  
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

// Result 타입 없이 일반 콜백 클로져를 사용했을때
// Result 타입을 사용하면 성공, 실패 콜백 클로져를 하나로 함쳐서 처리하기 용이하다.
func getPosts(with url: URL, success: @escaping ([Post]) -> Void, failure: @escaping (NetworkError?) -> Void) {
  URLSession.shared.dataTask(with: url) { data, response, error in
    guard let data = data, error == nil else {
      failure(NetworkError.invalidData)
      return
    }
    
    guard let posts = try? JSONDecoder().decode([Post].self, from: data) else {
      failure(.decodingError)
      return
    }
         
    success(posts)
  }
  .resume()
}

guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
  throw NetworkError.badURL
}

getPosts(
  with: url,
  success: { posts in
    print(posts)
  }, failure: { error in
    print(error)
  }
)
