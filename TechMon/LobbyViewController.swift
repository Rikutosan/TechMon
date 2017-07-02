//
//  LobbyViewController.swift
//  TechMon
//
//  Created by  on 2017/06/04.
//  Copyright © 2017年 mayuko. All rights reserved.
//

import UIKit
import AVFoundation

class LobbyViewController: UIViewController, AVAudioPlayerDelegate{
    
    var stamina: Float = 0
    var staminaTimer: Timer!
    var util: TechDraUtility!
    var player: Player!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var staminaBar: UIProgressView!
    @IBOutlet var  levelLabel: UILabel!
    
    override func viewDidLoad() {
    super.viewDidLoad()
    
    //
    player = Player(name: "ちゃま",imageName:"")
    staminaBar.transform = CGAffineTransform(scaleX: 1.0, y: 4.0)
    
    nameLabel.text = player.name
    levelLabel.text = "Lv. 15"
    stamina = 100
    
    util = TechDraUtility()
    
    cureStamina()
    }
    
    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    }

    override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    util.playBGM(fileName: "Lobby")
    }

    override func viewWillDisappear(_ animated: Bool) {
    util.stopBGM()
    }
    @IBAction func toBattle() {
    
    if stamina >= 50 {
        
        stamina -= 50
        staminaBar.progress = stamina / 100
        self.performSegue(withIdentifier: "toBattle", sender: nil)
    } else {
        
        let alert = UIAlertController(title: "バトル行けねえよかす", message: "スタミナ貯めろ雑魚", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    }
}

    func cureStamina() {
    
    staminaTimer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(LobbyViewController.updateStaminaValue), userInfo: nil, repeats: true)
    staminaTimer.fire()
}

    func updateStaminaValue() {
    
    if stamina <= 100 {
        stamina += 1
        staminaBar.progress = stamina / 100
        
    }
}

}


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


