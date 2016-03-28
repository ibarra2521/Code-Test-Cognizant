//
//  EpisodeDetail+.swift
//  Cognizant
//
//  Created by Nivardo Ibarra on 3/28/16.
//  Copyright © 2016 Nivardo Ibarra. All rights reserved.
//

import UIKit

//EPISODE_DETAIL
let DETAIL_TITLE_KEY = "Title"
let YEAR_KEY = "Year"
let RATED_KEY = "Rated"
let DETAIL_RELEASED_KEY = "Released"
let SEASON_KEY = "Season"
let DETAIL_EPISODE_KEY = "Episode"
let RUNTIME_KEY = "Runtime"
let PLOT_KEY = "Plot"
let POSTER_KEY = "Poster"

extension EpisodeDetail {
    
    func JSONTOEpisodeDetail(data: NSDictionary) -> EpisodeDetail {
       
        let title = data.valueForKey(DETAIL_TITLE_KEY) as! String
        let year = data.valueForKey(YEAR_KEY) as! String
        let rated = data.valueForKey(RATED_KEY) as! String
        let released = data.valueForKey(DETAIL_RELEASED_KEY) as! String
        let season = data.valueForKey(SEASON_KEY) as! String
        let episode = data.valueForKey(DETAIL_EPISODE_KEY) as! String
        let runtime = data.valueForKey(RUNTIME_KEY) as! String
        let plot = data.valueForKey(PLOT_KEY) as! String
        let poster = data.valueForKey(POSTER_KEY) as! String

         let episodeDetail = EpisodeDetail(title: title, year: year, rated: rated, released: released, season: season, episode: episode, runtime: runtime, plot: plot, poster: poster)
        
        return episodeDetail
        
    }

}


