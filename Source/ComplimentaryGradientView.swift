//
//  ComplimentaryGradientView.swift
//  ComplimentaryGradientView
//
//  Created by George Kye on 2016-08-22.
//  Copyright © 2016 George Kye. All rights reserved.


@objc public protocol ComplimentaryGradientViewDelegate: class {
  optional func complimentaryGradientView(didSetGradient gradientView: ComplimentaryGradientView, gradientSet: Bool)
}

public class ComplimentaryGradientView: UIView{
  
  //MARK: public
    /// Gradients are created from colors are retrived from this image
  @IBInspectable var image: UIImage?
  public var gradientTpye: GradientType = .backgroundPrimary
    /// Executed fetching of image colors in background if set true. Default = false
  public var backgroundExecution: Bool = false
  public weak var delegate: ComplimentaryGradientViewDelegate?
  
  //MARK: private
  private let gradientLayer: CAGradientLayer! = CAGradientLayer()
  
  public override func layoutSubviews() {
    super.layoutSubviews()
    if let img = image{
      configGradient(img)
    }
    
  }
  
  private func configGradient(image: UIImage){
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
  
  private func configGradientWithStartColor(imageColors: UIImageColors) {
    let gradientColors = gradientTpye.getGradientColors(imageColors)
    
    gradientLayer.removeFromSuperlayer()
    gradientLayer.frame.size = self.frame.size
    gradientLayer.colors = gradientColors
    self.layer.addSublayer(gradientLayer)
    delegate?.complimentaryGradientView?(didSetGradient: self, gradientSet: true)
  }
  
}
