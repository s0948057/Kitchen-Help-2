//
//  PantryViewController.swift
//  Kitchen Help
//
//  Created by Miranda Richardson on 2/26/18.
//  Copyright © 2018 Miranda Richardson. All rights reserved.
//

import UIKit

class PantryViewController: UIViewController {

    @IBOutlet weak var pantryIngredientTextField: UITextField!
    
    @IBOutlet weak var pantryListTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    func displayPantryIngredients() {
        
        /*
         Reads Plist path
         Displays ingredients from Plist to Text Area
         */
    }
 
    @IBAction func btnSubmitToPantry(_ sender: UIButton) {
        
        /* Button Submit
         Reads text field input, saves input to Plist
         */
        
        displayPantryIngredients()
        pantryIngredientTextField.text = ""
        
    }

}
