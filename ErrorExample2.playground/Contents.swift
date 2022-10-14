
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
func getPosts() async throws -> [Post] {
  guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
    throw NetworkError.badURL
  }
  
  do {
    // await은 반환타입 앞에 async가 붙은 메서드에만 사용한다.
    let data = try await URLSession.shared.data(from: url).0
    // decode는 단순 throws 메서드이므로 try만 붙여서 값을 파싱하면 된다.
    let response = try JSONDecoder().decode([Post].self, from: data)
    return response
  } catch {
    throw error
  }
}

func asyncAwaitExample() async -> Task<[Post]?, Never> {
  Task {
    do {
      let posts = try await getPosts()
      print(posts)
      return posts
    } catch {
      return nil
    }
  }
}

Task {
  let taskResult = await asyncAwaitExample().result
  print(taskResult)
}
