//
//  PeopleTableViewCell.swift
//  TableViewCell
//
//  Created by Alexandra Norcross on 6/7/16.
//  Copyright © 2016 Alexandra Norcross. All rights reserved.
//

import UIKit

class PeopleTableViewCell: UITableViewCell, HighlightCellTableViewCellProtocol {

  //MARK: Properties
  
  var labelName = UILabel()
  
  //MARK: Initializers
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    var dictionarySubview = [String : AnyObject]()
    
    labelName.translatesAutoresizingMaskIntoConstraints = false
    dictionarySubview["labelName"] = labelName
    self.addSubview(labelName)
    
    
    let horizontal = NSLayoutConstraint.constraintsWithVisualFormat("H:|-20-[labelName]-20-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: dictionarySubview)
    self.addConstraints(horizontal)
    
    let centerY = NSLayoutConstraint(item: labelName, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0)
    self.addConstraint(centerY)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  //MARK: Configuration
  
  func configureForItem(item: Person) {
    
    self.selectionStyle = UITableViewCellSelectionStyle.None
    
    labelName.text = item.name
  }
  
  //MARK: Highlight Cell
  
  var fontHighlighted = UIFont(name: "Avenir-Heavy", size: 20)!
  var fontUnhighlighted = UIFont(name: "Avenir", size: 20)!
  
  var textColorHighlighted = UIColor.redColor()
  var textColorUnhighlighted = UIColor.blueColor()
  
  func highlightText() {
    labelName.font = fontHighlighted
    labelName.textColor = textColorHighlighted
  }
  
  func unhighlightText() {
    labelName.font = fontUnhighlighted
    labelName.textColor = textColorUnhighlighted
  }
}