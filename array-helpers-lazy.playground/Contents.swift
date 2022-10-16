// MARK: 8. Lazy Iteration
// 'why do we need the lazy sequence?'
// - 적절한 곳에서 lazy sequence를 활용하면 보다 적은 연산으로 월하는 결과를 얻을 수 있다.

import UIKit

let indexes = 1..<5000
let lastThreeImages = indexes.lazy.filter { index -> Bool in
  print("[filter], index : \(index)")
  return index % 2 == 0
}.map { index -> String in
  print("[Map], index: \(index)")
  return "image_\(index)"
}.suffix(3)

for image in lastThreeImages {
  print(image)
}
//// 맨 마지막 3개의 값만 출력
//print(images.suffix(3))
