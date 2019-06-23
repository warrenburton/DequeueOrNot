//
//  UIImage+Swatch.swift
//  DequeueOrNot
//
//  Created by Warren Burton on 23/06/2019.
//  Copyright © 2019 Warren Burton. All rights reserved.
//

import UIKit

extension UIImage {
    static func swatch(_ color: UIColor, size: CGFloat) -> UIImage {
        let xsize = CGSize(width: size, height: size)
        UIGraphicsBeginImageContextWithOptions(xsize, false, 0)
        color.setFill()
        UIRectFill(CGRect(origin: CGPoint.zero, size: xsize))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
