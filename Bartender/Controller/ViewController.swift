//
//  ViewController.swift
//  Bartender
//
//  Created by Денис on 12.04.2022.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    
    var drinks = [Drink]()
    let urlString = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=gin"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchTextField.delegate = self
        registerTableViewCells()
        hideKeyboardWhenTappedAround()
    }
    
    func loadData(with string: String) {
        if let url = URL(string: string) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
                self.tableView.reloadData()
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.resignFirstResponder()
        performAction()
        return true
    }
    
    private func performAction() {
        findButton(self)
    }
    
    @IBAction func randomButton(_ sender: Any) {
        let urlString = "https://www.thecocktaildb.com/api/json/v1/1/random.php"
        loadData(with: urlString)
    }
    @IBAction func findButton(_ sender: Any) {
        guard let text = searchTextField.text else { return }
        let urlString = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=" + "\(text)"

        loadData(with: urlString)
        searchTextField.endEditing(true)
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        if let jsonDrinks = try? decoder.decode(Drinks.self, from: json) {
            drinks = jsonDrinks.drinks
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "details" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            
            let drink = drinks[indexPath.row]
            let detailsVC = segue.destination as! DetailsViewController
            detailsVC.currentDrink = drink
        }
    }
}


