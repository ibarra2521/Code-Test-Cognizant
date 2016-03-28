//
//  Episode.swift
//  Cognizant
//
//  Created by Nivardo Ibarra on 3/28/16.
//  Copyright © 2016 Nivardo Ibarra. All rights reserved.
//

import UIKit

class Episode: NSObject{
    
    var Title: String?
    var Released: String?
    var EpisodeNo: String?
    var ImdbRating: String?
    var ImdbID: String?
    var Details: EpisodeDetail?
    
    override init() {
        super.init()
    }
    
    // MARK: - Constructor
    
    init(title: String, episode: String, imdRating: String, imdbID: String) {
        self.Title = title
        self.EpisodeNo = episode
        self.ImdbRating = imdRating
        self.ImdbID = imdbID
    }

}