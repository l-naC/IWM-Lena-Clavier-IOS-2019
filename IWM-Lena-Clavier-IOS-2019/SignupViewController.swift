//
//  SignupViewController.swift
//  IWM-Lena-Clavier-IOS-2019
//
//  Created by jpo on 19/11/2019.
//  Copyright © 2019 jpo. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignupViewController: UIViewController {
    
   
    @IBOutlet weak var passwordTextField:UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    var handle: AuthStateDidChangeListenerHandle?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
          // ...
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    
    @IBAction func RegisterAttempt(_ sender: Any){
        guard let email = self.emailTextField.text, let password = self.passwordTextField.text else {
            let alert = UIAlertController(title: "Alert", message: "error", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                    NSLog("The \"OK\" alert occured.")
                    }))
            return self.present(alert, animated: true, completion: nil)
        }
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in}
    }
    
    @IBAction func loginPage(_ sender: Any){
        self.performSegue(withIdentifier: "SigninViewController", sender: self)
    }

}
