//
//  ComplimentaryGradientView.swift
//  ComplimentaryGradientView
//
//  Created by George Kye on 2016-08-22.
//  Copyright © 2016 George Kye. All rights reserved.


@objc public protocol ComplimentaryGradientViewDelegate: class {
<<<<<<< HEAD
  optional func complimentaryGradientView(didSetGradient gradientView: ComplimentaryGradientView, gradientSet: Bool)
}

public class ComplimentaryGradientView: UIView{
=======
  @objc optional func complimentaryGradientView(didSetGradient gradientView: ComplimentaryGradientView, gradientSet: Bool)
}

open class ComplimentaryGradientView: UIView{
>>>>>>> 81d9d137abfc84b01b10115f7fd45ceacd5211ca
    
  //MARK: public
  
  /// Gradients are created from colors are retrived from this image
<<<<<<< HEAD
  @IBInspectable public var image: UIImage?
=======
  @IBInspectable open var image: UIImage?
>>>>>>> 81d9d137abfc84b01b10115f7fd45ceacd5211ca
  
  @IBInspectable var type: String! = "backgroundPrimary"{
    didSet{
      gradientTpye.gradientTypeFromString(type)
    }
  }
  
<<<<<<< HEAD
  @IBInspectable var startPoint: String! = "Top"{
=======
  @IBInspectable var startPoint: String! = "top"{
>>>>>>> 81d9d137abfc84b01b10115f7fd45ceacd5211ca
    didSet{
      gradientStartPoint.startPointEnumFromString(startPoint)
    }
  }
  
<<<<<<< HEAD
  public var gradientTpye: GradientType = .backgroundPrimary
  public var gradientStartPoint: GradientStartPoint = .Top
  
  /// Executed fetching of image colors in background if set true. Default = false
  public var backgroundExecution: Bool = false
  
  public weak var delegate: ComplimentaryGradientViewDelegate?
  
  //MARK: private
  private let gradientLayer: CAGradientLayer! = CAGradientLayer()
  
  public override func layoutSubviews() {
=======
  open var gradientTpye: GradientType = .backgroundPrimary
  open var gradientStartPoint: GradientStartPoint = .top
  
  /// Executed fetching of image colors in background if set true. Default = false
  open var backgroundExecution: Bool = false
  
  open weak var delegate: ComplimentaryGradientViewDelegate?
  
  //MARK: private
  fileprivate let gradientLayer: CAGradientLayer! = CAGradientLayer()
  
  open override func layoutSubviews() {
>>>>>>> 81d9d137abfc84b01b10115f7fd45ceacd5211ca
    super.layoutSubviews()

    if let img = image{
      configGradient(img)
    }
  }
  
  
<<<<<<< HEAD
  private func configGradient(image: UIImage){
=======
  fileprivate func configGradient(_ image: UIImage){
>>>>>>> 81d9d137abfc84b01b10115f7fd45ceacd5211ca
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
  
<<<<<<< HEAD
  private func configGradientWithStartColor(imageColors: UIImageColors) {
=======
  fileprivate func configGradientWithStartColor(_ imageColors: UIImageColors) {
>>>>>>> 81d9d137abfc84b01b10115f7fd45ceacd5211ca
    let gradientColors = gradientTpye.getGradientColors(imageColors)
    
    gradientLayer.removeFromSuperlayer()
    gradientLayer.frame.size = self.frame.size
    gradientLayer.colors = gradientColors
    gradientLayer.addStartPointsToGradient(gradientStartPoint)
    self.layer.addSublayer(gradientLayer)
    delegate?.complimentaryGradientView?(didSetGradient: self, gradientSet: true)
  }
  
}
