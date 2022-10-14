
import UIKit

struct Post: Decodable {
  let title: String
  let body: String
}

enum NetworkError: Error {
  case badURL
  case decodingError
  case badRequest
  case noData
  case custom(Error)
}

// Result 타입은 Success, Failure 두개의 제네릭타입과 success, failure 두개 케이스로 되어있는 enum 타입이다. error 혹은 수신한 응답값을 상황에 따라 분기하여 콜백에 전달할 수 있다.
func getPosts(completion: @escaping ((Result<[Post], NetworkError>)) -> Void) {
  guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
    completion(.failure(.badURL))
    return
  }
  
  URLSession.shared.dataTask(with: url) { data, response, error in
    if let error = error {
      completion(.failure(.custom(error)))
    } else if (response as? HTTPURLResponse)?.statusCode != 200 {
      completion(.failure(.badRequest))
    } else {
      guard let data = data else {
        completion(.failure(.noData))
        return
      }
      
      let posts = try? JSONDecoder().decode([Post].self, from: data)
      if let posts = posts {
        completion(.success(posts))
      } else {
        completion(.failure(.decodingError))
      }
    }
  }
  .resume()
}

getPosts { result in
  // completion handler로 전달받은 result enum 타입을 통해 실패여부 판단 및 수신한 응답값을 확인 가능
  switch result {
  case .success(let posts):
    print(posts)
  case .failure(let error):
    print(error)
  }
}
