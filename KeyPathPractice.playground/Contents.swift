// MARK: KeyPath, WritableKeyPath Practice
  
import UIKit

struct Baby {
  var age: Int
  var height: Double
  let cat: Cat
  let dog: Dog
}

class Cat {
  var age: Int
  let cute: Double
  
  init(age: Int, cute: Double) {
    self.age = age
    self.cute = cute
  }
}

struct Dog {
  var age: Int
  let cute: Double
}

let cat = Cat(age: 7, cute: 321)
let dog = Dog(age: 6, cute: 200)
var baby = Baby(age: 2, height: 100, cat: cat, dog: dog)

let babyAgeWritableKeyPath = \Baby.age // WritableKeyPath<Baby, Int>
let babyHeightWritableKeyPath = \Baby.height // WritableKeyPath<Baby, Double>
let babyCatKeyPath = \Baby.cat // KeyPath<Baby, Cat> -> 변경이 불가하므로 그냥 KeyPath임
let babyCatAgeKeyPath = \Baby.cat.age // ReferenceWritableKeyPath<Baby, Int> -> class는 let으로 선언되어도 내부의 var 값을 읽고 쓰기가 모두 가능함
let babyDogKeyPath = \Baby.dog.age // KeyPath<Baby, Int> -> struct는 let으로 선언되면 내부 멤버가 var여도 변경 불가능함. 그래서 KeyPath타입.

// keypath를 따로 만들지 알고 직접 접근할때 keyPath 사용방법
print("== keypath를 따로 만들지 알고 직접 접근할때 keyPath 사용방법 ==")
print("baby age : \(baby[keyPath: \.age])")
print("baby height : \(baby[keyPath: \.height])")
print("baby's cat age : \(baby[keyPath: \.cat].age)")
print("baby's dog age : \(baby[keyPath: \.dog.age])", terminator: "\n\n")
// 그냥 KeyPath로 접근하면 읽기만 가능함. WritableKeyPath, ReferenceWritableKeyPath는 변경이 가능함
baby[keyPath: \.age] = 100
baby[keyPath: \.height] = 1000
print("baby's age : \(baby.age)")
print("baby's height : \(baby.height)")

baby[keyPath: babyHeightWritableKeyPath] = 2000 // WritableKeyPath이므로 변경이 가능함
baby[keyPath: babyCatAgeKeyPath] = 12345 // ReferenceWritableKeyPath이므로 변경이 가능함

// 따로 만든 keyPath로 접근하는 방법
print("== 따로 만든 keyPath로 접근하는 방법 ==")
print("baby age : \(baby[keyPath: babyAgeWritableKeyPath])")
print("baby height : \(baby[keyPath: babyHeightWritableKeyPath])")
print("baby's cat : \(baby[keyPath: babyCatKeyPath].age)")
print("baby's cat age : \(baby[keyPath: babyCatAgeKeyPath])")

// struct, class 모두 keyPath로 접근이 가능해요.
print("cat age : \(cat[keyPath: \.age])")
print("cat cute : \(cat[keyPath: \.cute])")
