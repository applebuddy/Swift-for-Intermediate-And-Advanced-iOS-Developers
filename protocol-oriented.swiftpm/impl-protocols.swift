//
//  File.swift
//  protocol-oriented
//
//  Created by MinKyeongTae on 2022/10/06.
//

// MARK: 47. Generics for Protocol
// Parser는 다양한 Input에 대한 다양한 Output을 가질 수 있도록 만들고 싶습니다. 이때 associatedType을 활용해봅니다.
// MARK: 48. Example 1 - Protocol Extensions (Parser)
// protocol의 extension을 활용해봅니다.

import Foundation

protocol Parser {
  
  // associatedType은 protocol에 살아있는 제네릭입니다. 규약 타입을 필요에 따라 다양한 타입으로 정의하여 프로토콜을 채택 사용이 가능합니다.
  associatedtype Input
  associatedtype Output
  // Parser를 채택해서 사용하기 위해 반드시 준수해야하는 parse 메서드. parse 메서드에 사용되는 인자, 반환 타입은 associatedtype을 어떻게 정의해서 사용하느냐에 달려있다.
  func parse(input: Input) -> Output
}

// 프로토콜도 extension을 사용할 수 있습니다.
extension Parser {
  // Parser의 parse 메서드를 구현하지 않을 경우 default로 사용 가능한 메서드. typealias 정의는 하지 않았지만 메서드 구현부의 타입으로 타입추론이 가능
  func parse(input: String) -> [String] {
    return ["<html></html>", "<p></p>"]
  }
}

// XHTML 클래스와 같이 mandatory method 구현을 깜빡하고, parse 구현을 잊었을때 위 처럼 extension이 구현되어있다면 extension의 구현내용이 default로 적용되어 컴파일이 가능합니다.
class XHTMLParser: Parser {
  // mandatory method 구현은 못했지만, extension Parser에 정의된 구현이 있어서 이걸 사용하게 됨.
}

class OHTMLParser: Parser {
  // Parser를 채택한 클래스 내부에 필수 메서드를 정의했다면 extension 구현 함수와 함께 사용 가능
  // (input: Int) -> [Int] + default : (input: String) -> [String] 모두 사용 가능
  func parse(input: Int) -> [Int] {
    return [0]
  }
}

func xHTMLParser() {
  let xhtmlParser = XHTMLParser()
  xhtmlParser.parse(input: "") // extension default 구현상태인 String -> [String] 타입으로 parse메서드가 사용됨
  let ohtmlParser = OHTMLParser()
  // ohtmlParser는 extension, 클래스 내부 정의된 함수 모두 접근 가능
  ohtmlParser.parse(input: "")
  ohtmlParser.parse(input: 0)
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
