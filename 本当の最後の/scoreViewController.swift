//
//  scoreViewController.swift
//  本当の最後の
//
//  Created by EriyaMurakami on 2018/07/07.
//  Copyright © 2018年 EriyaMurakami. All rights reserved.
//

import UIKit

class scoreViewController: UIViewController {
   
    var point: Int = 0
    var yosicount: Int = 0
    var tunecount: Int = 0
    var asicount: Int = 0
    
    @IBOutlet var pointLabel: UILabel!
    @IBOutlet var yosicountLabel: UILabel!
    @IBOutlet var tunecountLabel: UILabel!
    @IBOutlet var asicountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pointLabel.text = String(point)
        yosicountLabel.text = String(yosicount)
        asicountLabel.text = String(asicount)
        tunecountLabel.text = String(tunecount)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        for i in 0...point{
            pointLabel.text = String(i)
            RunLoop.main.run(until: Date(timeIntervalSinceNow: 0.0005))
        }
    }
        // Do any additional setup after loading the view.
    
    
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
