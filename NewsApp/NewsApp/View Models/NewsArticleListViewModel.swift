//
//  NewsArticleListViewModel.swift
//  NewsApp
//
//  Created by Mohammad Azam on 6/30/21.
//

import Foundation

// MARK: 44. Replacing Dispatch with MainActor
// @MainActor를 사용하면 해당 객체는 항상 main thread에서 동작하게 된다.
@MainActor
class NewsArticleListViewModel: ObservableObject {
    
    @Published var newsArticles = [NewsArticleViewModel]()
    
    func getNewsBy(sourceId: String) async {
        
      do {
        let newsArticles = try await Webservice().fetchNewsAsync(sourceId: sourceId, url: Constants.Urls.topHeadlines(by: sourceId))
        self.newsArticles = newsArticles.map(NewsArticleViewModel.init)
      } catch let error {
        print(error.localizedDescription)
      }
      /*
        Webservice().fetchNews(by: sourceId, url: Constants.Urls.topHeadlines(by: sourceId)) { result in
            switch result {
                case .success(let newsArticles):
                    DispatchQueue.main.async {
                        self.newsArticles = newsArticles.map(NewsArticleViewModel.init)
                    }
                case .failure(let error):
                    print(error)
            }
        }
      */
    }
    
}

struct NewsArticleViewModel {
    
    let id = UUID()
    fileprivate let newsArticle: NewsArticle
    
    var title: String {
        newsArticle.title
    }
    
    var description: String {
        newsArticle.description ?? ""
    }
    
    var author: String {
        newsArticle.author ?? ""
    }
    
    var urlToImage: URL? {
        URL(string: newsArticle.urlToImage ?? "")
    }
    
}
