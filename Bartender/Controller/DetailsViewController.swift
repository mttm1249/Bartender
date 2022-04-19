//
//  DetailsViewController.swift
//  Bartender
//
//  Created by Денис on 13.04.2022.
//

import UIKit
import Kingfisher

class DetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var currentDrink: Drink!
    var ingredientsArray: [String] = []
    var measureArray: [String] = []
    let feedbackGenerator = UIImpactFeedbackGenerator(style: .heavy)
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var instructionsLabel: UITextView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadIngredientsData()
        loadMeasureData()
        setupDetailsScreen()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    @IBAction func addToFavoritesButton(_ sender: Any) {
        feedbackGenerator.impactOccurred()
        animate(nameLabel)
        let userDefaults = UserDefaults.standard
        if let text = nameLabel.text {
            userDefaults.appendToFavoritesArray(by: text)
        }
    }
    
    private func animate(_ label: UILabel) {
        label.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        
        UIView.animate(withDuration: 0.9,
                       delay: 0,
                       usingSpringWithDamping: CGFloat(1.0),
                       initialSpringVelocity: CGFloat(60.0),
                       options: UIView.AnimationOptions.allowUserInteraction,
                       animations: {
            label.transform = CGAffineTransform.identity
        },
                       completion: { Void in()  }
        )
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return measureArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientCell", for: indexPath) as! IngredientCell
        cell.ingredientLabel.text = ingredientsArray[indexPath.row]
        cell.measureLabel.text = measureArray[indexPath.row]
        return cell
    }
    
    private func setupDetailsScreen() {
        if currentDrink != nil {
            let imageString = currentDrink.strDrinkThumb
            let url = URL(string: imageString)
            imageView.loadingIndicator()
            imageView.kf.setImage(with: url)
            nameLabel.text = currentDrink.strDrink
            instructionsLabel.text = currentDrink.strInstructions
        }
    }
    
    private func loadIngredientsData() {
        if currentDrink != nil {
            if let ing1 = currentDrink.strIngredient1 {
                ingredientsArray += [ing1]
            }
            if let ing2 = currentDrink.strIngredient2 {
                ingredientsArray += [ing2]
            }
            if let ing3 = currentDrink.strIngredient3 {
                ingredientsArray += [ing3]
            }
            if let ing4 = currentDrink.strIngredient4 {
                ingredientsArray += [ing4]
            }
            if let ing5 = currentDrink.strIngredient5 {
                ingredientsArray += [ing5]
            }
            if let ing6 = currentDrink.strIngredient6 {
                ingredientsArray += [ing6]
            }
            if let ing7 = currentDrink.strIngredient7 {
                ingredientsArray += [ing7]
            }
            if let ing8 = currentDrink.strIngredient8 {
                ingredientsArray += [ing8]
            }
            if let ing9 = currentDrink.strIngredient9 {
                ingredientsArray += [ing9]
            }
            if let ing10 = currentDrink.strIngredient10 {
                ingredientsArray += [ing10]
            }
        }
    }
    
    private func loadMeasureData() {
        if currentDrink != nil {
            if let mea1 = currentDrink.strMeasure1 {
                measureArray += [mea1]
            }
            if let mea2 = currentDrink.strMeasure2 {
                measureArray += [mea2]
            }
            if let mea3 = currentDrink.strMeasure3 {
                measureArray += [mea3]
            }
            if let mea4 = currentDrink.strMeasure4 {
                measureArray += [mea4]
            }
            if let mea5 = currentDrink.strMeasure5 {
                measureArray += [mea5]
            }
            if let mea6 = currentDrink.strMeasure6 {
                measureArray += [mea6]
            }
            if let mea7 = currentDrink.strMeasure7 {
                measureArray += [mea7]
            }
            if let mea8 = currentDrink.strMeasure8 {
                measureArray += [mea8]
            }
            if let mea9 = currentDrink.strMeasure9 {
                measureArray += [mea9]
            }
            if let mea10 = currentDrink.strMeasure10 {
                measureArray += [mea10]
            }
        }
    }
}
