//
//  CAGraidentLayer.swift
//  ComplimentaryGradientView
//
//  Created by George Kye on 2016-08-24.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation
import UIKit

extension CAGradientLayer{
  
  func addStartPointsToGradient(start_point: GradientStartPoint){
    
    switch start_point{
    case .Top:
      startPoint = CGPoint(x: 0.5, y: 0)
      endPoint = CGPoint(x: 0.5, y: 1)
    case .Right:
      startPoint = CGPoint(x: 1, y: 0.5)
      endPoint = CGPoint(x: 0, y: 0.5)
    case .Left:
      startPoint = CGPoint(x: 0, y: 0.5)
      endPoint = CGPoint(x: 1, y: 0.5)
    case .Bottom:
      startPoint = CGPoint(x: 0.5, y: 1)
      endPoint = CGPoint(x: 0.5, y: 0)
    }
    
  }
}
