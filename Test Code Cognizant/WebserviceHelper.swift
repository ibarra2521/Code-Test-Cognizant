//
//  WebserviceHelper.swift
//  Assigment
//
//  Created by Nivardo Ibarra on 3/17/16.
//  Copyright © 2016 Nivardo Ibarra. All rights reserved.
//

import Foundation

let URL_STRING_EPISODE_LIST = "https://www.omdbapi.com/?t=Game%20of%20Thrones&Season="
let URL_STRING_EPISODE_DETAIL = "https://www.omdbapi.com/?i=%@&plot=short&r=json"
let URL_STRING_REPOS = "https://api.github.com/users"

// MARK: - Protocols

@objc protocol WebserviceHelperDelegate {

    optional func webserviceHelper (webserviceHelper:WebserviceHelper, didDownloadEpisodes episodeItem: Episode);
    optional func webserviceHelper (webserviceHelper:WebserviceHelper, didDownloadDetails detailsItem: EpisodeDetail);
}

// MARK: - Class Helper: WebserviceHelper

class WebserviceHelper: NSObject, ParsingHelperDelegate {
    
    var delegate: WebserviceHelperDelegate?;
    var parsingHelper = ParsingHelper();
    
    override init() {
        super.init();
        parsingHelper.delegate = self;
    }
    
    // MARK: Download User's Repo data from the URL
    func loadDataFromWebService (season: Int) {
        let session = NSURLSession.sharedSession()
        let url = NSURL(string: "\(URL_STRING_EPISODE_LIST)\(String(season))")
        print("URL:\(url)")
        
        let task = session.dataTaskWithURL(url!) {
            (data, response, error) -> Void in
            let HTTPResponse = response as? NSHTTPURLResponse
            if error != nil {
                print(error!.localizedDescription)
            }
            else {
                if HTTPResponse?.statusCode != 200 {
                   print("NO USER FOUND")
                } else {
                    self.parsingHelper.parseData(data!);
                }
            }
            
        }
        
        task.resume()
    }
    
    // MARK: Download Repo's Issues data from the URL
    func loadDataEpisodeDetailFromWebService (imdbID: String) {
        let session = NSURLSession.sharedSession()
        let url = NSURL(string: String(format: URL_STRING_EPISODE_DETAIL, imdbID))
        
        let task = session.dataTaskWithURL(url!) {
            (data, response, error) -> Void in
            
            if error != nil {
                print(error!.localizedDescription)
            }
            else {
                self.parsingHelper.parseDataEpisodeDetail(data!);
            }
        }
        
        task.resume()
    }
    
    // MARK: Parsing Helper Callbacks
    func parsingHelperHelper(parsingHelper: ParsingHelper, didParseEpisode episode: Episode) {
        self.delegate?.webserviceHelper!(self, didDownloadEpisodes: episode)
    }
    
    func parsingHelperHelper(parsingHelper: ParsingHelper, didParseEpisodeDetail detail: EpisodeDetail){
        self.delegate?.webserviceHelper!(self, didDownloadDetails: detail)
    }
    
}