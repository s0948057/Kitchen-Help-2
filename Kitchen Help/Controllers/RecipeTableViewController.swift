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
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let path = Bundle.main.path(forResource: "recipes", ofType: "json") else { return }
        let url = URL(fileURLWithPath: path)
        
        do {
            let data = try Data(contentsOf: url)
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            print(json)
        } catch {
            print(error)
        }
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    // Table View Delegates
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewDataSource.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        let resultsVC = Storyboard.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController

        // Push to next view
        self.navigationController?.pushViewController(resultsVC, animated: true)
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
 
    
}
