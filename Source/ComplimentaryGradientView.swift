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

public typealias CustomPoints = (startPoint: CGPoint, endPoint: CGPoint)

@IBDesignable
open class ComplimentaryGradientView: UIView{
  
  fileprivate let gradientLayer: CAGradientLayer! = CAGradientLayer()
  fileprivate var calculatedColor = [CGColor]()
  
  /// Gradients are created from colors are retrived from this image
  @IBInspectable open var image: UIImage?{
    didSet{
      createGradient(image)
    }
  }
  
  
  /// GradientVarient storyboard value. *Avoid using via code if possible, use `gradientType`
  @IBInspectable open var gradient_type: String! = "background.primary"{
    didSet{
      if let img = image{
        gradientFrom(storyboardValue: gradient_type, img)
      }
    }
  }
  
  @IBInspectable var startPoint: String! = "top"{
    didSet{
      gradientStartPoint.startPointEnumFromString(startPoint)
    }
  }
  
  open var gradientType: GradientType!{
    didSet{
      createGradient(image)
    }
  }
  
  open var gradientStartPoint: GradientStartPoint = .top 
  open var gradientQuality: UIImageColorsQuality = .high
  
  open var customPoint: CustomPoints?
  
  /// Executed fetching of image colors in background if set true. Default = false
  open var backgroundExecution: Bool = false
  
  open weak var delegate: ComplimentaryGradientViewDelegate?
  
  //MARK: private
  
  open override func layoutSubviews() {
    super.layoutSubviews()
    if !calculatedColor.isEmpty {
      applyGradient() // apply already calculated colors
    } else
      if let img = image{
        createGradient(img)
    }
  }
  
  fileprivate func createGradient(_ image: UIImage?){
    guard let image = image else { return }
    if !backgroundExecution{
      configGradientLayer(image.getColors(quality: gradientQuality))
    }else{
      image.getColors(quality: gradientQuality) { [weak self] colors in
        self?.configGradientLayer(colors)
      }
    }
  }
  
  fileprivate func gradientFrom(storyboardValue: String, _ image: UIImage){
    let imgColors = image.getColors(quality: gradientQuality)
    guard let (calculatedColor, type) = GradientType.gradientFrom(storyboardValue: storyboardValue, imgColors ) else {
      return
    }
    self.calculatedColor = calculatedColor
    self.gradientType = type
    if !backgroundExecution{
      configGradientLayer(imgColors)
    }else {
      image.getColors(quality: gradientQuality) { [weak self] imgColors in
        self?.configGradientLayer(imgColors)
      }
    }
  }
  
  fileprivate func configGradientLayer(_ imageColors: UIImageColors) {
    guard let _ = gradientType else {
      gradientLayer.removeFromSuperlayer()
      return
    }
    calculatedColor = gradientType.gradientColors(imageColors)
    
    gradientLayer.removeFromSuperlayer()
    applyGradient()
    self.layer.insertSublayer(gradientLayer, at: 0) // always will be as background layer
    delegate?.complimentaryGradientView?(didSetGradient: self, gradientSet: true)
  }
  
  fileprivate func applyGradient() {
    gradientLayer.frame.size = self.frame.size
    gradientLayer.colors = calculatedColor
    gradientLayer.addStartPointsToGradient(gradientStartPoint, customPoint: customPoint)
  }
}
