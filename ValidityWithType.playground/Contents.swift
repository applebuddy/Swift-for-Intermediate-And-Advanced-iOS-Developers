// MARK: 37. User Input as a Type
// - 생성자로도 throws를 붙여서 에러를 throw 가능하다.
// - Error throwing 을 활용해서 이메일 validation 등 실제 개발 간 사용 가능

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

do {
  let email = try Email("johnMungGu@gmail.com")
  print(email)
} catch {
  print(error)
}
