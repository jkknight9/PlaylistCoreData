//
//  PlaylistController.swift
//  PlaylistCoreData
//
//  Created by Jack Knight on 12/12/18.
//  Copyright © 2018 Karl Pfister. All rights reserved.
//

import Foundation
import CoreData

class PlaylistController {
    
     //   MARK: - Singleton
    static let sharedInstance = PlaylistController()
    
    var playlists: [Playlist] {
        let fetchRequest: NSFetchRequest<Playlist> = Playlist.fetchRequest()
        return (try? CoreDataStack.context.fetch(fetchRequest)) ?? []
    }
    
    //   MARK: - CRUD

    //   MARK: - Create
    func createPlaylist(playlistWithName name: String) {
        Playlist(name: name)
        saveToPersistentStore()
        //Save to PS
    }
    //   MARK: - Delete
    
    func deletePlaylist(playlistToDelete: Playlist) {
        CoreDataStack.context.delete(playlistToDelete)
        saveToPersistentStore()
    }
    
    func saveToPersistentStore() {
        do {
            try CoreDataStack.context.save()
        } catch {
            print("There was an error in \(#function) : \(error.localizedDescription)")
        }
    }
}
