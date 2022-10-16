// MARK: 21. Computed Properties
// 계산 프로퍼티는 읽기, 쓰기를 할때 다른 계산용 프로퍼티를 함께 활용해서 특정 연산을 한 뒤 동작시킬 수 있다.
  
import UIKit

struct CartItem {
  let name: String
  let price: Double
}

struct Cart {
  let items: [CartItem]
  /// 읽기 전용 계산프로퍼티 예시 2)
  var total: Double {
    return items.reduce(0) {
      return $0 + $1.price
    }
  }
  
  var temp: Double
  var computedProperty: Double {
    get {
      return temp * 2
    }
    
    set(newValue) {
      temp = newValue * 2
    }
  }
}

let items = [CartItem(name: "Bread", price: 4.50),
             CartItem(name: "Tomato", price: 2.60),
             CartItem(name: "Apple", price: 4.80),
             CartItem(name: "Banana", price: 3.50)]

var cart = Cart(items: items, temp: 0)
print(cart.computedProperty) // 0.0 * 2 ==> 0.0이 출력
cart.temp = 2
print(cart.computedProperty) // 2.0 * 2 ==> 4.0이 출력
cart.computedProperty = 4.0 // temp에 4.0 * 2 ==> 8.0이 설정
print(cart.temp) // 8.0
print(cart.computedProperty) // 8.0 * 2 ==> 16.0이 출력
print(cart.total)

/*
struct Workout {
  let startTime: Date
  let endTime: Date
  
  /// 읽기 전용 계산 프로퍼티, 초기화된 startTime, endTime에 맞게 연산된 결과를 반환한다.
  var timeElapsed: TimeInterval {
    endTime.timeIntervalSince(startTime)
  }
}

let start = Date()
sleep(5)
let end = Date()

let workout = Workout(startTime: start, endTime: end)

//print(workout.endTime.timeIntervalSince(workout.startTime))
print(workout.timeElapsed)
*/
