//
//  RecipeTableViewController.swift
//  Kitchen Help
//
//  Created by Miranda Richardson on 2/8/18.
//  Copyright © 2018 Miranda Richardson. All rights reserved.
//

import UIKit

class RecipeTableViewController: UITableViewController, XMLParserDelegate {
    
    @IBOutlet var myTableView: UITableView!
    
    var tableViewDataSource = [Recipe]()
    
    var thisName = ""
    var recipeTitle = ""
    var recipeDuration = ""
    var recipeCalories = ""
    var recipeDescription = ""
    var recipeIngredients = ""
    var recipeImage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.dataSource = self
        myTableView.delegate = self
        
        if let path =  Bundle.main.url(forResource: "Recipes", withExtension: "xml") {
            if let parser = XMLParser(contentsOf: path) {
                parser.delegate = self
                parser.parse()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // Table View Delegates
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(tableViewDataSource.count)
        return tableViewDataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RecipeTableViewCell
        
        if let item = tableViewDataSource[indexPath.item] as? Recipe {
            cell.item = item
        }
        
        cell.recipeImage.downloadImage(from: (self.tableViewDataSource[indexPath.item].image)) /****/
 
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        let resultsVC = Storyboard.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
        
        // Information to be passed to ResultsViewController
        
        resultsVC.getTitle = tableViewDataSource[indexPath.row].title
        resultsVC.getDuration = tableViewDataSource[indexPath.row].duration
        resultsVC.getIngredients = tableViewDataSource[indexPath.row].ingredients
        resultsVC.getDirections = tableViewDataSource[indexPath.row].description
        resultsVC.getCalories = tableViewDataSource[indexPath.row].calories
        
        // Code to push image
        
        // Push to next view
        self.navigationController?.pushViewController(resultsVC, animated: true)
        
    }
        
    // XML Parsing
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        thisName = elementName
        
        if elementName == "dish" {
            var recipeTitle = ""
            var recipeDuration = ""
            var recipeCalories = ""
            var recipeIngredients = ""
            var recipeDirections = ""
            var recipeImage = ""
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        let data = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        if data.count != 0 {
            switch thisName
            {
            case "title": recipeTitle = data
            case "duration": recipeDuration = data
            case "calories": recipeCalories = data
            case "image": recipeImage = data
            case "ingredients":
                recipeIngredients = data
                recipeIngredients = recipeIngredients.replacingOccurrences(of: ", ", with: "\n")
            case "description": recipeDescription = data
                recipeDescription = data
                recipeDescription = recipeDescription.replacingOccurrences(of: "+", with: "\n\n")
            default:
                break
            }
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "dish" {
            var recipe = Recipe()
            recipe.title = recipeTitle
            recipe.duration = recipeDuration
            recipe.calories = recipeCalories
            recipe.ingredients = recipeIngredients
            recipe.description = recipeDescription
            recipe.image = recipeImage
            
            print(recipe)
            tableViewDataSource.append(recipe)
        }
    }
}

extension UIImageView {
    func downloadImage(from url: String) {
        let urlRequest = URLRequest(url: URL(string: url)!)
        let task = URLSession.shared.dataTask(with: urlRequest) { (data,response,error) in
            if error != nil {
                print(error!)
                return
            }
            DispatchQueue.main.sync {
                self.image = UIImage(data: data!)
            }
        }
        task.resume()
    }
}
