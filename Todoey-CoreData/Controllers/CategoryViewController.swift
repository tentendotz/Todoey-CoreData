//
//  CategoryViewController.swift
//  Todoey-CoreData
//
//  Created by tetsuta matsuyama on 2023/02/24.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {
    
    var categories = [`Category`]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCategories()
        
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
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        var textField = UITextField()
        alert.addTextField { field in
            field.placeholder = "Create new category"
            textField = field
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        let addAction = UIAlertAction(title: "Add", style: .default) { action in
            let newCategory = Category(context: self.context)
            newCategory.name = textField.text!
            newCategory.id = UUID()

            self.categories.append(newCategory)
            self.saveCategories()
            let indexPath = IndexPath(row: self.categories.count - 1, section: 0)
            self.tableView.insertRows(at: [indexPath], with: .fade)
        }
        [cancelAction, addAction].forEach { alert.addAction($0) }
        present(alert, animated: true)
    }
    
    
    //MARK: - Data Manipulation Methods
    
    func saveCategories() {
        do {
            try context.save()
        } catch {
            print("Error saving category, \(error)")
        }
    }
    
    func loadCategories(with request: NSFetchRequest<Category> = Category.fetchRequest()) {
        do {
            categories = try context.fetch(request)
        } catch {
            print("Error loading categories \(error)")
        }
        tableView.reloadData()
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
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Destructive") { action, view, completionHandler in
            self.context.delete(self.categories[indexPath.row])
            self.categories.remove(at: indexPath.row)
            self.saveCategories()
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            completionHandler(true)
        }
        
        deleteAction.image = UIImage(systemName: "trash")
        let swipeConfig = UISwipeActionsConfiguration(actions: [deleteAction])
        return swipeConfig
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }


    // MARK: - Navigation Transitions

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToItems" {
            let destinationVC = segue.destination as! TodoListViewController

            if let indexPath = tableView.indexPathForSelectedRow {
                destinationVC.selectedCategory = categories[indexPath.row]
            }
        }
    }
}
