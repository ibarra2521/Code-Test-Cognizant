//
//  ParsingHelper.swift
//  Assigment
//
//
//  Created by Nivardo Ibarra on 3/17/16.
//  Copyright © 2016 Nivardo Ibarra. All rights reserved.
//

import UIKit

// MARK: - Protocol

protocol ParsingHelperDelegate {
    func parsingHelperHelper(parsingHelper: ParsingHelper, didParseEpisode episode: Episode)
    func parsingHelperHelper(parsingHelper: ParsingHelper, didParseEpisodeDetail detail: EpisodeDetail)
}

class ParsingHelper: NSObject {
    var delegate: ParsingHelperDelegate?
    
    // MARK: Parse Data for a User
    func parseData(data: NSData) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            do {                
                let jsonData = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as! NSDictionary;
                let dataArray = jsonData[POST_KEY] as! NSArray;

                
                for currentItem in dataArray {
                    let data: NSDictionary = currentItem as!NSDictionary;

                    let episode = Episode().JSONTOEpisode(data)
                    
                    dispatch_async(dispatch_get_main_queue(),{
                        self.delegate!.parsingHelperHelper(self, didParseEpisode: episode);
                    })
                }

            } catch {
                // Handle exception
            }
        });
    }
    
    // MARK: Parse Data For Episode Details
    func parseDataEpisodeDetail(data: NSData) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            do {
                let data = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as! NSDictionary
            
                    let episodeDetail = EpisodeDetail().JSONTOEpisodeDetail(data);
                    
                    dispatch_async(dispatch_get_main_queue(),{
                        self.delegate!.parsingHelperHelper(self, didParseEpisodeDetail: episodeDetail);
                    })
                
            } catch {
                // Handle exception
            }
        });
    }

}
