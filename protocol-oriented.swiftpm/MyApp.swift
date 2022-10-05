import SwiftUI

@main
struct MyApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView().onAppear {
        implementingProtocols_46()
      }
    }
  }
  
  func implementingProtocols_46() {
    let economyTickets = [Economy(departure: Date(), arrival: Date.fiveHoursFromNow())]
    // AirlineTickets 프로토콜을 채택한 객체라면 CheckoutService 생성자의 인자로 넣을 수 있다.
    // 하지만 생성자 호출 이후에는 생성당시 인자로 사용했던 객체 타입에 한하여 추가가 가능하다.
    let service = CheckoutServiceWithGeneric(tickets: economyTickets)
    let service2 = CheckoutService(tickets: economyTickets)
    
    // ex) Economy 타입으로 생성했으면, First, Business 타입은 추가할 수 없음 -> Economy 타입으로 생성된 순간 Economy 타입만 추가가 가능함
    // -> Cannot convert value of type 'First' to expected argument type 'Economy'
    //  service.addTicket(First(departure: Date(), arrival: Date.fiveHoursFromNow()))
    // 물론 동일한 타입인 Economy 객체는 추가 가능함. 실생활에서는 상황에따라 다양한 종류의 티켓을 예약할 수 있는데...
    service.addTicket(Economy(departure: Date(), arrival: Date.fiveHoursFromNow()))
    
    // CheckoutService class에서는 AirlineTickets를 채택한 다양한 타입을 추가할 수 있다.
    service2.addTicket(First(departure: Date(), arrival: Date.fiveHoursFromNow()))
    service2.addTicket(Business(departure: Date(), arrival: Date.fiveHoursFromNow()))
    service2.processTickets()
    /*
    Economy(name: "Economy", departure: Optional(2022-10-05 18:40:37 +0000), arrival: Optional(2022-10-05 23:40:37 +0000))
    First(name: "First", departure: Optional(2022-10-05 18:40:37 +0000), arrival: Optional(2022-10-05 23:40:37 +0000))
    Business(name: "Business", departure: Optional(2022-10-05 18:40:37 +0000), arrival: Optional(2022-10-05 23:40:37 +0000))
    */
  }
}
