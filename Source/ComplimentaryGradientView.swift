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
    
    //MARK: public
    
    fileprivate let gradientLayer: CAGradientLayer! = CAGradientLayer()
    fileprivate var calculatedColor = [CGColor]()
    
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
            configGradient(img)
        }
    }
    
    fileprivate func configGradient(_ image: UIImage){
        let size = image.size.width > 250.0 ? CGSize.zero : image.size // avoid upscale if image less that 250px width
        if !backgroundExecution{
            configGradientWithStartColor(image.getColors(scaleDownSize: size))
        }else{
            image.getColors(scaleDownSize: size) { [weak self] colors in
                self?.configGradientWithStartColor(colors)
            }
        }
    }
    
    fileprivate func configGradientWithStartColor(_ imageColors: UIImageColors) {
        calculatedColor = gradientType.getGradientColors(imageColors)

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
