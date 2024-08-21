//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Jacob Bonilla on 8/12/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var split: Int = 0
    var total: Double = 0.0
    var tip: Int = 0
    
    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(format: "%.2f", total)
        settingsLabel.text = "Split between \(split) people, with \(tip)% tip."
    
        // Do any additional setup after loading the view.
    }
    

    @IBAction func recalculatePressed(_ sender: Any) {
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
