//
//  Recipe.swift
//  Kitchen Help
//
//  Created by Miranda Richardson on 4/5/18.
//  Copyright © 2018 Miranda Richardson. All rights reserved.
//

import Foundation

class Recipe {
    var title: String?
    var type: String?
    var image: URL?
    var duration: String?
    var calories: String?
    var ingredients: String?
    var description: String?

    init(title: String, type: String, image: URL, duration: String, calories: String, ingredients: String, description: String) {
        self.title = title
        self.type = type
        self.duration = duration
        self.calories = calories
        self.ingredients = ingredients
        self.description = description
    }
    
    init(recipeDictionary: [String: Any]) {
        self.title = recipeDictionary["title"] as? String
        self.type = recipeDictionary["type"] as? String
        self.image = URL(string: recipeDictionary["image"] as! String)
        self.duration = recipeDictionary["duration"] as? String
        self.calories = recipeDictionary["calories"] as? String
        self.ingredients = recipeDictionary["ingredients"] as? String
        self.description = recipeDictionary["description"] as? String
    }
    
    static func downloadRecipes() -> [Recipe] {
        var recipes = [Recipe]()
        
        let path = Bundle.main.path(forResource: "recipes", ofType: "json")
        let jsonData = NSData(contentsOfFile: path!)
        
        // turn data into foundation objects
        
        return recipes
       
    }
    
}

extension Recipe {
    static func parseJSONFromData(jsonData: Data?) -> [String : AnyObject]? {
        if let data = jsonData {
            do {
                let jsonDictionary = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String : AnyObject]
                return jsonDictionary
            } catch let error as Error {
                print("error processing json")
            }
        }
        return nil
    }
}




