// MARK: 37. User Input as a Type
// - 생성자로도 throws를 붙여서 에러를 throw 가능하다.
// - Error throwing 을 활용해서 이메일 validation 등 실제 개발 간 사용 가능
// MARK: 38. try?, try! and Returning Optionals
// - do, catch 블록 없이 try?, try!로 throws method의 값을 받을 수도 있다.
//   - error처리에 관심없고 결과 값만 받고 싶을때 사용할 수 있다.

import UIKit

enum ValidationError: Error {
  case noEmptyValueAllowed
  case invalidEmail
}

func validateEmail(_ email: String) throws {
  guard !email.isEmpty else {
    throw ValidationError.noEmptyValueAllowed
  }
  
  let pattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
  let emailPredicate = NSPredicate(format: "SELF MATCHES %@", pattern)
  let isValid = emailPredicate.evaluate(with: email)
  if !isValid {
    throw ValidationError.invalidEmail
  }
}

do {
  // "johndoe@gmail.com" -> Email is valid
  // "johndoe*gmail.com" -> InvalidEmail
  // "" -> noEmptyValueAllowed
  try validateEmail("johndoe@gmail.com")
  print("Email is valid")
} catch {
  print(error)
}

struct Email {
  let text: String
  // 생성자에서도 throws로 에러처리가 가능
  init(_ text: String) throws {
    guard !text.isEmpty else {
      throw ValidationError.noEmptyValueAllowed
    }
    
    let pattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let emailPredicate = NSPredicate(format: "SELF MATCHES %@", pattern)
    let isValid = emailPredicate.evaluate(with: text)
    if isValid {
      self.text = text
    } else {
      throw ValidationError.invalidEmail
    }
  }
}

/*
do {
  let email = try Email("johnMungGu@gmail.com")
  print(email)
} catch {
  print(error)
}
*/

// - try?를 사용하면 do, catch 절을 사용안해도 된다. 만약 에러가 발생하면 nil을 반환한다.
// - try!를 사용하면 즉시 non-optional 타입으로 받을 수 있다. 하지만 만약 값이 nil인데 try!를 사용하면 앱 크래시가 발생하므로 주의해야 한다. (굳이 사용하더라도 100% 확신할때만 사용해야함)
let wrongEmail = try? Email("some thing")
print(wrongEmail) // 이메일이 유효하지 않으면 nil을 반환한다.
let validEmail = try? Email("munggu@gmail.com")
print(validEmail) // 유효한 이메일 포맷으로 에러가 발생 안했으므로 optional로 래핑된 값이 출력된다.
