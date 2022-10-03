//
//  Webservice.swift
//  NewsApp
//
//  Created by Mohammad Azam on 6/30/21.
//

import Foundation

enum NetworkError: Error {
  case badUrl
  case invalidData
  case decodingError
}

class Webservice {
  // async await을 활용하면 콜백의 사용을 최소화할 수 있다.
  // 1) 함수 반환 부에는 async throws 예약어를 사용
  // 2) 비동기 요청이 필ㄹ요한 부분에 try await 예약어를 사용
  func fetchSourcesAsync(url: URL?) async throws -> [NewsSource] {
    
    guard let url = url else {
      return []
    }
    // suspended 상태가되었다가, data 수신을 완료할때 데이터를 받아서 디코딩을 한다.
    let (data, _) = try await URLSession.shared.data(from: url)
    let newsSourceResponse = try? JSONDecoder().decode(NewsSourceResponse.self, from: data)
    return newsSourceResponse?.sources ?? []
  }
  
  // 아래와 같이 콜백 completion을 사용할 수도 있지만 이제는 async (throws) / (try) await 문법을 활용해서 콜백지옥을 해결하고 보다 가독성있게 코드를 작성, 비동기 작업을 수행할 수 있다.
  /*
  func fetchSources(url: URL?, completion: @escaping (Result<[NewsSource], NetworkError>) -> Void) {
    
    guard let url = url else {
      completion(.failure(.badUrl))
      return
    }
    
    URLSession.shared.dataTask(with: url) { data, _, error in
      
      guard let data = data, error == nil else {
        completion(.failure(.invalidData))
        return
      }
      
      let newsSourceResponse = try? JSONDecoder().decode(NewsSourceResponse.self, from: data)
      completion(.success(newsSourceResponse?.sources ?? []))
      
    }.resume()
    
  }
   */
  
  func fetchNews(by sourceId: String, url: URL?, completion: @escaping (Result<[NewsArticle], NetworkError>) -> Void) {
    
    guard let url = url else {
      completion(.failure(.badUrl))
      return
    }
    
    URLSession.shared.dataTask(with: url) { data, _, error in
      
      guard let data = data, error == nil else {
        completion(.failure(.invalidData))
        return
      }
      
      let newsArticleResponse = try? JSONDecoder().decode(NewsArticleResponse.self, from: data)
      completion(.success(newsArticleResponse?.articles ?? []))
      
    }.resume()
    
  }
  
}
