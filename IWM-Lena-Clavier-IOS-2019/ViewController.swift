//
//  ViewController.swift
//  IWM-Lena-Clavier-IOS-2019
//
//  Created by jpo on 18/11/2019.
//  Copyright © 2019 jpo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pseudoTextField:UITextField!
    @IBOutlet weak var passwordTextField:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginAttempt(_ sender: Any){
        let test = pseudoTextField.text
        
        if let poulet = test {
            print(poulet)
        }
        let alert = UIAlertController(title: "Vous avez cliqué sur le bouton", message: "This is an alert.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
        
    }

}

