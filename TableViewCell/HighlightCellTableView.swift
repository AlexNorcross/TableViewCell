//
//  HighlightCellTableView.swift
//  TableViewCell
//
//  Created by Alexandra Norcross on 6/7/16.
//  Copyright © 2016 Alexandra Norcross. All rights reserved.
//

import UIKit

protocol HighlightCellTableViewCellProtocol {
  
  var fontHighlighted: UIFont { get set }
  var fontUnhighlighted: UIFont { get set }
  
  var textColorHighlighted: UIColor { get set }
  var textColorUnhighlighted: UIColor { get set }
  
  func highlightText()
  func unhighlightText()
}

class HighlightCellTableView: UITableView, UITableViewDelegate {
  
  //MARK: Properties
  
  private var indexPathSelected = [NSIndexPath]()
  private var allowsMultipleSelections: Bool = false
  
  //MARK: Initializers
  
  init(frame: CGRect, allowsMultipleSelections: Bool) {
    super.init(frame: frame, style: UITableViewStyle.Plain)
    
    self.allowsMultipleSelections = allowsMultipleSelections
    
    self.delegate = self
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: Table View Delegate
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
    if allowsMultipleSelections == false {

      //Deselect previous
      if indexPathSelected.isEmpty == false {
        unhighlightTableViewCell(self.cellForRowAtIndexPath(indexPathSelected[0]))
      }

      //Select new
      indexPathSelected = [indexPath]
      highlightTableViewCell(self.cellForRowAtIndexPath(indexPath))

    } else {

      var selectCellAtIndexPath = true

      //Deselect previous
      let matchMe = indexPathSelected.filter({ $0 == indexPath })
      if matchMe.isEmpty == false {
        indexPathSelected.removeAtIndex(indexPathSelected.indexOf(matchMe[0])!)
        unhighlightTableViewCell(self.cellForRowAtIndexPath(matchMe[0]))
        
        selectCellAtIndexPath = false
      }

      //Select new
      if selectCellAtIndexPath {
        indexPathSelected.append(indexPath)
        highlightTableViewCell(self.cellForRowAtIndexPath(indexPath))
      }
    }
  }
  
  func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
    
    if allowsMultipleSelections == false {
      
      if indexPathSelected.isEmpty == false && indexPath == indexPathSelected[0] {
        highlightTableViewCell(cell)
        
      } else {
        unhighlightTableViewCell(cell)
      }
      
    } else {
      
      let matchMe = indexPathSelected.filter({ $0 == indexPath })
      if matchMe.isEmpty == false {
        highlightTableViewCell(cell)
      
      } else {
        unhighlightTableViewCell(cell)
      }
    }
  }
  
  //MARK: Other
  
  private func highlightTableViewCell(cellToHighlight: UITableViewCell?) {
    if let cell = cellToHighlight as? HighlightCellTableViewCellProtocol {
      cell.highlightText()
    }
  }
  
  private func unhighlightTableViewCell(cellToUnhighlight: UITableViewCell?) {
    if let cell = cellToUnhighlight as? HighlightCellTableViewCellProtocol {
      cell.unhighlightText()
    }
  }
}