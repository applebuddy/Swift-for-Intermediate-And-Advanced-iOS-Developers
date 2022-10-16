// MARK: 6. filter
// 특정 조건을 충족하는 Element만 filtering할때 사용
  
import UIKit

/*
var names = ["Alex", "John", "Steven", "Mary"]
names.filter { $0.count == 4 }.forEach { print($0) }

print(names.filter { name in
  return name.count > 4
}.count)

names = names.filter { name in
  return name.count > 4
}

print(names)
*/

struct Movie {
  let title: String
  let genre: String
}

var movies = [
  Movie(title: "Lord of the Rings", genre: "Fiction"),
  Movie(title: "ET", genre: "Fiction"),
  Movie(title: "Finding Nemo", genre: "Kids"),
  Movie(title: "Cars", genre: "Kids")
]

// 애기들 용 영화만 필터링
let kidMovies = movies.filter { movie in
  return movie.genre == "Kids"
}

let movieToRemove = Movie(title: "Finding Nemo", genre: "Kids")
movies = movies.filter { movie in
  // Finding Nemo를 필터링
  return movie.title != movieToRemove.title
}

print(kidMovies)
print(movies) // "finding Nemo is removed"
