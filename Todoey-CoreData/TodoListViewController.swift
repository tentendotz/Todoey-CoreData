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
        appearance.backgroundColor = UIColor.systemIndigo
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        
        // Customize for Bar Button Item Color
        navigationController?.navigationBar.tintColor = UIColor.white
        
    }

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
    }
    
}

