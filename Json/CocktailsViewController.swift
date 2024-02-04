//
//  ViewController.swift
//  Json
//
//  Created by Александр Соколов on 30.01.2024.
//

import UIKit


final class CocktailsViewController: UITableViewController  {
    
    private let urlString: String = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCocktail()
    }
    
    private func fetchCocktail() {
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard self != nil else { return }
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let cocktail = try JSONDecoder().decode([Cocktail].self, from: data)
                print(cocktail)
                
            } catch {
                print(error.localizedDescription)
            }
            
        }.resume()
        
    }
    
}
