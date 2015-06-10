//
//  SuggestionsViewController.swift
//  PlusMinus
//
//  Created by Nick McCardel on 4/13/15.
//  Copyright (c) 2015 Bleu Haus Labs. All rights reserved.
//

import Foundation
import UIKit

class SuggestionsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    //
    
    let containerString = "group.bhl.plusminus"
    
    var suggestions: [String] = ["Plus", "Minus", "ExampleTitle"]
    
    var defaults: NSUserDefaults?
    
    @IBOutlet weak var suggestionTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        println("viewDidLoad start")
        self.defaults = NSUserDefaults(suiteName: self.containerString)
        if defaults?.valueForKey("suggestions") != nil {
            println("suggestions exist")
            self.suggestions = defaults!.valueForKey("suggestions") as! [String]
            self.suggestionTableView.reloadData()
        } else {
            println("no previous suggestions")
            defaults?.setObject(self.suggestions, forKey: "suggestions")
        }
        println("viewDidLoad finish")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func updateSuggestionDefaults() {
        
        for i in 0...(self.suggestionTableView.numberOfRowsInSection(0) - 1) {
            if let text = self.suggestionTableView?.cellForRowAtIndexPath(NSIndexPath(forRow: i, inSection: 0))?.textLabel?.text as String? {
                self.suggestions[i] = text
            }
        }
        self.defaults?.setObject(self.suggestions, forKey: "suggestions")
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //
        println("shouldReturn")
        if let text = textField.text {
            let frame = textField.frame
            let cell = textField.superview as? UITableViewCell
            if cell != nil {
                cell!.textLabel!.text = text
                textField.removeFromSuperview()
            }
        }
        
        updateSuggestionDefaults()
        
        return true
    }
}

extension SuggestionsViewController {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("suggestionCell") as? UITableViewCell
        if (cell == nil) {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "suggestionCell")
        }
        cell?.textLabel?.text = self.suggestions[indexPath.row]
        println("cellForRow finish")
        return cell!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.suggestions.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
        var cell = tableView.cellForRowAtIndexPath(indexPath) as UITableViewCell?
        if cell != nil {
            
            println("cell != nil")
            let frame: CGRect? = cell?.textLabel?.frame
            println("frame: \(frame)")
            var textField = UITextField(frame: frame!)
            textField.delegate = self
            cell!.textLabel!.text = ""
            cell!.addSubview(textField)
            textField.nextResponder()?.becomeFirstResponder()
            
        }
        
    }
    
}