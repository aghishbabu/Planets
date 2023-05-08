//
//  PlanetsViewModel.swift
//  List
//
//  Created by Aghish Babu on 16/02/22.
//


import Foundation

class PlanetsViewModel : NSObject {
    
    /// Object for api service
    private var apiService : APIService!
    private(set) var planetData : PlanetsData! {
        didSet {
            self.bindPlanetViewModelToController()
        }
    }
    
    /// Binding view model to controller
    var bindPlanetViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiService =  APIService()
        callFuncToGetPlanetData()
    }
    
    /// Method to fetch data from API
    func callFuncToGetPlanetData() {
        self.apiService.apiToGetPlanetData { (planetData) in
            self.planetData = planetData
        }
    }
    
    
}



