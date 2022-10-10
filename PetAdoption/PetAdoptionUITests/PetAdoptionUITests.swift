//
//  PetAdoptionUITests.swift
//  PetAdoptionUITests
//
//  Created by Mohammad Azam on 7/3/21.
//

import XCTest

// 언제 사용자가 올바른 신용정보를 작성하고 로그인 버튼을 눌렀을까? 테스트 하는 클래스
class When_user_fills_correct_credentials_and_press_login_button: XCTestCase {
  
  private var app: XCUIApplication!
  
  override func setUp() {
    // 테스트 전 초기 셋팅
    super.setUp()
    continueAfterFailure = false
    self.app = XCUIApplication()
    self.app.launchEnvironment = ["ENV": "TEST"]
    self.app.launch()
  }
  
  func test_should_display_lock_successfully() {
    // 앱에서 사용하는 UI에 .accessibility(identifier:)를 지정한 후, XCTest에 해당 UI을 사용하여 tap 등의 event 테스트를 할 수 있다.
    let usernameTextField = self.app.textFields["usernameTextField"]
    let passwordTextField = self.app.textFields["passwordTextField"]
    let loginButton = self.app.buttons["loginButton"]
    // tap, typeText 이벤트 진행, 시뮬레이터로 자동으로 다양한 이벤트를 수행, 테스트를 진행할 수 있다.
    usernameTextField.tap()
    usernameTextField.typeText("johndoe")
    passwordTextField.tap()
    passwordTextField.typeText("password")
    loginButton.tap()
    
    let imageLock = self.app.images["imageLock"]
    // 이미지가 존재하지 않으면 에러 발생
    XCTAssertTrue(imageLock.exists)
  }
  
}
