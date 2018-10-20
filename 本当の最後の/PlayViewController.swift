//
//  PlayViewController.swift
//  本当の最後の
//
//  Created by EriyaMurakami on 2018/05/26.
//  Copyright © 2018年 EriyaMurakami. All rights reserved.
//

import UIKit
import AVFoundation

class PlayViewController: UIViewController, AVAudioPlayerDelegate {
    
    var audioPlayer:AVAudioPlayer!
    
    var point: Int = 0
    var yosicount: Int = 0
    var tunecount: Int = 0
    var asicount: Int = 0
    
    @IBOutlet var hanteiLabel: UILabel!
    
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var leftButton2: UIButton!
    @IBOutlet weak var righttButton2: UIButton!
    
    var count: Float = 0.0
    
    var timer: Timer = Timer()
    
    var targetLabelArray = [UILabel]()
    
    var speed: CGFloat = 10.0
    
    
    let timingArray1: [Float] = [4.50, 0.54, 0.53, 0.27, 0.33, 0.25, 0.14, 0.16, 0.26, 0.54, 0.51, 0.58, 1.09, ]
    //いつブロックを落とすか、秒数をまとめた配列
    let timingArray2: [Float] = [1.25, 0.63, 0.80, 0.75, 1.68, 1.60, 1.36, 0.16, 1.89, 0.18, 0.21, 0.88, 1.09, ]
    
    let timingArray3: [Float] = [1.25, 0.63, 0.80, 0.75, 1.68, 1.60, 1.36, 0.16, 1.89, 0.18, 0.21, 0.88, 1.09, ]
    
    let timingArray4: [Float] = [1.25, 0.63, 0.80, 0.75, 1.68, 1.60, 1.36, 0.16, 1.89, 0.18, 0.21, 0.88, 1.09, ]
    
    var timingCount:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval: 0.01,target: self,
                                     selector: #selector(self.up),userInfo: nil,repeats: true)
        
        let audioPath = Bundle.main.path(forResource: "hatesinai", ofType:"mp3")!
        let audioUrl = URL(fileURLWithPath: audioPath)
        
        
        var audioError:NSError?
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioUrl)
        } catch let error as NSError {
            audioError = error
            audioPlayer = nil
        }
        
        // エラーが起きたとき
        if let error = audioError {
            print("Error \(error.localizedDescription)")
        }
        
        audioPlayer.delegate = self
        audioPlayer.prepareToPlay()
        
        audioPlayer.play()
    }
    
    func goNext(){
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func up() {
        let appframe:CGRect = UIScreen.main.bounds
        let x = (appframe.size.width - 100) / 3 * 2 + 50
        let sizeY = UIScreen.main.bounds.height
        
        count += 0.01
        
        if  audioPlayer.isPlaying == false {
            timer.invalidate()
            performSegue(withIdentifier: "seguetest", sender: self)
        }
        
        
        //普通に配列に追加して動かせば？
        if  timingCount >= timingArray1.count { return }
        if (count >= timingArray4[timingCount] || timingCount == 0){
            
            var targetLabel: UILabel = UILabel()
            targetLabel=UILabel(frame: CGRect(x: 69, y: 25, width: 137, height: 15))
            targetLabel.text = "■"
            targetLabel.font = UIFont.systemFont(ofSize: 50)
            targetLabel.backgroundColor = UIColor.black
            targetLabel.tag = 0
            self.view.addSubview(targetLabel)
            
            targetLabelArray.append(targetLabel)
            
            timingCount += 1
            count = 0.0
        }
        
        if targetLabelArray.count != 0{
            
            var iNum = 0
            for i in 0..<targetLabelArray.count{
                
                if iNum == -1 {
                    break
                }
                
                if targetLabelArray[i].center.y > sizeY {
                    targetLabelArray[i].removeFromSuperview()
                    targetLabelArray.remove(at: i)
                    iNum -= 1
                }else{
                    targetLabelArray[i].center.y += speed
                    iNum += 1
                    //                    targetLabelArray[i].bounds.width =
                    targetLabelArray[i].center.x += 0
                }
            }
        }
    }
    
    func hantei(number: Float) -> String{
        
        if count > number - 0.02 && count < number + 0.02 {
            point=point+600
            yosicount=yosicount+1
            return "よし"
            
        }else if count > number - 0.10 && count < number + 0.10 {
            point=point+300
            tunecount=tunecount+1
            return "つね"
            
        }else {
            point=point+0
            asicount=asicount+1
            return"あし"
        }
    }

    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        let next = storyboard!.instantiateViewController(withIdentifier: "scoreViewController") as! scoreViewController
        next.point = point
        next.asicount = asicount
        next.tunecount = tunecount
        next.yosicount = yosicount
        self.present(next,animated: true, completion: nil)
    }
    // Do any additional setup after loading the view.

    
    // Dispose of any resources that can be recreated.
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    
}
