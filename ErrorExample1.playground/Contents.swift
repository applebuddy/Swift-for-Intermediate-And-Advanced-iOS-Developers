
// MARK: 33. Types of Errors
// * Error의 종류
// - Syntax Errors : 컴파일 타임에 발생하는 빨간줄 에러
// - Runtime Errors : 없는 값에 대한 강제 언래핑 처럼 잘못된 데이터 접근 등으로 앱 동작 중에 발생하는 에러
// - 개발자 실수 : 개발자가 코드를 잘못 작성하면서 생기는 에러 (해당 에러가 있어도 앱은 동작하기 때문에 발견하거나 해결하기 힘든 에러 중 하나.)
// MARK: 34. Example 1 - Throwing Errors
// - Error 프로토콜을 채택해서 Custom Error를 정의할 수 있다.
// - Error를 throw할 가능성이 있으면 method 반환타입 앞에 throws 예약어를 붙인다.
// - Error를 throw할 수 있는 메서드 사용을 위해서는 try를 사용한다.

import UIKit

// Error 프로토콜을 채택하여 커스텀 Error를 정의할 수 있다.
enum BankAccountError: Error {
  case insufficientFunds
  case accountClosed
}

class BankAccount {
  var balance: Double
  init(balance: Double) {
    self.balance = balance
  }
  
  // error를 throw할 가능성이 있는 메서드에는 throws 예약어를 붙여주어야 한다.
  func withdraw(amount: Double) throws {
    if balance < amount {
      throw BankAccountError.insufficientFunds
    }
    
    balance -= amount
  }
}

let account = BankAccount(balance: 100)
// Error를 throw할 가능성이 있는 throws 함수를 사용하려면 앞에 try(do try, try?, try!)를 붙여서 사용한다.
do {
  try account.withdraw(amount: 300)
} catch {
  print(error) // insufficientFunds
}
