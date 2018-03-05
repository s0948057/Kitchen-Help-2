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
    
    var tableViewDataSource = [Recipes]()
    
    var thisName = ""
    var recipeTitle = ""
    var recipeDuration = ""
    var recipeCalories = ""
    
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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return tableViewDataSource.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let titleLabel = cell.viewWithTag(11) as! UILabel
        let cookTimeLabel = cell.viewWithTag(12) as! UILabel
        let caloriesLabel = cell.viewWithTag(13) as! UILabel
        
        titleLabel.text = tableViewDataSource[indexPath.row].title
        cookTimeLabel.text = tableViewDataSource[indexPath.row].duration
        caloriesLabel.text = tableViewDataSource[indexPath.row].calories
        
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    // XML Parser
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        thisName = elementName
        
        if elementName == "dish" {
            var recipeTitle = ""
            var recipeDuration = ""
            var recipeCalories = ""
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
                default:
                    break
            }
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "dish" {
            var recipe = Recipes()
            recipe.title = recipeTitle
            recipe.duration = recipeDuration
            recipe.calories = recipeCalories
            
            print(recipe)
            tableViewDataSource.append(recipe)
        }
    }
}
