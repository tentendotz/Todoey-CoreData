//
//  ViewController.swift
//  Todoey-CoreData
//
//  Created by tetsuta matsuyama on 2022/10/01.
//

import UIKit

// Dummy class
class Item {
    let title = ""
    var done = false
}


class TodoListViewController: UITableViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    var itemArray = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - Customize for Navigation Bar Appearance
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        appearance.backgroundColor = UIColor.systemIndigo
        searchBar.barTintColor = UIColor.systemIndigo
        
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        
        guard let navBar = navigationController?.navigationBar else { fatalError("Navigation controller does not exist.") }
        navBar.tintColor = UIColor.white
    }

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
    }
    
}


//MARK: - TableView DataSource & Delegate Methods

extension TodoListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        let item = itemArray[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = item.title
        cell.contentConfiguration = content
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
