//
//  ViewController.swift
//  CustomCellApp
//
//  Created by Khushi Duddi on 6/23/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var exampleTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exampleTableView.delegate = self
        exampleTableView.dataSource = self
        
        self.registerTableViewCells()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
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
}

