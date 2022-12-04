//
//  UIView + Extension .swift
//  WeatherForecast
//
//  Created by Artyom Beldeiko on 2.12.22.
//

import Foundation
import UIKit

extension UIView {
    
    func addBlurEffect() {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.layer.cornerRadius = 14
        self.addSubview(blurEffectView)
    }
}

