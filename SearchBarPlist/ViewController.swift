//
//  ViewController.swift
//  SearchBarPlist
//
//  Created by Abouzar Moradian on 9/9/24.
//

import UIKit

class ViewController: UIViewController {
    
    let nib = UINib(nibName: StateCell.identifier, bundle: nil)
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var usa = CountryModel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        
    }
    
    func initialSetup() {
        
        tableView.dataSource = self
        searchBar.delegate = self
        tableView.register(nib, forCellReuseIdentifier: StateCell.identifier)
        let path = Bundle.main.path(forResource: "StatePlist", ofType: "plist")
        if let path = path{
            let dict = NSDictionary(contentsOfFile: path)
            usa.setStates(states: dict?.object(forKey: "States") as! [String])
        }
        
    }


}

extension ViewController: UITableViewDataSource   {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usa.filtered.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let customCell = tableView.dequeueReusableCell(withIdentifier: StateCell.identifier, for: indexPath) as? StateCell
        
        guard let cell = customCell else { return UITableViewCell()}
        
        cell.nameLabel.text = usa.filtered[indexPath.row]
        
        return cell
    }
 
}

extension ViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        print("searchbar: \(searchText)")
        usa.search(searchText: searchText)
        self.tableView.reloadData()

    }
}

