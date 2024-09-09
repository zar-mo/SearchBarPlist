//
//  ViewModel.swift
//  SearchBarPlist
//
//  Created by Abouzar Moradian on 9/9/24.
//

import Foundation


//define a delegate protocol
protocol DataFromPlist: AnyObject {
    
    func getData(country:CountryModel)
}


// define a viewModel class which conforms to the delegate protocol.

class ViewModel {
    
    var country = CountryModel()
    
    weak var delegate: DataFromPlist? {
        didSet {
            if delegate != nil {
                getDatafromPlist()
            }
        }
    }
    
    init(){
        
    }
    
    
    func getDatafromPlist(){
        let path = Bundle.main.path(forResource: "StatePlist", ofType: "plist")
        if let path = path{
            let dict = NSDictionary(contentsOfFile: path)
            country.setStates(states: dict?.object(forKey: "States") as! [String])
        }
        delegate?.getData(country: country)
    }
    
}
