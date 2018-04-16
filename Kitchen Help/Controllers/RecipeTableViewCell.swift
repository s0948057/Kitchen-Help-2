//
//  RecipeTableViewCell.swift
//  Kitchen Help
//
//  Created by Miranda Richardson on 4/14/18.
//  Copyright © 2018 Miranda Richardson. All rights reserved.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {

    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    
    var item: Recipe! {
        didSet {
            titleLabel.text? = item.title
            durationLabel.text? = item.duration
            caloriesLabel.text? = item.calories
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
