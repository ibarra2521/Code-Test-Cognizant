//
//  Episode+.swift
//  Cognizant
//
//  Created by Nivardo Ibarra on 3/28/16.
//  Copyright © 2016 Nivardo Ibarra. All rights reserved.
//

import UIKit

//EPISODE_LIST
let POST_KEY = "Episodes"
let TITLE_KEY = "Title"
let RELEASED_KEY = "Released"
let EPISODE_KEY = "Episode"
let IMDRATING_KEY = "imdbRating"
let IMDBID_KEY = "imdbID"

extension Episode {

    func JSONTOEpisode(data: NSDictionary) -> Episode {
        
        let title = data.valueForKey(TITLE_KEY) as! String
        _ = data.valueForKey(RELEASED_KEY) as! String
        let episodeNumber = data.valueForKey(EPISODE_KEY) as! String
        let rating = data.valueForKey(IMDRATING_KEY)as! String
        let id = data.valueForKey(IMDBID_KEY)as! String
        
        let episode = Episode(title: title, episode: episodeNumber, imdRating: rating, imdbID: id)
        
        return episode
        
    }
    
}
