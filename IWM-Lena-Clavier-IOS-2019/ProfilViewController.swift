//
//  ProfilViewController.swift
//  IWM-Lena-Clavier-IOS-2019
//
//  Created by jpo on 19/11/2019.
//  Copyright © 2019 jpo. All rights reserved.
//

import UIKit
import FirebaseAuth
class ProfilViewController: UIViewController {
    
    var handle: AuthStateDidChangeListenerHandle?
        
    @IBOutlet weak var emailText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let user = Auth.auth().currentUser
        if let user = user {
            emailText.text = user.email
        }else{
            emailText.text = "no connected"
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
        }
    }
    
    @IBAction func logout(_ sender: Any) {
        try! Auth.auth().signOut()
        let user = Auth.auth().currentUser
        if user != nil {
            print("connecté")
        }else{
            print("deconnecté")
            let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as UIViewController

            self.present(viewController, animated: true, completion: nil)
        }
    }

}
