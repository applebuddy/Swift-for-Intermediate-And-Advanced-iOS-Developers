//
//  NewsSourceListScreen.swift
//  NewsApp
//
//  Created by Mohammad Azam on 6/30/21.
//

// MARK: 41. Tour of the News App
// async await을 이해하기 위해서는 실제 앱에 구현해보는 것이 좋습니다.

import SwiftUI

struct NewsSourceListScreen: View {
    
    @StateObject private var newsSourceListViewModel = NewsSourceListViewModel()
    
    var body: some View {
        
        NavigationView {
        
        List(newsSourceListViewModel.newsSources, id: \.id) { newsSource in
            NavigationLink(destination: NewsListScreen(newsSource: newsSource)) {
                NewsSourceCell(newsSource: newsSource)
            }
        }
        .listStyle(.plain)
        .task({ // 뷰가 onAppear 상태일때, async한 동작을 하고자 할때 사용한다.
          await newsSourceListViewModel.getSources()
        })
        .onAppear {
//            newsSourceListViewModel.getSources()
        }
        .navigationTitle("News Sources")
        .navigationBarItems(trailing: Button(action: {
            // refresh the news
        }, label: {
            Image(systemName: "arrow.clockwise.circle")
        }))
        }
    }
}

struct NewsSourceListScreen_Previews: PreviewProvider {
    static var previews: some View {
        NewsSourceListScreen()
    }
}

struct NewsSourceCell: View {
    
    let newsSource: NewsSourceViewModel 
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(newsSource.name)
                .font(.headline)
            Text(newsSource.description)
        }
    }
}
