//
//  contact+extension.swift
//  RWCards
//
//  Created by Sam Davies on 17/05/2017.
//  Copyright © 2017 Raywenderlich. All rights reserved.
//

import Foundation

extension Contact {
  func contactTypeToString() -> String {
    switch type {
    case .speaker:
      return "SPEAKER"
    case .attendant:
      return "ATTENDEE"
    case .volunteer:
      return "VOLUNTEER"
    default:
      return "UNKNOWN"
    }
  }
}

