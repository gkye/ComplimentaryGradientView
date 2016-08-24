//
//  GradientStartPoint.swift
//  ComplimentaryGradientView
//
//  Created by George Kye on 2016-08-24.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

public enum GradientStartPoint: String{
  
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