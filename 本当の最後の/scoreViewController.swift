//
//  scoreViewController.swift
//  本当の最後の
//
//  Created by EriyaMurakami on 2018/07/07.
//  Copyright © 2018年 EriyaMurakami. All rights reserved.
//

import UIKit
import Firebase

class scoreViewController: UIViewController {
    
    var yosicount: Int = 0
    var tunecount: Int = 0
    var asicount: Int = 0
    var point: Int!
    
    var  namae:DatabaseReference!
    
    @IBOutlet var pointLabel: UILabel!
    @IBOutlet var pointLabelsecond: UILabel!
    @IBOutlet var pointLabelthierd: UILabel!
    @IBOutlet var pointLabelfour: UILabel!
    @IBOutlet var pointLabelfive: UILabel!
    @IBOutlet var yosicountLabel: UILabel!
    @IBOutlet var tunecountLabel: UILabel!
    @IBOutlet var asicountLabel: UILabel!
    
    @IBOutlet weak var namae: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        yosicountLabel.text = String(yosicount)
        asicountLabel.text = String(asicount)
        tunecountLabel.text = String(tunecount)
        
        setNumbers()
        
        namae = Database.database().reference()
        func add(_ sender: AnyObject) {
            let data = ["name": UITextField.text]
        namae.child("user/01").setValue(data)
    }
    }
    
    func setNumbers() {
        for count in 1...5 {
            if count == 1{
                print (point % 10)
                pointLabel.text = String(point % 10)
            } else if count == 2{
                print (point / 10 % 10)
                pointLabelsecond.text = String(point / 10 % 10)
            }else if count == 3{
                print (point / 100 % 10)
                pointLabelthierd.text = String(point / 100 % 10)
            }else if count == 4{
                print (point / 1000 % 10)
                pointLabelfour.text = String(point / 1000 % 10)
            }else if count == 5{
            print (point / 10000 % 10)
                pointLabelfive.text = String(point / 10000 % 10)
            }
        }
    }





}
