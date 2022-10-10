//
//  WebserviceFactory.swift
//  PetAdoption
//
//  Created by Mohammad Azam on 7/3/21.
//

import Foundation

class WebserviceFactory {
  
  func create() -> Webservice {
    // 테스트, 실제앱 환경 여부에 따라 다른 Service Webservice 객체를 반환
    // XCTest > XCUIApplication > launchEnvironment 설정을 통해 ENV, TEST 여부를 설정 후, TEST 가능하다.
    let environment = ProcessInfo.processInfo.environment["ENV"]
    if environment == "TEST" {
      return FakeAuthService()
    } else {
      return PetAdoptionService()
    }
    
  }
  
}
