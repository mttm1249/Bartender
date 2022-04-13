//
//  DetailsViewController.swift
//  Bartender
//
//  Created by Денис on 13.04.2022.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var currentDrink: Drink!

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var textLabel: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupEditScreen()
    }
    
    private func setupEditScreen() {
        if currentDrink != nil {
            nameLabel.text = currentDrink.strDrink
            textLabel.text = currentDrink.strInstructions
        }
    }
    
    
}
