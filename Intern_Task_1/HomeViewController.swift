//
//  HomeViewController.swift
//  Intern_Task_1
//
//  Created by Sandeep M on 13/01/19.
//  Copyright © 2019 Sandeep M. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    //MARK:- Encryption/Decryption Button Action
    //Here we have set tag for encrypt btn with 10 & Decrypt btn with 20
    //if user taps on encrypt btn -> It will move to 'EncryptDecryptController' and pass a String 'Encryption' to set as navbar title
    //if user taps on decrypt btn -> It will move to 'EncryptDecryptController' and pass a String 'Decryption' to set as navbar title
    @IBAction func encryptDecryptBtnAction(_ sender:UIButton){
        guard sender.tag == 10 else {
            //if sender.tag is 20 -> TRUE(Decryption)
            performSegue(withIdentifier: "moveToEncryption", sender: "Decryption")
            return
        }
        //if sender.tag is 10 -> TRUE(Encryption)
        performSegue(withIdentifier: "moveToEncryption", sender: "Encryption")
    }
    

    //MARK:- prepare method will help in passing the sender value to concerned controller and set the sender value to controller reference variable
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveToEncryption"{
            let encryptDecryptVC = segue.destination as? EncryptDecryptController
            encryptDecryptVC?.selectionCryptoString = sender as? String
        }
        
    }
}
