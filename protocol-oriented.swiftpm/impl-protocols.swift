//
//  File.swift
//  protocol-oriented
//
//  Created by MinKyeongTae on 2022/10/06.
//

// MARK: 47. Generics for Protocol
// Parser는 다양한 Input에 대한 다양한 Output을 가질 수 있도록 만들고 싶습니다. 이때 associatedType을 활용해봅니다.

import Foundation

protocol Parser {
  
  // associatedType은 protocol에 살아있는 제네릭입니다. 규약 타입을 필요에 따라 다양한 타입으로 정의하여 프로토콜을 채택 사용이 가능합니다.
  associatedtype Input
  associatedtype Output
  
  func parse(input: Input) -> Output
}

class TextFileParser: Parser {
  // TextFileParser에서는 Input, Output 타입을 String으로 사용합니다.
  // associatedtype을 명시할 수 있지만 항상 명시할 필요는 없습니다. 컴파일러가 사용된 Input, Output 타입을 추론하기 때문!
  func parse(input: String) -> String {
    return ""
  }
}

class HTMLParser: Parser {
//  typealias Input = String
//  typealias Output = [String]
  // typealias로 타입 명시를 안해도 타입 추론이 되어 컴파일 가능.
  func parse(input: String) -> [String] {
    return []
  }
}

class JsonParser: Parser {
  // 단, parse의 타입을 associatedtype Input, Output으로 직접 명시하는 경우에는 typealias도 명시해주어야함
  typealias Input = String
  typealias Output = [String: String]

  func parse(input: Input) -> Output {
    return [:]
  }
}

// JsonParser의 associatedtype을 준수하는 Input을 인자로 받아서 처리 가능한 메서드
func runParser<P: Parser>(parser: P, input: [P.Input]) where P.Input == JsonParser {
  input.forEach {
    parser.parse(input: $0)
  }
}
