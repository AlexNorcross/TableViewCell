//
//  MainViewController.swift
//  TableViewCell
//
//  Created by Alexandra Norcross on 6/7/16.
//  Copyright © 2016 Alexandra Norcross. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
  
  //MARK: Constants
  
  private let allowsMultipleSelections = true
  
  private let cellId = "CELL_PERSON"
  
  //MARK: Properties
  
  private var tableViewMain: HighlightCellTableView!
  private var tableDataSource: TableViewDataSource?
  
  //MARK: View Controllers
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let people = loadPeople()
    
    tableDataSource = TableViewDataSource(items: people, cellId: cellId, configurationBlock: { (cell, indexPath, item) in
      let cell = cell as! PeopleTableViewCell
      cell.configureForItem(item as! Person)
    })
    tableViewMain.dataSource = tableDataSource
  }
  
  override func loadView() {
    
    var dictionarySubview = [String : AnyObject]()
    
    let rootView = UIView(frame: UIScreen.mainScreen().bounds)
    rootView.backgroundColor = UIColor.whiteColor()
    
    tableViewMain = HighlightCellTableView(frame: rootView.frame, allowsMultipleSelections: allowsMultipleSelections)
    tableViewMain.registerClass(PeopleTableViewCell.self, forCellReuseIdentifier: cellId)
    
    tableViewMain.translatesAutoresizingMaskIntoConstraints = false
    dictionarySubview["tableViewMain"] = tableViewMain
    rootView.addSubview(tableViewMain)
    
    
    let horizontalTable = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[tableViewMain]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: dictionarySubview)
    rootView.addConstraints(horizontalTable)
    
    let verticalTable = NSLayoutConstraint.constraintsWithVisualFormat("V:|-20-[tableViewMain]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: dictionarySubview)
    rootView.addConstraints(verticalTable)
    
    self.view = rootView
  }
  
  //MARK: Other
  
  func loadPeople() -> [Person] {
  
    var people = [Person]()
  
    people.append(Person(name: "Alex"))
    people.append(Person(name: "Beau"))
    people.append(Person(name: "Charles"))
    people.append(Person(name: "David"))
    people.append(Person(name: "Eleanor"))
    people.append(Person(name: "Frankie"))
    people.append(Person(name: "Geri"))
    people.append(Person(name: "Henry"))
    people.append(Person(name: "Ivan"))
    people.append(Person(name: "Joseph"))
    people.append(Person(name: "Karen"))
    people.append(Person(name: "Luke"))
    people.append(Person(name: "Max"))
    people.append(Person(name: "Nancy"))
    people.append(Person(name: "Oscar"))
    people.append(Person(name: "Peter"))
    people.append(Person(name: "Rori"))
    people.append(Person(name: "Sarah"))
    people.append(Person(name: "Theo"))
    people.append(Person(name: "Uma"))
    people.append(Person(name: "Victor"))
    
    return people
  }
}