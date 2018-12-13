//
//  SongsTableViewController.swift
//  PlaylistCoreData
//
//  Created by Karl Pfister on 12/12/18.
//  Copyright © 2018 Karl Pfister. All rights reserved.
//

import UIKit

class SongsTableViewController: UITableViewController {
    
 
    var playlist: Playlist?
    
    //MARK: Outlets
    @IBOutlet weak var artistNameTextField: UITextField!
    @IBOutlet weak var songNameTextField: UITextField!
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func addSongButtonTapped(_ sender: Any) {
        guard let songName = songNameTextField.text,
        let artistName = artistNameTextField.text,
            let unwrappedPlaylist = playlist else {return}
        SongController.sharedIntance.createSong(someWithTitle: songName, artist: artistName, playlist: unwrappedPlaylist)
    songNameTextField.text = ""
    artistNameTextField.text = ""
    tableView.reloadData()
    }
    
    
// MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlist?.songs?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
        guard let unwrappedPlaylist = playlist else {return UITableViewCell()}
        if let song = unwrappedPlaylist.songs?[indexPath.row] as? Song {
            cell.textLabel?.text = song.title
            cell.detailTextLabel?.text = song.artist
        }
        return cell
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let playlist = playlist else {return}
            guard let song = playlist.songs?[indexPath.row] as? Song else {return}
            SongController.sharedIntance.deleteSong(song: song)
            tableView.deleteRows(at: [indexPath], with: .fade)
    }
 

    
}
}
