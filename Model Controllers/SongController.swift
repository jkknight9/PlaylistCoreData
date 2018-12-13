//
//  SongController.swift
//  PlaylistCoreData
//
//  Created by Jack Knight on 12/12/18.
//  Copyright © 2018 Karl Pfister. All rights reserved.
//

import Foundation
import CoreData

class SongController {
    
     static let sharedIntance = SongController()
    
     //   MARK: - CRUD
    func createSong(someWithTitle title: String, artist: String, playlist: Playlist) {
        Song(title: title, artist: artist, playlist: playlist)
            PlaylistController.sharedInstance.saveToPersistentStore()
    }
    
    func deleteSong(song: Song) {
        CoreDataStack.context.delete(song)
        PlaylistController.sharedInstance.saveToPersistentStore()
    }
    
    
}
