//
//  ResultTableViewCell.swift
//  QuizInterViewApp
//
//  Created by Sukumar Anup Sukumaran on 21/05/18.
//  Copyright © 2018 TechTonic. All rights reserved.
//

import UIKit

class ResultTableViewCell: UITableViewCell {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var selectedLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
