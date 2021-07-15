//
//  CustomTableViewCell.swift
//  CustomCellApp
//
//  Created by Khushi Duddi on 6/23/21.
//

import UIKit

class CustomTableViewCell: UITableViewCell, UITextViewDelegate {

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
        
        var count = 0
        for char in textView.text {
            if (char == " ") {
                count = count + 1
            }
        }
        if (count == 0 && textView.text.count > 0) {
            count = 1
        }
        wordCountLabel.text = "\(count)"
        
        //let wordCount = textView.text.count
        //wordCountLabel.text = "\(wordCount)"
        
        textView.delegate = self
    }
    
    func textViewDidChange(_ textView: UITextView) {
        //let currentWordCount = textView.text.count
        //wordCountLabel.text = "\(currentWordCount)"
        var count = 0
        for char in textView.text {
            if (char == " " || char == "\n" || char == "\t") {
                count = count + 1
            }
        }
        if (count == 0 && textView.text.count > 0) {
            count = 1
        }
        wordCountLabel.text = "\(count)"
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
