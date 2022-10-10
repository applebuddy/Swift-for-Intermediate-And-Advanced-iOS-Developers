//
//  Webservice.swift
//  PetAdoption
//
//  Created by Mohammad Azam on 7/3/21.
//

import Foundation

protocol Webservice {
  func authenticate(_ username: String, _ password: String) -> Bool
}

class PetAdoptionService: Webservice {
  func authenticate(_ username: String, _ password: String) -> Bool {
    // 5초 대기 후 true를 반환
    sleep(5)
    return true
  }
}

class FakeAuthService: Webservice {
  func authenticate(_ username: String, _ password: String) -> Bool {
    print("FakeAuthService")
    return true
  }
}
