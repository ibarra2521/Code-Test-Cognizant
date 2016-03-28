//
//  EpisodeDetail.swift
//  Cognizant
//
//  Created by Nivardo Ibarra on 3/28/16.
//  Copyright © 2016 Nivardo Ibarra. All rights reserved.
//

import UIKit

class EpisodeDetail: NSObject {
    
    var Title: String?
    var Year: String?
    var Rated: String?
    var Released: String?
    var Season: String?
    var Episode: String?
    var Runtime: String?
    var Plot: String?
    var Poster: String?
    
    override init() {
        super.init()
    }
    
    // MARK: - Constructor
    
    init(title: String, year: String, rated: String, released: String, season: String, episode: String, runtime: String, plot: String, poster: String) {
       
        self.Title = title
        self.Year = year
        self.Rated = rated
        self.Released = released
        self.Season = season
        self.Episode = episode
        self.Runtime = runtime
        self.Plot = plot
        self.Poster = poster
    }


}
