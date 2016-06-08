//
//  Person.swift
//  TableViewCell
//
//  Created by Alexandra Norcross on 6/7/16.
//  Copyright © 2016 Alexandra Norcross. All rights reserved.
//

import Foundation

class Person {
  
  //MARK: Properties
  
  var name: String?
  var age: Int?
  
  //MARK: Initializers
  
  init(name: String) {
    
    self.name = name
  }
  
  init(name: String, age: Int) {
    
    self.name = name
    self.age = age
  }
}