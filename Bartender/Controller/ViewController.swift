//
//  ViewController.swift
//  Bartender
//
//  Created by Денис on 12.04.2022.
//

import UIKit
import Kingfisher

class ViewController: UIViewController, DataSendingDelegateProtocol {
    
    let apiKey = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s="
    var drinks = [Drink]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.searchTextField.delegate = self
        registerTableViewCells()
        loadData(with: apiKey)
        hideKeyboardWhenTappedAround()
    }
    
    private func loadData(with string: String) {
        if let url = URL(string: string) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
                self.tableView.reloadData()
            }
        }
    }
    
    // "Search" key pressed on keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        performAction()
        return true
    }
    
    private func performAction() {
        guard let text = searchTextField.text else { return }
        let urlString = apiKey + text
        
        loadData(with: urlString)
        searchTextField.endEditing(true)
    }
    
    @IBAction func randomButton(_ sender: Any) {
        let urlString = "https://www.thecocktaildb.com/api/json/v1/1/random.php"
        
        loadData(with: urlString)
    }
    
    private func parse(json: Data) {
        let decoder = JSONDecoder()
        if let jsonDrinks = try? decoder.decode(Drinks.self, from: json) {
            drinks = jsonDrinks.drinks
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // Passing data from FavoritesViewController
    internal func sendDataToFirstViewController(string: String) {
        let urlString = apiKey + string
        
        loadData(with: urlString)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "details" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let drink = drinks[indexPath.row]
            let detailsVC = segue.destination as! DetailsViewController
            detailsVC.currentDrink = drink
        }
        
        if segue.identifier == "favorite" {
            let secondVC: FavoritesViewController = segue.destination as! FavoritesViewController
            secondVC.delegate = self
        }
    }
    
    @IBAction func unwindSegueToMainScreen(segue: UIStoryboardSegue) {
        guard segue.identifier == "unwindSegue" else { return }
    }
}


