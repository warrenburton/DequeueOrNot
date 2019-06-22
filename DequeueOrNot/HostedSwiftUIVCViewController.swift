//
//  HostedSwiftUIVCViewController.swift
//  DequeueOrNot
//
//  Created by Warren Burton on 22/06/2019.
//  Copyright © 2019 Warren Burton. All rights reserved.
//

import UIKit
import SwiftUI

class HostedSwiftUIVCViewController: UIViewController {

    
    func seedData() -> [Thing] {
        
        var target = [Thing]()
        for index in 1..<500 {
            target.append(Thing(id:index,guid:UUID().uuidString))
        }
        return target
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let hostingViewController = UIHostingController(rootView: SwiftUIView(things: seedData()))
        
        view.embed(hostingViewController.view)
        addChild(hostingViewController)

    }
    

}
