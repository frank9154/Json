//
//  ViewController.swift
//  Json
//
//  Created by Александр Соколов on 30.01.2024.
//

import UIKit

final class CocktailsViewController: UITableViewController  {
    
    private var cocktails: [Cocktail] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCocktail()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cocktails.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CocktailCell
        
        let cocktail = cocktails[indexPath.row]
        cell.configure(with: cocktail)
        
        return cell
    }
    
}

// MARK: - Networking
extension CocktailsViewController {
    private func fetchCocktail() {
        
        guard let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita") else {
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
