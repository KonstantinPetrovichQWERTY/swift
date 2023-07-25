//
//  ViewController.swift
//  lab33
//
//  Created by  User on 23.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var initialsLabel: UILabel!
    @IBOutlet weak var universityLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialsLabel.translatesAutoresizingMaskIntoConstraints = false
        initialsLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        initialsLabel.heightAnchor.constraint(equalTo: initialsLabel.widthAnchor, multiplier: 1).isActive = true
        
        initialsLabel.layer.cornerRadius =  view.frame.width * 0.25
        initialsLabel.layer.masksToBounds = true
        
    }
    
    func showUniversityAlert() {
        let universityAlert = UIAlertController(title: "Enter new value", message: nil, preferredStyle: .alert)
        
        universityAlert.addTextField{(universityTF) in universityTF.placeholder = "University"}
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { [self]_ in
            guard let fields = universityAlert.textFields else {return}
            let newValue = fields[0]
            guard let value = newValue.text, !value.isEmpty else {return}
            universityLabel.text = value
        })
        
        universityAlert.addAction(cancelAction)
        universityAlert.addAction(okAction)
        
        present(universityAlert, animated: true)
    }
    
    func showCityAlert() {
        let cityAlert = UIAlertController(title: "Enter new value", message: nil, preferredStyle: .alert)
        
        cityAlert.addTextField{(cityTF) in cityTF.placeholder = "City"}
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { [self]_ in
            guard let fields = cityAlert.textFields else {return}
            let newValue = fields[0]
            guard let value = newValue.text, !value.isEmpty else {return}
            cityLabel.text = value
        })
        
        cityAlert.addAction(cancelAction)
        cityAlert.addAction(okAction)
        present(cityAlert, animated: true)
        
    }
     
    @IBAction func setUniversityName(_ sender: UIButton) {
        showUniversityAlert()
    }

    @IBAction func setCityName(_ sender: UIButton) {
        showCityAlert()
    }
}

