//
//  ViewController.swift
//  Demo
//
//  Created by George Kye on 2016-08-22.
//  Copyright © 2016 George Kye. All rights reserved.
//

import UIKit
import ComplimentaryGradientView

class ViewController: UIViewController, ComplimentaryGradientViewDelegate {
  
  @IBOutlet var compGraidentView: ComplimentaryGradientView!
  @IBOutlet var selectedImage: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    //Colors for gradient are derived from the provided image
    compGraidentView.delegate = self
    let custom = (startPoint: CGPoint(x: 0, y: 0.2), endPoint: CGPoint(x: 1, y: 1.2))
    compGraidentView.customPoint = custom
  }
  
  func complimentaryGradientView(didSetGradient gradientView: ComplimentaryGradientView, gradientSet: Bool) {
    compGraidentView.bringSubview(toFront: selectedImage)
  }
  
}

