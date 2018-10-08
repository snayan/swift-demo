//
//  Meal.swift
//  demo5
//
//  Created by yang.zhang on 2018/10/6.
//  Copyright © 2018年 yang.zhang. All rights reserved.
//

import UIKit
import os.log;

class Meal: NSObject, NSCoding {
    
    // MARK: Types
    struct PropertyKey {
        static let name = "name"
        static let photo = "photo"
        static let rating = "rating"
    }
    
    // MARK: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    // MARK: Initialization
    
    init?(name: String, photo: UIImage?, rating: Int) {
        
        if name.isEmpty || rating < 0 {
            return nil
        }
        
        self.name = name
        self.photo = photo
        self.rating = rating
    }
    
    // MARK: NSCoding
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for a Meal object.", log: OSLog.default, type: .debug);
            return nil;
        }
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage;
        let rating = aDecoder.decodeInteger(forKey: PropertyKey.rating);
        
        self.init(name: name, photo: photo, rating: rating);
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name);
        aCoder.encode(photo, forKey: PropertyKey.photo);
        aCoder.encode(rating, forKey: PropertyKey.rating);
    }
    
    // MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("meals");

}
