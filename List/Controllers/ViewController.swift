//
//  ViewController.swift
//  List
//
//  Created by Aghish Babu on 16/02/22.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate {
    
    /// Planet View Model Object
    private var planetsViewModel: PlanetsViewModel!
    
    /// Tableview Outlet
    @IBOutlet weak var planetsTableView: UITableView!
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var items:[Planets] = []
    var tempItems:[Planets] = []
    
    var valueToPass: String?
    
    
    /// Tbaleview Datasource object
    private var dataSource : PlanetTableViewDataSource<PlanetTableViewCell,Planets>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callToViewModelforUIupdate()
        // Do any additional setup after loading the view.
    }
    
    /// Update UI with data
    func callToViewModelforUIupdate() {
        self.planetsViewModel = PlanetsViewModel()
        self.planetsViewModel.bindPlanetViewModelToController = {
            if Reachability.isConnectedToNetwork() {
                self.addPlanetsToCoreData()
                self.fetchPlanetData()
                self.updateDataSource()
            } else {
                self.fetchPlanetData()
            }
        }
        
    }
    
    /// Add the Planets data to CoreData
    func addPlanetsToCoreData() {
        _ = Planets(context: self.context)
        let result = self.planetsViewModel.planetData.results
        
        do {
            self.tempItems = try context.fetch(Planets.fetchRequest())
            print(self.tempItems)
            
        }
        catch{
            print("some error occured")
        }
        DispatchQueue.main.async {
            Common().deleteAllData(entity: "Planets")
        }
        if(self.tempItems.count == 1) {
            for val in result {
                print(val)
                let newArray = NSEntityDescription.insertNewObject(forEntityName: "Planets", into: context)
                newArray.setValue(val.name, forKey: "name")
                newArray.setValue(val.population, forKey: "population")
            }
        }
        try! self.context.save()
    }
    
    /// Get planet list from the CoreData
    func fetchPlanetData() {
        do {
            self.items = try context.fetch(Planets.fetchRequest())
            
            DispatchQueue.main.async {
                self.planetsTableView.reloadData()
            }
            print(self.items)
        }
        catch{
            let saveError = error as NSError
            print(saveError)
        }
    }
    
    
    /// Provide data to Tableview Datasource
    func updateDataSource(){
        
        self.dataSource = PlanetTableViewDataSource(cellIdentifier: "PlanetTableViewCell", items: self.items, configureCell: { (cell, evm) in
            cell.planetNameLabel.text = evm.name
            cell.plPopulation.text = evm.population
        })
        
        DispatchQueue.main.async {
            self.planetsTableView.dataSource = self.dataSource
            self.planetsTableView.reloadData()
        }
    }
    
}

