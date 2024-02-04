//
//  CocktailCellTableViewCell.swift
//  Json
//
//  Created by Александр Соколов on 04.02.2024.
//

import UIKit

final class CocktailCell: UITableViewCell {

    @IBOutlet var cocktailImage: UIImageView!
    @IBOutlet var cocktailName: UILabel!
    @IBOutlet var alcoholicOfCocktail: UILabel!
    @IBOutlet var recipeOfCocktail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
