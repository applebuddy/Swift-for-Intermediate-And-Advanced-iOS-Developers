// MARK: 17. Enums Example 1 - Airline Ticket
// * There's a Issue ... 여지껏 공통 변수가 있는 class Ticket을 잘 사용해왔는데... 새로 생긴 BuddyPass란 놈은 price가 필요없다고 한다... Ticket의 공통멤버를 고칠수는 없는 노릇이고 어떻게 해야하지??
// -> enum을 활용해보자!

import UIKit

/*
class Ticket {
  var departure: String
  var arrival: String
  var price: Double
  
  init(departure: String, arrival: String, price: Double) {
    self.departure = departure
    self.arrival = arrival
    self.price = price
  }
}
// 새로 생겨버린 BuddyPass... price가 필요없다고 한다..
// price를 0으로 두면 될까? 하지만 buddyPass는 price를 쓸 일이 없는 놈이다..
class BuddyPass: Ticket {
  
}

class Economy: Ticket {
  
}

class FirstClass: Ticket {
  var meal: Bool
  
  init(departure: String, arrival: String, price: Double, meal: Bool) {
    self.meal = meal
    super.init(departure: departure, arrival: arrival, price: price)
  }
}

class Business: Ticket {
  var meal: Bool
  var chargingPorts: Bool
  
  init(departure: String, arrival: String, price: Double, meal: Bool, chargingPorts: Bool) {
    self.meal = meal
    self.chargingPorts = chargingPorts
    super.init(departure: departure, arrival: arrival, price: price)
  }
}

func checkIn(ticket: Ticket) {
  // 서브클래식한 클래스로 타입 캐스팅을 해야 실제 객체 기능을 사용할 수 있다.
  switch ticket {
  case let ticket as Economy:
    print(ticket)
  case let ticket as FirstClass:
    print(ticket)
  case let ticket as Business:
    print(ticket)
  default:
    print("There's weird Ticket")
  }
}
*/

struct Economy {
  let departure: String
  let arrival: String
}

struct FirstClass {
  let departure: String
  let arrival: String
  let meal: Bool
}

struct Business {
  let departure: String
  let arrival: String
  let meal: Bool
  let chargingPorts: Bool
}

// 뒤늦게 새로생긴 타입이 나와도... enum으로 정의하면 나아진다. enum으로 이 문제를 해결해보자.
struct International {
  let departure: String
  let arrival: String
  let meal: Bool
  let chargingPorts: Bool
  let baggageAlowed: Bool
}

// 부모클래스로서의 Ticket이 아닌 enum 타입의 Ticket을 정의하여 사용
enum Ticket {
  case economy(Economy)
  case firstClass(FirstClass)
  case business(Business)
  // 기본 struct 들에 비해 변수 구성이 다른 경우여도 쉽게 케이스 추가가 가능 -> class로 구성했을때 발생했던 issue가 해소
  case international(International)
}

let ticket = Ticket.business(Business(departure: "Houston", arrival: "Denver", meal: true, chargingPorts: true))

// class -> enum으로 바꾸면서 생긴 장점
// 1) 타입 캐스팅 절차가 필요 없어졌다.
// 2) default 분기가 필요없어지고 분기 케이스가 명확해졌다.
// * 장점만 있는 것은 아니다.
// 앞서 공통멤버를 가진 부모클래스를 서브클래싱을 했을때와 달리, 각 케이스의 struct가 가진 멤버가 공통적인게 많지만, 전부 명시를 해야했다.
// 따라서 만약 공통멤버가 이후에도 명확하다고 확신할 수 있다면 class를 활용한 서브클래싱 방법이 오히려 나을 수도 있다. 항상 enum이 정답이 아닐수도 있다.
func checkIn(ticket: Ticket) {
  switch ticket {
  case .economy(let economy):
    print(economy)
  case .firstClass(let firstClass):
    print(firstClass)
  case .business(let business):
    print(business)
  case .international(let international):
    print(international)
  }
}
