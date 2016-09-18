//
//  GradientStartPoint.swift
//  ComplimentaryGradientView
//
//  Created by George Kye on 2016-08-24.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

public enum GradientStartPoint: String{
  
<<<<<<< HEAD
  case Top
  case Right
  case Left
  case Bottom
  
  mutating func startPointEnumFromString(storyboardValue: String){
    let value = storyboardValue.capitalizedString
    switch value {
    case Top.rawValue:
      self = .Top
    case Right.rawValue:
      self = .Right
    case Left.rawValue:
      self = .Left
    case Bottom.rawValue:
      self = .Bottom
    default:
      self = .Top
    }
  }
  
}
=======
  case top
  case right
  case left
  case bottom
  
  mutating func startPointEnumFromString(_ storyboardValue: String){
    let value = storyboardValue.lowercased()
    switch value {
    case GradientStartPoint.top.rawValue:
      self = .top
    case GradientStartPoint.right.rawValue:
      self = .right
    case GradientStartPoint.left.rawValue:
      self = .left
    case GradientStartPoint.bottom.rawValue:
      self = .bottom
    default:
      self = .top
    }
  }
  
}
>>>>>>> 81d9d137abfc84b01b10115f7fd45ceacd5211ca
