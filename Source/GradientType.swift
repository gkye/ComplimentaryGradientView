//
//  GradientType.swift
//  ComplimentaryGradientView
//
//  Created by George Kye on 2016-08-22.
//  Copyright © 2016 George Kye. All rights reserved.
//


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
  
  func getGradientColors(colors: UIImageColors)->[CGColor]{
    switch self {
    case .backgroundPrimary:
      return [colors.backgroundColor.CGColor, colors.primaryColor.CGColor]
    case .backgroundSecondary:
      return [colors.backgroundColor.CGColor, colors.secondaryColor.CGColor]
    case .backgroundDetail:
      return [colors.backgroundColor.CGColor, colors.detailColor.CGColor]
    //Primary
    case .primaryBackground:
      return [colors.primaryColor.CGColor, colors.backgroundColor.CGColor]
    case .primarySecondary:
      return [colors.primaryColor.CGColor, colors.secondaryColor.CGColor]
    case .primaryDetail:
      return [colors.primaryColor.CGColor, colors.detailColor.CGColor]
    //Secondary
    case .secondaryBackground:
      return [colors.secondaryColor.CGColor, colors.backgroundColor.CGColor]
    case .secondaryPrimary:
      return [colors.secondaryColor.CGColor, colors.primaryColor.CGColor]
    case .secondaryDetail:
      return [colors.secondaryColor.CGColor, colors.detailColor.CGColor]
    //Detail
    case .detailBackground:
      return [colors.detailColor.CGColor, colors.backgroundColor.CGColor]
    case .detailPrimary:
      return [colors.detailColor.CGColor, colors.primaryColor.CGColor]
    case .detailSecondary:
      return [colors.detailColor.CGColor, colors.secondaryColor.CGColor]
      //All colors
    case .allColors:
      return [colors.backgroundColor.CGColor,  colors.primaryColor.CGColor, colors.secondaryColor.CGColor, colors.detailColor.CGColor]
    }
  }
}