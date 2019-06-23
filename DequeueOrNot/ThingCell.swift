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
//0. You just DO WHAT THE FUCK YOU WANT TO

import UIKit

class ThingCell: UITableViewCell {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var swatchImage: UIImageView!
    
    deinit {
        //print("bye - ",titleLabel?.text ?? "<empty>")
    }
    
    
    static func freshCell() -> ThingCell {
        let nib = UINib(nibName: "ThingCell", bundle: nil)
        let objects = nib.instantiate(withOwner: nil, options: nil)
        guard let cell = objects.first as? ThingCell else {
            fatalError("borked project ThingCell cant instantiate from XIB")
        }
        return cell
    }
    
}
