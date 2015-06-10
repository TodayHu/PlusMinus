//
//  CounterDataViewController.swift
//  PlusMinus
//
//  Created by Nick McCardel on 4/13/15.
//  Copyright (c) 2015 Bleu Haus Labs. All rights reserved.
//

typealias Counter = (String, [NSDate: Int])
typealias CounterData = [PMCounter]

import Foundation
import UIKit

class CounterDataViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let containerString = "group.bhl.plusminus"
    
    var counterData: CounterData?
    
    var defaults: NSUserDefaults?
    
    @IBOutlet weak var counterTableView: UITableView!
    
    override func viewDidLoad() {
        //
        super.viewDidLoad()
        
        self.defaults = NSUserDefaults(suiteName: self.containerString)
        if defaults?.valueForKey("counterData") != nil {
            println("data exists")
            self.counterData = defaults!.valueForKey("counterData") as! CounterData
            self.counterTableView.repladData()
        } else {
            println("no previous data")
        }
    }
    
}

extension CounterDataViewController {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.counterData?.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("counterCell") as? UITableViewCell
        if cell == nil {
            cell = UITableViewCell(style: .Defaults, reuseIdentifier: "counterCell")
        }
        let counter = self.counterData![indexPath.row]
        let counterTitle = counter.title
        cell?.textLabel?.text = title
        return cell
    }
    
}