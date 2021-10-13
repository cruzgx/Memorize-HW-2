//
//  Theme.swift
//  HW 2
//
//  Created by Cruz Gonzalez Garcia on 10/10/21.
// Used to include the requirements of HW 2 - Task 3



import Foundation


struct Theme {
    var name: String
    var emojis: [String]
    var numOfPairs: Int
    var color: String
    
    
    init(name: String, emojis: [String], numOfPairs: Int, color: String) {
        self.name = name
        self.emojis = emojis
        if numOfPairs > emojis.count {
            self.numOfPairs = emojis.count
        } else {
            self.numOfPairs = numOfPairs
        }
        self.color = color
    }
}
