//
//  Meal.swift
//  FoodTracker
//
//  Created by Sneha gindi on 08/11/16.
//  Copyright © 2016 Sneha gindi. All rights reserved.
//

import UIKit

class Meal: NSObject {
    
    //Properties
    
    var name: String = ""
    
    var photo: UIImage?
    
    var rating: Int
    
    //Mark: Archiving Paths
    
   // static let documentsDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask , true)
   // static let ArchiveUrl = documentsDirectory.appendingPathComponent("meals")
    
    //Mark: Types
    
   // struct propertyKey {
     //   static let nameKey = "name"
       // static let photoKey = "photo"
      //  static let ratingKey = "rating"
    //}
    
    //Initailization
    
    init?(name: String, photo: UIImage?, rating: Int) {
        //Initialize stored properties
        self.name = name
        self.photo = photo
        self.rating = rating
        
        super.init()
        
        // Initialization should return error if name is empty or rating is negative
        if (name.isEmpty || rating < 0 ) {
            return nil
        }
    }
    //Mark: NSCoding
    //func encode(with aCoder: NSCoder) {
       // aCoder.encode(name, forKey: propertyKey.nameKey)
     //   aCoder.encode(photo, forKey: propertyKey.photoKey)
      //  aCoder.encode(rating, forKey: propertyKey.ratingKey)
    //}
   /// required convenience init?(coder aDecoder: NSCoder) {
        
      //  let name = aDecoder.decodeObject(forKey: propertyKey.nameKey) as! String
        
        // Since photo is an optional property of meal, use conditional cast.
        
        //let photo = aDecoder.decodeObject(forKey: propertyKey.photoKey) as? UIImage
      //  let rating = aDecoder.decodeInteger(forKey: propertyKey.ratingKey)
        
       // Must call designated initailizer
        
      //  self.init(name: name, photo: photo, rating, rating)
    //}
    
   // func appendingPathComponents(_: String, isDirectory: Bool) {
     //   let archiveURL = Meal.documentsDirectory.appendingPathComponent("meals", isDirectory: true)

    //}
}
