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
  case topRight
  case topLeft
  case right
  case left
  case bottom
  case bottomRight
  case bottomLeft
  
  
  mutating func startPointEnumFromString(_ storyboardValue: String){
    switch storyboardValue {
    case GradientStartPoint.top.rawValue:
      self = .top
    case GradientStartPoint.topRight.rawValue:
      self = .topRight
    case GradientStartPoint.topLeft.rawValue:
      self = .topLeft
    case GradientStartPoint.right.rawValue:
      self = .right
    case GradientStartPoint.left.rawValue:
      self = .left
    case GradientStartPoint.bottom.rawValue:
      self = .bottom
    case GradientStartPoint.bottomRight.rawValue:
      self = .bottomRight
    case GradientStartPoint.bottomLeft.rawValue:
      self = .bottomLeft
    default:
      self = .top
    }
  }
  
}
