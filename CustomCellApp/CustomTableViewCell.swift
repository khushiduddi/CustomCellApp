//
//  CustomTableViewCell.swift
//  CustomCellApp
//
//  Created by Khushi Duddi on 6/23/21.
//

import UIKit

class CustomTableViewCell: UITableViewCell, UITextViewDelegate {

    @IBOutlet weak var textView: UITextView!
    var delegate: MyCellDelegate?
    var name: String?
    var flag = false;
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.textView.text = name
    }
    /*override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }*/
    
    @IBAction func buttonAction(_ sender: Any) {
        self.textView.text = ""
    }
    
    
    @IBAction func deleteAction(_ sender: Any) {
        self.textView.text = ""
        
        delegate?.onClickDelete(row: self.tag)
    }
}

protocol MyCellDelegate: AnyObject {
    func onClickDelete(row: Int)
}
