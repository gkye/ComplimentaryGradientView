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
  
  let gradientView = ComplimentaryGradientView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    //Colors for gradient are derived from the provided image
    compGraidentView.delegate = self
  }
  
  func complimentaryGradientView(didSetGradient gradientView: ComplimentaryGradientView, gradientSet: Bool) {
    compGraidentView.bringSubviewToFront(selectedImage)
  }
  
}
