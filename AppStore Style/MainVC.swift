//
//  ViewController.swift
//  AppStore Style
//
//  Created by Ahmed Elzohry on 7/29/16.
//  Copyright © 2016 Ahmed Elzohry. All rights reserved.
//

import UIKit

private let cellIdentifier = "MainCell"
private let cellHeight: CGFloat = 250.0

class MainVC: UITableViewController {
    
    var groups = [Group]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...10 {
            let group = Group()
            group.title = "Group \(i)"
            group.items = [Item(title: "Ahmed", imageName: "placeholder.jpg"),
                           Item(title: "Mohamed", imageName: "placeholder.jpg"),
                           Item(title: "Aly", imageName: "placeholder.jpg"),
                           Item(title: "Mahmoud", imageName: "placeholder.jpg")]
            
            groups.append(group)
        }
        
        // register cell for reuse from nib file
        tableView.registerNib(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        
        tableView.tableFooterView = UIView()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as? MainCell else {
            return UITableViewCell()
        }
        
        let group = groups[indexPath.row]
        cell.group = group
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return cellHeight
    }
}

