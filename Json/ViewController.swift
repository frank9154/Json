//
//  ViewController.swift
//  Json
//
//  Created by Александр Соколов on 30.01.2024.
//

import UIKit


final class ViewController: UIViewController {
    
    let urlString: String = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCocktail()
    }
    
    private func fetchCocktail() {
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self else { return }
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let cocktail = try JSONDecoder().decode([Cocktail].self, from: data)
                print(cocktail.first?.strAlcoholic)
                
            } catch {
                print(error.localizedDescription)
            }
            
        }.resume()
        
    }
    
}
