//
//  CountryModel.swift
//  SearchBarPlist
//
//  Created by Abouzar Moradian on 9/9/24.
//

import Foundation

struct CountryModel{
    
    var states: [String] = []
    var searchText: String = ""
    var filtered: [String] { if !searchText.isEmpty{
        
        return states.filter { return $0.contains(searchText)}
    }else{
        return states
    }
        
    }
    
    mutating func setStates(states: [String]) {
        self.states = states
    }
    
    mutating func search(searchText: String){
        self.searchText = searchText
    }
    
    
}
