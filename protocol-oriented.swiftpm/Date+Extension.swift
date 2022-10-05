//
//  File.swift
//  protocol-oriented
//
//  Created by MinKyeongTae on 2022/10/06.
//

import Foundation

extension Date {
  static func fiveHoursFromNow() -> Date {
    return Date().addingTimeInterval(5 * 60 * 60)
  }
}
