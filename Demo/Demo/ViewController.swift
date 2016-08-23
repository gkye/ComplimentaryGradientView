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
//    compGraidentView.gradientTpye = .allColors
    compGraidentView.delegate = self
  }
  
  func complimentaryGradientView(didSetGradient gradientView: ComplimentaryGradientView, gradientSet: Bool) {
    compGraidentView.bringSubviewToFront(selectedImage)
  }
  
}
