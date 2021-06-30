//
//  ViewController.swift
//  CustomCellApp
//
//  Created by Khushi Duddi on 6/23/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    /*
    func onClickedDelete(forRowAt indexPath: IndexPath) {
        numberOfRows = numberOfRows - 1
        exampleTableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
    }
 */
    

    @IBOutlet weak var exampleTableView: UITableView!
    
    var numberOfRows = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exampleTableView.allowsSelection = false
        exampleTableView.delegate = self
        exampleTableView.dataSource = self
        
        self.registerTableViewCells()
        exampleTableView.tableFooterView = UIView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as? CustomTableViewCell {
                return cell
        }
        return UITableViewCell()
    }
    
    private func registerTableViewCells() {
        let textFieldCell = UINib(nibName: "CustomTableViewCell", bundle: nil)
        self.exampleTableView.register(textFieldCell, forCellReuseIdentifier: "CustomTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            numberOfRows = numberOfRows - 1
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
    
}

