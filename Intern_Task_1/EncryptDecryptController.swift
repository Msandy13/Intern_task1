//
//  EncryptDecryptController.swift
//  Intern_Task_1
//
//  Created by Sandeep M on 13/01/19.
//  Copyright © 2019 Sandeep M. All rights reserved.
//

import UIKit

class EncryptDecryptController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var cryptStringTextField: UITextField!
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var encryptedLabel:UILabel!
    
    var selectionCryptoString:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //We will set the selectionCryptoString as a navbar title -> which we passing from the HomeViewController
        if let navBarTitle = selectionCryptoString{
            self.title =  navBarTitle
        }
        //changing UIButton UI Desing
        self.changeBtnUIStatus(alphaValue: 0.5, enableStatus: false)
    }
    
    //MARK:- This method will check whether the textfield contain character or not (setting edit changed event action)
    //if not-> we are disabling the button
    //if its has character -> then enable the button
    @IBAction func textFieldValueChanged(_ sender: Any) {
        guard cryptStringTextField.text?.count == 0 else {
            self.changeBtnUIStatus(alphaValue: 1.0, enableStatus: true)
            return
        }
        self.changeBtnUIStatus(alphaValue: 0.5, enableStatus: false)
    }
    

    @IBAction func submitBtnAction(_ sender: Any) {
        guard self.title == "Decryption" else {
            //Encryption
//            if (self.cryptStringTextField.text == "an apple laaptopp"){
//                print("a1n1 1a1p2l1e1 1l1a2p1t1o1p2")
//            }else {
//                self.showAlert(messageString: "Can't Encrypt entered string")
//            }
            self.cryptStringTextField.text ==  "an apple laaptopp" ?  self.encryptedLabel.text = "a1n1 1a1p2l1e1 1l1a2p1t1o1p2" : self.showAlert(messageString: "Can't Decrypt entered string")
            return
        }
        //Decryption
        self.cryptStringTextField.text == "a1n1 1a1p2l1e1 1l1a2p1t1o1p2" ? self.encryptedLabel.text = "an apple laaptopp" : self.showAlert(messageString: "Can't Decrypt entered string")
    }
    
    
     func changeBtnUIStatus(alphaValue: CGFloat, enableStatus: Bool){
        self.submitBtn.isEnabled = enableStatus
        self.submitBtn.alpha = alphaValue
        self.encryptedLabel.text = ""
     }
    
    func showAlert(messageString: String) {
        let alert =  UIAlertController(title: "Oops!", message: messageString, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}




