//
//  PMAssets.swift
//  PlusMinus
//
//  Created by Nick McCardel on 4/13/15.
//  Copyright (c) 2015 Bleu Haus Labs. All rights reserved.
//

typealias PMCount = (NSDate, Int)

import Foundation
import UIKit

struct PMCounter {

    var title: String
    var counts: [PMCount]
    
    mutating func setTitle(title: String) {
        self.title = title
    }
    
    mutating func addCount(count: PMCount) {
        self.counts.append(count)
    }
    
    
}