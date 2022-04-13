//
//  DrinkCell.swift
//  Bartender
//
//  Created by Денис on 12.04.2022.
//

import UIKit

class DrinkCell: UITableViewCell {
    
    @IBOutlet weak var drinkImage: UIImageView!
    @IBOutlet weak var drinkName: UILabel!
    @IBOutlet weak var drinkType: UILabel!
    @IBOutlet weak var drinkGlass: UILabel!
    @IBOutlet weak var drinkCategory: UILabel!
    
//    func configure(with drink: Drink) {
//        self.drinkName.text = drink.strDrink
//        self.drinkType.text = drink.strAlcoholic
//        self.drinkGlass.text = drink.strGlass
//        self.drinkBase.text = drink.strIngredient1
//    }
}
