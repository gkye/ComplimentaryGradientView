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
      return [colors.backgroundColor.cgColor, colors.primaryColor.cgColor]
    case .backgroundSecondary:
      return [colors.backgroundColor.cgColor, colors.secondaryColor.cgColor]
    case .backgroundDetail:
      return [colors.backgroundColor.cgColor, colors.detailColor.cgColor]
      
    //Primary
    case .primaryBackground:
      return [colors.primaryColor.cgColor, colors.backgroundColor.cgColor]
    case .primarySecondary:
      return [colors.primaryColor.cgColor, colors.secondaryColor.cgColor]
    case .primaryDetail:
      return [colors.primaryColor.cgColor, colors.detailColor.cgColor]
      
    //Secondary
    case .secondaryBackground:
      return [colors.secondaryColor.cgColor, colors.backgroundColor.cgColor]
    case .secondaryPrimary:
      return [colors.secondaryColor.cgColor, colors.primaryColor.cgColor]
    case .secondaryDetail:
      return [colors.secondaryColor.cgColor, colors.detailColor.cgColor]
      
    //Detail
    case .detailBackground:
      return [colors.detailColor.cgColor, colors.backgroundColor.cgColor]
    case .detailPrimary:
      return [colors.detailColor.cgColor, colors.primaryColor.cgColor]
    case .detailSecondary:
      return [colors.detailColor.cgColor, colors.secondaryColor.cgColor]
      
    //All colors
    case .allColors:
      return [colors.primaryColor.cgColor, colors.backgroundColor.cgColor, colors.secondaryColor.cgColor, colors.detailColor.cgColor]
      
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
