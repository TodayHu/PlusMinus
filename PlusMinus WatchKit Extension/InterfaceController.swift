//
//  InterfaceController.swift
//  PlusMinus WatchKit Extension
//
//  Created by Nick McCardel on 4/8/15.
//  Copyright (c) 2015 Bleu Haus Labs. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var titleButton: WKInterfaceButton!
    @IBOutlet weak var countButton: WKInterfaceButton!
    @IBOutlet weak var plusButton: WKInterfaceButton!
    @IBOutlet weak var minusButton: WKInterfaceButton!
    
    let containerString = "group.bhl.plusminus"
    
    var suggestions: [String] = []
    
    var defaults: NSUserDefaults?
    
    var counter = 0
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        println("watch extension awakeWithContext")
        
        defaults = NSUserDefaults(suiteName: self.containerString)
        self.suggestions = defaults?.valueForKey("suggestions") as! [String]
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func titleButtonPressed() {
        
        println("titleButtonPressed")
        self.presentTextInputControllerWithSuggestions(self.suggestions, allowedInputMode: .Plain, completion: { results in
            if results != nil {
                self.titleButton.setTitle(results[0] as? String)
            }
        })
    }

    @IBAction func countButtonPressed() {
        
        println("countButtonPressed")
        
    }
    
    @IBAction func plusButtonPressed() {
    
        println("plusButtonPressed")
        
        self.counter++
        self.countButton.setTitle(String(self.counter))
        
    }

    @IBAction func minusButtonPressed() {
        
        println("minusButtonPressed")
        
        self.counter -= 1
        self.countButton.setTitle(String(self.counter))
    }
}

