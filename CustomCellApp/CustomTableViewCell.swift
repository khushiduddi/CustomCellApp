//
//  CustomTableViewCell.swift
//  CustomCellApp
//
//  Created by Khushi Duddi on 6/23/21.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var textField: UITextField!
    
    var flag = false;
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        self.textField.text = ""
    }
    
}
