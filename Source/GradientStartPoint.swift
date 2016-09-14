//
//  GradientStartPoint.swift
//  ComplimentaryGradientView
//
//  Created by George Kye on 2016-08-24.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

public enum GradientStartPoint: String{
  
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
