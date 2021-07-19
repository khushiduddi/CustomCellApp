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
        
        var wordCount = 0
        let separators = CharacterSet(charactersIn: " \n\t")
        let wordComponents = textView.text.components(separatedBy: separators)
        let letters = NSCharacterSet.letters
        for word in wordComponents {
            if(word.rangeOfCharacter(from: letters) != nil) {
                wordCount = wordCount + 1
                print(wordCount)
            }
        }
        
        wordCountLabel.text = "\(wordCount)"
        
        textView.delegate = self
    }
    
    func textViewDidChange(_ textView: UITextView) {
        var wordCount = 0
        let separators = CharacterSet(charactersIn: " \n\t")
        let wordComponents = textView.text.components(separatedBy: separators)
        let letters = NSCharacterSet.letters
        for word in wordComponents {
            if(word.rangeOfCharacter(from: letters) != nil) {
                wordCount = wordCount + 1
                print(wordCount)
            }
        }
        
        wordCountLabel.text = "\(wordCount)"
        
        /* NOT USING COMPONENTS
        for char in textView.text {
            if (char == " " || char == "\n" || char == "\t") {
            wordCount = wordCount + 1
            }
        }
        if (wordCount == 0 && textView.text.count > 0) {
            wordCount = 1
        }
 */
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
