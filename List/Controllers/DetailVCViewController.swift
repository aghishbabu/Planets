//
//  DetailVCViewController.swift
//  List
//
//  Created by Aghish Babu on 30/05/22.
//

import UIKit

class DetailVCViewController: UIViewController {
    
    var planetDetail: String!
    

    @IBOutlet weak var planetData: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        planetData.text = planetDetail
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
