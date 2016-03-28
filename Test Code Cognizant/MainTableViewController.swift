//
//  MainTableViewController.swift
//  Test Code Cognizant
//
//  Created by Nivardo Ibarra on 3/28/16.
//  Copyright © 2016 Nivardo Ibarra. All rights reserved.
//

import UIKit

class MainTableViewController: UIViewController, WebserviceHelperDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnRefresh: UIToolbar!
    @IBOutlet weak var btnActionSheet: UIToolbar!
    
    var episodes = Array<Episode>()
    let connection = WebserviceHelper()
    var currentSeason = 1


    override func viewDidLoad() {
        super.viewDidLoad()

        self.connection.delegate = self;
        self.connection.loadDataFromWebService(1)

        navigationItem.leftBarButtonItem = editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = "Game of Thrones"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: CustomCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CustomCell
        cell.setCell(episodes[indexPath.row].Title!)
        
        return cell
    }
 

    
    // Override to support conditional editing of the table view.
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    // Override to support editing the table view.
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            episodes.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {

        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "detail" {
            let detailViewController = segue.destinationViewController as! DetailTableViewController
            let index = self.tableView.indexPathForSelectedRow!
            detailViewController.episode = self.episodes[index.row]
        }
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Season "
    }
    
    
    // MARK:  WebserviceHelperDelegate
    func webserviceHelper (webserviceHelper:WebserviceHelper, didDownloadEpisodes episodeItem: Episode){
        print("episodeItem:\(episodeItem)")
        self.episodes.append(episodeItem)
        self.tableView.reloadData()
    }
    
    // MARK:  Reset Array
    func resetArray() {
        self.episodes.removeAll()
        self.tableView.reloadData()
    }
    
    // MARK:  Update TableView
    @IBAction func Refresh(sender: AnyObject) {
        self.episodes.removeAll()
        self.tableView.reloadData()
        self.connection.loadDataFromWebService(currentSeason)
    }
    
    // MARK:  GetCurrent Season
    func getSeason(number: Int) {
        self.resetArray()
        self.connection.loadDataFromWebService(number)
        currentSeason = number
    }
    
    
    // MARK:  Add Action Sheets
    @IBAction func Actions(sender: AnyObject) {
        
        let optionMenu = UIAlertController(title: nil, message: "Choose Option", preferredStyle: .ActionSheet)
        
        let season1 = UIAlertAction(title: "Season 1", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.getSeason(1)
        })

        let season2 = UIAlertAction(title: "Season 2", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.getSeason(2)
        })
        let season3 = UIAlertAction(title: "Season 3", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.getSeason(3)
        })
        let season4 = UIAlertAction(title: "Season 4", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.getSeason(4)
        })
        let season5 = UIAlertAction(title: "Season 5", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.getSeason(5)
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: {
            (alert: UIAlertAction!) -> Void in
        })
        
        optionMenu.addAction(season1)
        optionMenu.addAction(season2)
        optionMenu.addAction(season3)
        optionMenu.addAction(season4)
        optionMenu.addAction(season5)
        
        optionMenu.addAction(cancelAction)
        
        self.presentViewController(optionMenu, animated: true, completion: nil)
    }
}
