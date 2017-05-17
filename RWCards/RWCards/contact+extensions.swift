//
//  contact+extensions.swift
//  RWCards
//
//  Created by Sam Davies on 17/05/2017.
//  Copyright © 2017 Raywenderlich. All rights reserved.
//

import Foundation

extension Contact {
  var contactTypeString: String {
    switch type {
    case .attendant:
      return "ATTENDEE"
    case .speaker:
      return "SPEAKER"
    case .volunteer:
      return "VOLUNTEER"
    default:
      return "UNKNOWN"
    }
  }
}
