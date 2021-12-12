//
//  AllAnimeTableViewController.swift
//  Anime Quotes
//
//  Created by Tomas Sanni on 12/4/21.
//

import UIKit

class AllAnimeTableViewController: UITableViewController, AllManagerDelegate
{
    
    
    var all = AllAnimeManager()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        all.delegate = self
        all.performRequest()


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int
//    {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // #warning Incomplete implementation, return the number of rows
        return all.allAnimeFromSite.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "animeInsert", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = all.allAnimeFromSite[indexPath.row]

        return cell
    }
    

    
    //MARK: - Delegate Methodes
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(all.allAnimeFromSite[indexPath.row])
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
