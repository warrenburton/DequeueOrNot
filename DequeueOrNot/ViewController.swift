//DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
//Version 2, December 2004
//
//Copyright (C) 2019 Warren Burton
//
//Everyone is permitted to copy and distribute verbatim or modified
//copies of this license document, and changing it is allowed as long
//as the name is changed.
//
//DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
//TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
//
//0. You just DO WHAT THE FUCK YOU WANT TO.

import UIKit


class ViewController: UIViewController {
    
    var data = [Thing]() {
        didSet{
            tableView.reloadData()
        }
    }
    
    var maxRate = 0.0
    var minRate = 100000.0
    var shouldDequeue = false
    
    let reuseID = "XCell"

    @IBOutlet var maxLabel: UILabel!
    @IBOutlet var minLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "ThingCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: reuseID)
        tableView.rowHeight = CGFloat(64.0)
        data = Thing.seedData()
        title = "UIKit"
    }

    
    @IBAction func dequeuePref(_ sender: UISwitch) {
        shouldDequeue = sender.isOn
        maxRate = 0.0
        minRate = 100000.0
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
        let cell: ThingCell
        if shouldDequeue {
            cell = tableView.dequeueReusableCell(withIdentifier: reuseID, for: indexPath) as! ThingCell
        } else {
            cell = ThingCell.freshCell()
        }
        
        cell.titleLabel.text = "hello \(celldata.id)"
        cell.subtitleLabel?.text = celldata.guid
        cell.swatchImage.image = UIImage.swatch(celldata.color, size: cell.swatchImage.bounds.height)
        
        let duration = Date().timeIntervalSince(start)
        let fps = 1.0/duration
        
        maxRate = max(fps,maxRate)
        minRate = min(fps, minRate)
        
        maxLabel.text = String(format:"%0.2f cell/s",maxRate)
        minLabel.text = String(format:"%0.2f cell/s",minRate)
        
        return cell
    }
    
    
}
