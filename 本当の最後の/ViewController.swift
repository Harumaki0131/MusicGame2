//
//  ViewController.swift
//  本当の最後の
//
//  Created by EriyaMurakami on 2018/05/12.
//  Copyright © 2018年 EriyaMurakami. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var profile: Profile = Profile.shared
    
    @IBAction func name(_ sender: Any) {
    }

    @IBOutlet weak var outputText: UILabel!
    @IBOutlet weak var inputText: UITextField!

    var saveDate:UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        profile.name = "iretayo"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func inputText(_ sender: UITextField) {
        outputText.text = sender.text
    }
    
    @IBAction func button(_ sender: Any) {
        outputText.text = inputText.text
        inputText.endEditing(true)
        saveDate.set(inputText.text, forKey: "Name")
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        outputText.text = inputText.text
        self.view.endEditing(true)
    }
}

