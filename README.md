# Swift-for-Intermediate-iOS-Developers
Study for Udemy lecture, 'Swift for Intermediate and Advanced iOS Developers'
* lecture link : https://www.udemy.com/course/swift-for-intermediate-and-advanced-ios-developers/




## Section 9: Async and Await

### 동기 코드에서 await 키워드와 함께 비동기 동작 실행하기

~~~swift
// MARK: 45. Performing Asynchronous Action from Synchronous Code
// task를 사용하면 블럭 내에서 await 예약어를 사용한 비동기 동작을 수행하여 비동기적으로 결과를 기다릴 수 있다.
Button {
	// iOS 13+
	Task {
	  // .. do something
	}
	// iOS 15+
	task {
	  // refresh the news
	  await newsSourceListViewModel.getSources()
	}
} label: {
	Text("Test Button")
}
~~~

