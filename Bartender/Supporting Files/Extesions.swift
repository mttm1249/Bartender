//
//  Extesions.swift
//  Bartender
//
//  Created by Денис on 13.04.2022.
//

import UIKit

extension ViewController: UITextFieldDelegate {}
extension ViewController: UITableViewDelegate {}
extension ViewController: UITableViewDataSource {
    
    func registerTableViewCells() {
        let textFieldCell = UINib(nibName: "DrinkCell", bundle: nil)
        self.tableView.register(textFieldCell,forCellReuseIdentifier: "DrinkCell")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "DrinkCell", for: indexPath) as? DrinkCell {
            let drinks = drinks[indexPath.row]
            cell.drinkName.text = drinks.strDrink
            cell.drinkType.text = drinks.strAlcoholic
            cell.drinkGlass.text = drinks.strGlass
            cell.drinkCategory.text = drinks.strCategory
            
            let imageString = drinks.strDrinkThumb
            let url = URL(string: imageString)
            
            cell.drinkImage.loadingIndicator()
            cell.drinkImage.kf.setImage(with: url)
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drinks.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "details", sender: nil)
    }
}

extension UIImageView {
    func loadingIndicator() {
        var kf = self.kf
        kf.indicatorType = .activity
    }
}

// MARK: - Hide Keyboard Method
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
