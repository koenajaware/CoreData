//
//  ViewController.swift
//  HitList
//
//  Created by Koena Jaware on 3/18/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var things: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My List"
            tableView.register(UITableViewCell.self,forCellReuseIdentifier: "Cell")
    }

    @IBAction func addName(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "New Task", message: "Add a new task", preferredStyle: .alert)
          let saveAction = UIAlertAction(title: "Save", style: .default) {
            [unowned self] action in guard let textField = alert.textFields?.first, let nameToSave = textField.text else {
                return
            }
            self.things.append(nameToSave)
            self.tableView.reloadData()
          }
    
          let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
          alert.addTextField()
          alert.addAction(saveAction)
          alert.addAction(cancelAction)
          present(alert, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return things.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)-> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for: indexPath)
    cell.textLabel?.text = things[indexPath.row]
    return cell
  }
}

