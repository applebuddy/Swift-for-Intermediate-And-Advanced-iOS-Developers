//
//  NewsSourceListViewModel.swift
//  NewsApp
//
//  Created by Mohammad Azam on 6/30/21.
//

import Foundation

// @MainActor를 선언하면 해당 객체 내에서 DispatchQueue.main 큐를 명시해서 메인스레드 동작 코드를 작성할 필요가 없어져요.
@MainActor
class NewsSourceListViewModel: ObservableObject {
    
    @Published var newsSources: [NewsSourceViewModel] = []
    
    func getSources() async {
      do {
        let newsSources = try await Webservice().fetchSourcesAsync(url: Constants.Urls.sources)
        self.newsSources = newsSources.map(NewsSourceViewModel.init)
      } catch let error {
        print(error.localizedDescription)
      }
        /*
        Webservice().fetchSources(url: Constants.Urls.sources) { result in
            switch result {
                case .success(let newsSources):
                    DispatchQueue.main.async {
                        self.newsSources = newsSources.map(NewsSourceViewModel.init)
                    }
                case .failure(let error):
                    print(error)
            }
        }
        */
    }
    
}

struct NewsSourceViewModel {
    
    fileprivate var newsSource: NewsSource
    
    var id: String {
        newsSource.id
    }
    
    var name: String {
        newsSource.name
    }
    
    var description: String {
        newsSource.description
    }
    
    static var `default`: NewsSourceViewModel {
        let newsSource = NewsSource(id: "abc-news", name: "ABC News", description: "This is ABC news")
        return NewsSourceViewModel(newsSource: newsSource)
    }
}
