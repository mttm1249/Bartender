//
//  FavoritesViewController.swift
//  Bartender
//
//  Created by Денис on 13.04.2022.
//

import UIKit

protocol DataSendingDelegateProtocol {
    func sendDataToFirstViewController(string: String)
}

class FavoritesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var delegate: DataSendingDelegateProtocol!
    
    var drinksArray: [String] = []
   
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        navigationController?.navigationBar.backgroundColor = .systemBackground
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
        tableView.reloadData()
    }
    
    private func loadData() {
        if let loadedString = UserDefaults.standard.stringArray(forKey: "favorite") {
            drinksArray = loadedString
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drinksArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = drinksArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle:   UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            drinksArray.remove(at: indexPath.row)
            
            let userDefaults = UserDefaults.standard
            var strings: [String] = userDefaults.stringArray(forKey: "favorite") ?? []
            strings.remove(at: indexPath.row)
            userDefaults.set(strings, forKey: "favorite")
            
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .middle)
            tableView.endUpdates()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedDrink = drinksArray[indexPath.row]
        let convertedString = selectedDrink.replacingOccurrences(of: " ", with: "%20")
        self.delegate?.sendDataToFirstViewController(string: convertedString)
    }
}
