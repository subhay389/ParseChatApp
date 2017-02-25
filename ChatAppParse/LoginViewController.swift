//
//  LoginViewController.swift
//  ChatAppParse
//
//  Created by Subhay Manandhar on 2/24/17.
//  Copyright © 2017 Subhay Manandhar. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    

    @IBAction func signupButton(_ sender: Any) {
        
        
        if emailTextField.text != "" && passwordTextField.text != ""{
            
            let user = PFUser()
            
            user.username = emailTextField.text
            user.password = passwordTextField.text
            user.email = emailTextField.text
            
            user.signUpInBackground {
                (succeeded: Bool, error: Error?) -> Void in
                if error == nil {
                    print ("User signed up")
                    let alertController = UIAlertController(title: "WELCOME", message: "Welcome to Chat", preferredStyle: .alert)
                    
                    let cancelAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
                        // handle cancel response here. Doing nothing will dismiss the view.
                    }
                    // add the cancel action to the alertController
                    alertController.addAction(cancelAction)
                    
                    
                    self.present(alertController, animated: true) {
                        // optional code for what happens after the alert controller has finished presenting
                        
                        
                    }
                    
                    self.performSegue(withIdentifier: "signupSegue", sender: nil)
                    
                    
                    
                    
                } else {
                    print("____________ERROR____________", error!.localizedDescription)
                    // create a cancel action
                    
                    let alertController = UIAlertController(title: "ERROR", message: "Choose different email id", preferredStyle: .alert)
                    
                    let cancelAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
                        // handle cancel response here. Doing nothing will dismiss the view.
                    }
                    // add the cancel action to the alertController
                    alertController.addAction(cancelAction)
                    
                    self.present(alertController, animated: true) {
                        // optional code for what happens after the alert controller has finished presenting
                    }
                    
                    // Show the errorString somewhere and let the user try again.
                }
            }
        
        }else{
            let alertController = UIAlertController(title: "ERROR", message: "Email or Password cannot be blank", preferredStyle: .alert)
            
            
            let cancelAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
                // handle cancel response here. Doing nothing will dismiss the view.
            }
            // add the cancel action to the alertController
            alertController.addAction(cancelAction)
            
            self.present(alertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
            }
            
            //user has not entered informatiom

        }
        
        
        
     }
    
    
    @IBAction func loginButton(_ sender: Any) {

        
        if emailTextField.text != "" && passwordTextField.text != "" {
            
            PFUser.logInWithUsername(inBackground: emailTextField.text!, password: passwordTextField.text!){
                user, error in
                if user != nil {
                    print("YAY")
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                }else{
                    let alertController = UIAlertController(title: "ERROR", message: "INVALID VALUES", preferredStyle: .alert)
                
                    let cancelAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
                        // handle cancel response here. Doing nothing will dismiss the view.
                    }
                    // add the cancel action to the alertController
                    alertController.addAction(cancelAction)
                    
                    
                    self.present(alertController, animated: true) {
                        // optional code for what happens after the alert controller has finished presenting
                    }
                }
                
                
            }
            
        }else{
            let alertController = UIAlertController(title: "ERROR", message: "Empty Field Values", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
                // handle cancel response here. Doing nothing will dismiss the view.
            }
            // add the cancel action to the alertController
            alertController.addAction(cancelAction)
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
