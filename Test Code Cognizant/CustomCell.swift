//
//  CustomCell.swift
//  Test Code Cognizant
//
//  Created by Nivardo Ibarra on 3/28/16.
//  Copyright © 2016 Nivardo Ibarra. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setCell(lblTitle: String) {
        self.lblTitle.text = lblTitle
    }

}
