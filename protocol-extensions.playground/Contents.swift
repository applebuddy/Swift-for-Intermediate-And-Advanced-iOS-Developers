// MARK: 49. Example 2 - Protocol Extensions (BankAccount)
// - protocol extension의 구현부가 있으면 protocol을 채택한 곳에서 메서드를 구현하지 않을경우, extension의 구현이 default로 사용된다.
// - 만약 protocol을 채택한 곳에서 메서드를 구현했다면, extension 구현내용 상관없이 지역적으로 구현한 기능 대로 동작한다.
// MARK: 50. Excample 3 - Multiple Extensions (BankAccount)
  
import UIKit

protocol Account {
  var balance: Double { get set }
  /// 입금
  mutating func deposit(_ amount: Double)
  /// 출금
  mutating func withdraw(_ amount: Double)
  /// 이체
  func transfer(from: Account, to: Account, amount: Double)
  /// 이자 계산
  func calculateInterestEarned() -> Double
}

struct VerificationRequest {
  let account: [Account]
}

struct VerificationResponse {
  let verified: Bool
}

protocol Verification {
  func performVerification(_ request: VerificationRequest, completion: (VerificationResponse) -> Void)
}

extension Verification {
  func performVerification(_ request: VerificationRequest, completion: (VerificationResponse) -> Void) {
    // perform the verificatio n
  }
}

// protocol의 extension에 implementation을 하게 되면,
// 해당 프로토콜을 채택한 애들이 protocol 준수를 위한 메서드 정의를 하지 않았을때, default로 사용할 수 있다.
// 물론 프로토콜을 채택한 곳에서 별도로 구현을하면 해당 기능대로 동작하게 된다.
extension Account {
  mutating func deposit(_ amount: Double) {
    balance += amount
  }
  
  mutating func withdraw(_ amount: Double) {
    balance -= amount
  }
  
  func calculateInterestEarned() -> Double {
    return (balance * (0.1/100))
  }
}

struct CheckingAccount: Account, Verification {
  
  var balance: Double

  func transfer(from: Account, to: Account, amount: Double) {
    // CheckingAccount가 채택 중인 Verification에 대한 메서드 구현이 별도로 없지만, extension Verification 블럭에서 default 메서드 구현이 되어있으므로, default 메서드를 사용할 수 있다.
    performVerification(VerificationRequest(account: [from, to])) { response in
      if response.verified {
        // transfer funds
      }
    }
  }
}

struct MonkeyMarketAccount: Account {
  
  var balance: Double
  
  func calculateInterestEarned() -> Double {
    return balance * 20000.0
  }

  func transfer(from: Account, to: Account, amount: Double) {
    
  }
}

var checkingAccount = CheckingAccount(balance: 100)
checkingAccount.deposit(200)
// checkingAccount는 calculateInterestEarned 메서드에 대한 구현을 별도로 하지 않았다. 따라서 extension Account에서 구현된 default 메서드 방식으로 동작한다.
print(checkingAccount.calculateInterestEarned())
var monkeyAccount = MonkeyMarketAccount(balance: 200)
monkeyAccount.withdraw(100)
// monkeyAccount는 calculateInterestEarned 메서드에 대한 구현을 별도로 했다. 따라서 별도 구현한 내용대로 동작한다.
print(monkeyAccount.calculateInterestEarned())
