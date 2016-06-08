//
//  TableViewDataSource.swift
//  TableViewCell
//
//  Created by Alexandra Norcross on 6/7/16.
//  Copyright © 2016 Alexandra Norcross. All rights reserved.
//

import UIKit

typealias TableViewCellConfiguration = (cell: UITableViewCell, indexPath: NSIndexPath, item: AnyObject?) -> ()

class TableViewDataSource: NSObject, UITableViewDataSource {
 
  //MARK: Properties
  
  var items = [AnyObject]()
  var cellId: String?
  var configurationBlock: TableViewCellConfiguration?
  
  //MARK: Intializers
  
  init(items: [AnyObject], cellId: String, configurationBlock: TableViewCellConfiguration) {
    super.init()
    
    self.items = items
    self.cellId = cellId
    self.configurationBlock = configurationBlock
  }
  
  //MARK: Table View Data Source
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCellWithIdentifier(cellId!, forIndexPath: indexPath)
    let item = items[indexPath.row]
    
    if let configuration = configurationBlock {
      configuration(cell: cell, indexPath: indexPath, item: item)
    }
    
    return cell
  }
}