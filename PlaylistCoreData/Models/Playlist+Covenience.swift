//
//  Playlist + Covenience.swift
//  PlaylistCoreData
//
//  Created by Jack Knight on 12/12/18.
//  Copyright © 2018 Karl Pfister. All rights reserved.
//

import Foundation
import CoreData

extension Playlist {
   
    @discardableResult
    
    convenience init(name: String, song: [Song] = [], moc: NSManagedObjectContext = CoreDataStack.context) {
        
        self.init(context: moc)
        self.name = name
    }
}
