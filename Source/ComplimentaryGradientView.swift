//
//  ComplimentaryGradientView.swift
//  ComplimentaryGradientView
//
//  Created by George Kye on 2016-08-22.
//  Copyright © 2016 George Kye. All rights reserved.

import Foundation
import UIKit

@objc public protocol ComplimentaryGradientViewDelegate: class {
  @objc optional func complimentaryGradientView(didSetGradient gradientView: ComplimentaryGradientView, gradientSet: Bool)
}

@IBDesignable
open class ComplimentaryGradientView: UIView{
  
  //MARK: public
  
  fileprivate let gradientLayer: CAGradientLayer! = CAGradientLayer()
  
  
  /// Gradients are created from colors are retrived from this image
  @IBInspectable open var image: UIImage?{
    didSet{
      if let img = image{
        configGradient(img)
      }
    }
  }
  
  @IBInspectable var type: String! = "backgroundPrimary"{
    didSet{
      gradientType.gradientTypeFromString(type)
    }
  }
  
  @IBInspectable var startPoint: String! = "top"{
    didSet{
      gradientStartPoint.startPointEnumFromString(startPoint)
    }
  }
  
  open var gradientType: GradientType = .backgroundPrimary
  open var gradientStartPoint: GradientStartPoint = .top
  
  /// Executed fetching of image colors in background if set true. Default = false
  open var backgroundExecution: Bool = false
  
  open weak var delegate: ComplimentaryGradientViewDelegate?
  
  //MARK: private
  
  open override func layoutSubviews() {
    super.layoutSubviews()
    if let img = image{
      configGradient(img)
    }
  }
  
  
  fileprivate func configGradient(_ image: UIImage){
    if !backgroundExecution{
      let imageColors = image.getColors()
      configGradientWithStartColor(imageColors)
    }else{
      image.getColors{
        colors in
        self.configGradientWithStartColor(colors)
      }
    }
  }
  
  fileprivate func configGradientWithStartColor(_ imageColors: UIImageColors) {
    let gradientColors = gradientType.getGradientColors(imageColors)
    
    gradientLayer.removeFromSuperlayer()
    gradientLayer.frame.size = self.frame.size
    gradientLayer.colors = gradientColors
    gradientLayer.addStartPointsToGradient(gradientStartPoint)
    self.layer.addSublayer(gradientLayer)
    delegate?.complimentaryGradientView?(didSetGradient: self, gradientSet: true)
  }
  
}
