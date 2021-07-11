//
//  CustomTableViewCell.swift
//  CustomCellApp
//
//  Created by Khushi Duddi on 6/23/21.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var wordCountLabel: UILabel!
    var delegate: MyCellDelegate?
    var name: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.textView.text = name
        let wordCount = textView.text.count
        wordCountLabel.text = "\(wordCount)"
    }
    
/*
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
     }
 */
    
    @IBAction func buttonAction(_ sender: Any) {
        self.textView.text = ""
        wordCountLabel.text = "0"
    }
    
    
    @IBAction func deleteAction(_ sender: Any) {
        self.textView.text = ""
        
        delegate?.onClickDelete(row: self.tag)
    }
    
}

protocol MyCellDelegate: AnyObject {
    func onClickDelete(row: Int)
}
