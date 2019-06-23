//
//  Thing.swift
//  DequeueOrNot
//
//  Created by Warren Burton on 23/06/2019.
//  Copyright © 2019 Warren Burton. All rights reserved.
//

import Foundation
import SwiftUI

struct Thing: Identifiable {
    var id: Int
    var guid: String
    var color: UIColor
}

extension Thing {
    static func seedData() -> [Thing] {
        
        var target = [Thing]()
        for index in 1..<500 {
            target.append(Thing(id:index,guid:UUID().uuidString, color: randomColor()))
        }
        return target
    }
    
    static func randomColor() -> UIColor {
        let value = arc4random_uniform(3)
        switch value {
        case 0:
            return .red
        case 1:
            return .orange
        case 2:
            return .green
        default:
            return .blue
        }
    }
    
}
