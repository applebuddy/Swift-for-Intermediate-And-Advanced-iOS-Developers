// MARK: - Section 4. Enumerations
// MARK: 15. Replacing Structs with Enums
// - 때로는 struct보다 enum을 활용하면 직관적인 데이터모델 구성, 다형성 구현 등에 이점을 가질 수 있다.

import UIKit

// enum을 활용해서 Session을 정의해보자!
enum Session {
  case keynote(title: String, speaker: String, date: Date, isRecorded: Bool)
  case normal(title: String, speaker: String, date: Date)
  case workshop(title: String, speaker: String, date: Date, isRecorded: Bool)
  case joint(title: String, speakers: [String], date: Date)
}

let keynote = Session.keynote(title: "WWDC 2021", speaker: "Tim Cook", date: Date(), isRecorded: true)
func displaySession(session: Session) {
  // 1) switch 문으로 케이스를 분기할 수도 있지만
  switch session {
  case let .keynote(title: title, speaker: speaker, date: date, isRecorded: isRecorded):
    print("\(title) - \(speaker) - \(date) - \(isRecorded)")
  case let .normal(title: title, speaker: speaker, date: date):
    print("\(title) - \(speaker) - \(date)")
  default:
    print("")
  }
  
  // 2) case let으로 enum의 특정 분기 여부만 판단해서 처리할 수도 있다.
  /*
  if case let Session.keynote(title: title, speaker: speaker, date: date, isRecorded: isRecorded) = session {
    // It is a keynote session
  }
   */
}

displaySession(session: keynote)

/*
struct Session {
  let title: String
  let speaker: String
  let data: Date
  let isKeynote: Bool
  let isWorkshop: Bool
  let isRecorded: Bool
  let isNormal: Bool
  let isJoinSession: Bool
  var jointSpeakers: [String]?
}

// 단순 struct 타입으로 Session을 정의했는데.... 초기화할 값들이 너무 많다 ㅠㅠ
let session = Session(title: "Introduction to Swift", speaker: "johndoe", data: Date(), isKeynote: false, isWorkshop: false, isRecorded: true, isNormal: true, isJoinSession: false, jointSpeakers: nil)
*/

