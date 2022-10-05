//
//  File.swift
//  protocol-oriented
//
//  Created by MinKyeongTae on 2022/10/06.
//

import UIKit

// MARK: 46. Implementing Protocols - Airline Ticket

protocol AirlineTicket {
  var name: String { get } // 읽기 전용
  var departure: Date? { get set } // 읽기 쓰기 가능
  var arrival: Date? { get set }
}

struct Economy: AirlineTicket {
  let name = "Economy" // name은 읽기 전용이므로, 상수 선언
  var departure: Date?
  var arrival: Date?
}

struct Business: AirlineTicket {
  let name = "Business"
  var departure: Date?
  var arrival: Date?
}

struct First: AirlineTicket {
  let name = "First"
  var departure: Date?
  var arrival: Date?
}

// AirlineTicket 프로토콜을 준수하는 제네릭 타입을 갖는 클래스
class CheckoutServiceWithGeneric<Ticket: AirlineTicket> {
  
  var tickets: [Ticket]
  
  init(tickets: [Ticket]) {
    self.tickets = tickets
  }
  
  func addTicket(_ ticket: Ticket) {
    self.tickets.append(ticket)
  }
}

// 제네릭 타입 대신 아래와 같이 객체를 사용하면 class에서 AirlineTicket을 채택한 다양한 종류의 객체를 처리할 수 있다.
class CheckoutService {
  
  var tickets: [AirlineTicket]
  
  init(tickets: [AirlineTicket]) {
    self.tickets = tickets
  }
  
  func addTicket(_ ticket: AirlineTicket) {
    self.tickets.append(ticket)
  }
  
  func processTickets() {
    tickets.forEach {
      print($0)
    }
  }
}





