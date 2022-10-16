// MARK: 7. forEach and enumerated
// for in loop 이외로 forEach로도 Sequence 를 순회할 수 있다.
// enumerated()를 사용하면 Element에 대한 (index, value) Tuple 형태로 값을 순회할 수 있다.

import UIKit

struct Movie {
  let title: String
  let genre: String
}

let movies = [
  Movie(title: "Lord of the Rings", genre: "Fiction"),
  Movie(title: "ET", genre: "Fiction"),
  Movie(title: "Finding Nemo", genre: "Kids"),
  Movie(title: "cars", genre: "Kids")
]

// for in loop 와 동일한 Element 순회 동작, 허나 forEach를 사용하면 도중에 break로 빠져나갈 수 없음 ㅠㅠ
movies.forEach { movie in
  print(movie)
  addToFavoriteList(movie)
}

func addToFavoriteList(_ movie: Movie) {
  
}

// enumerated는 index, value의 쌍 pair(tuple)로 element를 반환한다.
movies.forEach { movie in
  print(movie.title)
}

movies.enumerated().forEach { (index, movie) in
  print("Movie at \(index) has a title \(movie.title)") // 현재 element의 index와 value를 출력
}
