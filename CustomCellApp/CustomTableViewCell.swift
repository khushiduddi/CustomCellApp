//
//  CustomTableViewCell.swift
//  CustomCellApp
//
//  Created by Khushi Duddi on 6/23/21.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var textView: UITextView!
    
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
        self.textView.text = ""
    }
    
    
    @IBAction func deleteAction(_ sender: Any) {
        self.textView.text = ""
    }
    
/*
    @IBAction func onClickedDelete(_ sender: Any) {
        numberOfRows = numberOfRows - 1
        exampleTableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
    }
 */
    
}
/*
protocol MyCellDelegate: AnyObject {
    func onClickedDelete(forRowAt indexPath: IndexPath)
}
 */
