//
//  ViewController.swift
//  CustomCellApp
//
//  Created by Khushi Duddi on 6/23/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MyCellDelegate {
    
    @IBOutlet weak var exampleTableView: UITableView!
    
    private var animals = ["dog", "cat", "lion", "bear"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exampleTableView.allowsSelection = false
        exampleTableView.delegate = self
        exampleTableView.dataSource = self
        
        self.registerTableViewCells()
        exampleTableView.tableFooterView = UIView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as? CustomTableViewCell {
            cell.delegate = self
            cell.name = animals[indexPath.row]
            cell.tag = indexPath.row
            return cell
        }
        return UITableViewCell()
    }
    
    private func registerTableViewCells() {
        let textFieldCell = UINib(nibName: "CustomTableViewCell", bundle: nil)
        self.exampleTableView.register(textFieldCell, forCellReuseIdentifier: "CustomTableViewCell")
    }
    /*
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            numberOfRows = numberOfRows - 1
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
 */
    
    func onClickDelete(row: Int) {
        self.animals.remove(at: row)
        //self.exampleTableView.reloadRows(at: [IndexPath(row: row, section: 0)], with: .fade)
        self.exampleTableView.reloadData()
    }
    
    
    
}

