// MARK: 49. Example 2 - Protocol Extensions (BankAccount)
  
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

struct CheckingAccount: Account {
  
  var balance: Double

  func transfer(from: Account, to: Account, amount: Double) {
    
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
