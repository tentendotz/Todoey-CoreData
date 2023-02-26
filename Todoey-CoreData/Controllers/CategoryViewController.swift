//
//  CategoryViewController.swift
//  Todoey-CoreData
//
//  Created by tetsuta matsuyama on 2023/02/24.
//

import UIKit

class Category {
    var name = ""
}

class CategoryViewController: UITableViewController {
    
    var categories = [`Category`]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let navBar = navigationController?.navigationBar else { fatalError("Navigation controller does not exist.") }
        navBar.prefersLargeTitles = true
        navBar.tintColor = UIColor.white
        
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.backgroundColor = UIColor.systemIndigo
        
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
    }

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
    }
    
}


extension CategoryViewController {
    
    // MARK: - TableView DataSource & Delegate Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = categories[indexPath.row].name
        cell.contentConfiguration = content
        
        return cell
    }
    

    /*
    // MARK: - Navigation Transitions

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
