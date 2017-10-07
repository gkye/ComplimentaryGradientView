//
//  GradientType.swift
//  ComplimentaryGradientView
//
//  Created by George Kye on 2016-08-22.
//  Copyright © 2016 George Kye. All rights reserved.
//
import Foundation
import UIKit

public enum GradientType: String{
  
  //background
  case backgroundPrimary
  case backgroundSecondary
  case backgroundDetail
  //primary
  case primaryBackground
  case primarySecondary
  case primaryDetail
  //secondary
  case secondaryBackground
  case secondaryPrimary
  case secondaryDetail
  //detail
  case detailBackground
  case detailPrimary
  case detailSecondary
  //AllColors
  case allColors
  
  func getGradientColors(_ colors: UIImageColors)->[CGColor]{
    switch self {
      
    //Background
    case .backgroundPrimary:
      return [colors.background.cgColor, colors.primary.cgColor]
    case .backgroundSecondary:
      return [colors.background.cgColor, colors.secondary.cgColor]
    case .backgroundDetail:
      return [colors.background.cgColor, colors.detail.cgColor]
      
    //Primary
    case .primaryBackground:
      return [colors.primary.cgColor, colors.background.cgColor]
    case .primarySecondary:
      return [colors.primary.cgColor, colors.secondary.cgColor]
    case .primaryDetail:
      return [colors.primary.cgColor, colors.detail.cgColor]
      
    //Secondary
    case .secondaryBackground:
      return [colors.secondary.cgColor, colors.background.cgColor]
    case .secondaryPrimary:
      return [colors.secondary.cgColor, colors.primary.cgColor]
    case .secondaryDetail:
      return [colors.secondary.cgColor, colors.detail.cgColor]
      
    //Detail
    case .detailBackground:
      return [colors.detail.cgColor, colors.background.cgColor]
    case .detailPrimary:
      return [colors.detail.cgColor, colors.primary.cgColor]
    case .detailSecondary:
      return [colors.detail.cgColor, colors.secondary.cgColor]
      
    //All colors
    case .allColors:
      return [colors.primary.cgColor, colors.background.cgColor, colors.secondary.cgColor, colors.detail.cgColor]
      
    }
  }
  
  mutating func gradientTypeFromString(_ storyboardValue: String){
    
    switch storyboardValue{
      
      //All colors
    case GradientType.allColors.rawValue:
      self = .allColors
      
    //Background
    case GradientType.backgroundPrimary.rawValue:
      self = .backgroundPrimary
    case GradientType.backgroundSecondary.rawValue:
      self = .backgroundSecondary
    case GradientType.backgroundDetail.rawValue:
      self = .backgroundDetail
      
    //Primary
    case GradientType.primaryBackground.rawValue:
      self = .primaryBackground
    case GradientType.primarySecondary.rawValue:
      self = .primarySecondary
    case GradientType.primaryDetail.rawValue:
      self = .primaryDetail
      
    //Secondary
    case GradientType.secondaryBackground.rawValue:
      self = .secondaryBackground
    case GradientType.secondaryPrimary.rawValue:
      self = .secondaryPrimary
    case GradientType.secondaryDetail.rawValue:
      self = .secondaryDetail
      
    //Detail
    case GradientType.detailBackground.rawValue:
      self = .detailBackground
    case GradientType.detailPrimary.rawValue:
      self = .detailPrimary
    case GradientType.detailSecondary.rawValue:
      self = .detailSecondary
      
    default:
      self = .backgroundPrimary
    }
  }
}
