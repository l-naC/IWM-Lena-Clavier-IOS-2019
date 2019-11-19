//
//  ViewController.swift
//  IWM-Lena-Clavier-IOS-2019
//
//  Created by jpo on 18/11/2019.
//  Copyright © 2019 jpo. All rights reserved.
//

import UIKit
import FirebaseAuth
class ViewController: UIViewController {
    
    @IBOutlet weak var passwordTextField:UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    var handle: AuthStateDidChangeListenerHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

//    func signIn(email: String, pass: String, completionBlock: @escaping (_ success: Bool) -> Void) {
//        Auth.auth().signIn(withEmail: email, password: pass) { (result, error) in
//            if let error = error, let _ = AuthErrorCode(rawValue: error._code) {
//                completionBlock(false)
//            } else {
//                completionBlock(true)
//            }
//        }
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
          // ...
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    
    @IBAction func loginAttemp(_ sender: Any){
        guard let email = emailTextField.text, let password =
        passwordTextField.text else {
            let alert = UIAlertController(title: "Alert", message: "error", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                    NSLog("The \"OK\" alert occured.")
                    }))
            return self.present(alert, animated: true, completion: nil)
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            let user = result?.user
            if (user != nil) {
                self.performSegue(withIdentifier: "HomePageViewController", sender: self)
            } else {
                let alert = UIAlertController(title: "Alert", message: "error", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                        NSLog("The \"OK\" alert occured.")
                        }))
                return self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func registerPage(_ sender: Any){
        self.performSegue(withIdentifier: "SignupPageViewController", sender: self)
    }
}

