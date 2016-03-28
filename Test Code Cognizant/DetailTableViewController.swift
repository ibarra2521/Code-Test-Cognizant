//
//  DetailTableViewController.swift
//  Test Code Cognizant
//
//  Created by Nivardo Ibarra on 3/28/16.
//  Copyright © 2016 Nivardo Ibarra. All rights reserved.
//

import UIKit

class DetailTableViewController: UIViewController, WebserviceHelperDelegate {
    @IBOutlet weak var lblYear: UILabel!
    @IBOutlet weak var lblRate: UILabel!
    @IBOutlet weak var lblRelease: UILabel!
    @IBOutlet weak var lblSeason: UILabel!
    @IBOutlet weak var lblEpisode: UILabel!
    @IBOutlet weak var lblRuntime: UILabel!
    @IBOutlet weak var titleItem: UINavigationItem!

    var episode: Episode? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let connection = WebserviceHelper()
        connection.delegate = self
        connection.loadDataEpisodeDetailFromWebService((episode?.ImdbID)!)
        
        self.titleItem.title = "\((episode?.Title)!)"
        
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = "\(episode?.Title!)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK:  WebserviceHelper
    func webserviceHelper (webserviceHelper:WebserviceHelper, didDownloadDetails detailsItem: EpisodeDetail){
        episode?.Details = detailsItem
        lblYear.text = episode?.Details?.Year
        lblRate.text = episode?.Details?.Rated
        lblRelease.text = episode?.Details?.Released
        lblSeason.text = episode?.Details?.Season
        lblEpisode.text = episode?.Details?.Episode
        lblRuntime.text = episode?.Details?.Runtime
    }
    
}
