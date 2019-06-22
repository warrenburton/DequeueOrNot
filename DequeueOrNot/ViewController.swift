//
//  ViewController.swift
//  DequeueOrNot
//
//  Created by Warren Burton on 22/06/2019.
//  Copyright © 2019 Warren Burton. All rights reserved.
//

import UIKit

class ShoutyCell: UITableViewCell {
    deinit {
        print("bye - ",textLabel?.text ?? "<empty>")
    }
}



class ViewController: UIViewController {
    
    var data = [(Int,String)]() {
        didSet{
            tableView.reloadData()
        }
    }
    
    var shouldDequeue = false

    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        data = seedData()
        title = "UIKit"
    }

    
    func seedData() -> [(Int,String)] {
        
        var target = [(Int,String)]()
        for index in 1..<500 {
            target.append((index,UUID().uuidString))
        }
        return target
    }
    
    @IBAction func dequeuePref(_ sender: UISwitch) {
        shouldDequeue = sender.isOn
        tableView.reloadData()
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let start = Date()
        
        let celldata = data[indexPath.row]
        let cell: ShoutyCell
        if shouldDequeue {
            cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ShoutyCell
        } else {
            cell = ShoutyCell(style: .subtitle, reuseIdentifier: "XCell")
        }
        
        cell.textLabel?.text = "hello \(celldata.0)"
        cell.detailTextLabel?.text = celldata.1
        
        let duration = Date().timeIntervalSince(start)
        let fps = 1.0/duration
        
        durationLabel.text = String(format:"%0.2f cell/s",fps)
        
        return cell
    }
    
    
}
