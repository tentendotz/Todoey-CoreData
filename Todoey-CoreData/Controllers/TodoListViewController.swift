//
//  ViewController.swift
//  Todoey-CoreData
//
//  Created by tetsuta matsuyama on 2022/10/01.
//

import UIKit

class TodoListViewController: UITableViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
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

