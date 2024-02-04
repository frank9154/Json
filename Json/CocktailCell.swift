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
    
    
    func configure(with cocktail: Cocktail) {
        cocktailName.text = cocktail.strDrink
        alcoholicOfCocktail.text = cocktail.strAlcoholic
        recipeOfCocktail.text = cocktail.strInstructions
        
        
        DispatchQueue.global().async {
            guard let stringUrl = cocktail.strDrinkThumb else { return }
            guard let imageUrl = URL(string: stringUrl) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            
            DispatchQueue.main.async {
                self.cocktailImage.image = UIImage(data: imageData)
            }
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
