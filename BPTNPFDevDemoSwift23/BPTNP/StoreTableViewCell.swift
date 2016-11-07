//
//  StoreTableViewCell.swift
//  BPTNP
//
//  Created by Blumon Pay on 10/17/16.
//  Copyright © 2016 Blumon Pay. All rights reserved.
//

import UIKit

class StoreTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewProduct: UIImageView!
    @IBOutlet weak var nameOfProduct: UILabel!
    @IBOutlet weak var priceOfProduct: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
