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
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        loadIngredientsData()
        loadMeasureData()
        setupDetailsScreen()
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
    
    // TODO!
    private func loadIngredientsData() {
        if currentDrink != nil {
            if let ingredient1 = currentDrink.strIngredient1 {
                ingredientsArray += [ingredient1]
            }
            if let ingredient2 = currentDrink.strIngredient2 {
                ingredientsArray += [ingredient2]
            }
            if let ingredient3 = currentDrink.strIngredient3 {
                ingredientsArray += [ingredient3]
            }
            if let ingredient4 = currentDrink.strIngredient4 {
                ingredientsArray += [ingredient4]
            }
            if let ingredient5 = currentDrink.strIngredient5 {
                ingredientsArray += [ingredient5]
            }
            if let ingredient6 = currentDrink.strIngredient6 {
                ingredientsArray += [ingredient6]
            }
            if let ingredient7 = currentDrink.strIngredient7 {
                ingredientsArray += [ingredient7]
            }
            if let ingredient8 = currentDrink.strIngredient8 {
                ingredientsArray += [ingredient8]
            }
            if let ingredient9 = currentDrink.strIngredient9 {
                ingredientsArray += [ingredient9]
            }
            if let ingredient10 = currentDrink.strIngredient10 {
                ingredientsArray += [ingredient10]
            }
        }
    }
    
    // TODO!
    private func loadMeasureData() {
        if currentDrink != nil {
            if let measure1 = currentDrink.strMeasure1 {
                measureArray += [measure1]
            }
            if let measure2 = currentDrink.strMeasure2 {
                measureArray += [measure2]
            }
            if let measure3 = currentDrink.strMeasure3 {
                measureArray += [measure3]
            }
            if let measure4 = currentDrink.strMeasure4 {
                measureArray += [measure4]
            }
            if let measure5 = currentDrink.strMeasure5 {
                measureArray += [measure5]
            }
            if let measure6 = currentDrink.strMeasure6 {
                measureArray += [measure6]
            }
            if let measure7 = currentDrink.strMeasure7 {
                measureArray += [measure7]
            }
            if let measure8 = currentDrink.strMeasure8 {
                measureArray += [measure8]
            }
            if let measure9 = currentDrink.strMeasure9 {
                measureArray += [measure9]
            }
            if let measure10 = currentDrink.strMeasure10 {
                measureArray += [measure10]
            }
        }
    }
}
