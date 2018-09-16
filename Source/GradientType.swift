//
//  GradientType.swift
//  ComplimentaryGradientView
//
//  Created by George Kye on 2016-08-22.
//  Copyright © 2016 George Kye. All rights reserved.
//
import Foundation
import UIKit

public typealias StoryboardGradient = ([CGColor], GradientType)

public enum GradientVariant: String {
  case primary
  case secondary
  case background
  case detail
  
  func color(_ imageColors: UIImageColors) -> UIColor {
    switch self {
    case .primary:
      return imageColors.primary
    case .secondary:
      return imageColors.secondary
    case .background:
      return imageColors.background
    case .detail:
      return imageColors.detail
    }
  }
}


public enum GradientType {
  case all
  case colors(start: GradientVariant, end: GradientVariant)
  
  func gradientColors(_ colors: UIImageColors)-> [CGColor] {
    switch self {
    case .all:
      let all: [GradientVariant] = [.primary, .secondary, .background, .detail]
      return all.map{$0.color(colors).cgColor}
    case .colors(start: let start, end: let end):
      return [start, end].map{$0.color(colors).cgColor}
    }
  }
  
  
  /// Storyboard value are split by dot delimter.
  ///  First index = start color, Second index = end color
  /// - Parameter storyboardValue: IBInspectable value
  static func gradientFrom(storyboardValue: String, _ colors: UIImageColors) -> StoryboardGradient? {
    if storyboardValue.lowercased() == "all" {
      return (GradientType.all.gradientColors(colors), .all)
    }else {
      let values: [String] = storyboardValue.components(separatedBy: ".")
      guard values.count == 2,
        let start = values.first,
        values.indices.contains(1) else {
          print("ComplimentaryGradientView: GRADIENT TYPE VALUE: \"\(storyboardValue)\" DOESNT NO MATCH THE EXPECT FORMAT")
          return nil
      }
      
      var gradientColors: [GradientVariant] = []
      [start, values[1]].forEach { rawValue in
        guard let type = GradientVariant.init(rawValue: rawValue) else {
          print("ComplimentaryGradientView: GRADIENT TYPE: \"\(storyboardValue)\" NOT FOUND")
          return
        }
        gradientColors.append(type)
      }
      
      guard let s = gradientColors.first, gradientColors.indices.contains(1) else {  return nil }
      return (
        gradientColors.compactMap{$0.color(colors).cgColor},
        GradientType.colors(start: s, end: gradientColors[1])
      )
    }
  }
}

