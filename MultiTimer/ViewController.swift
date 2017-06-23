//
//  ViewController.swift
//  MultiTimer
//
//  Created by Colleen Rothe on 6/22/17.
//  Copyright © 2017 Colleen Rothe. All rights reserved.
//

//CREDITS:
//https://github.com/jen2/swift-timer-demo/blob/master/Swift-Timer-Tutorial/ViewController.swift
//https://oleb.net/blog/2014/02/alarm-clock-apps-ios/
//https://stackoverflow.com/questions/31126124/using-existing-system-sounds-in-ios-app-swift


import UIKit
import AVFoundation

class ViewController: UIViewController {
    //first timer
    @IBOutlet var countdownLabel1: UILabel!

    @IBOutlet var hours1: UITextField!
    
    @IBOutlet var minutes1: UITextField!
    
    @IBOutlet var seconds1: UITextField!
    
    @IBOutlet var goButton1: UIButton!
    
    @IBOutlet var pauseButton1: UIButton!
    
    @IBOutlet var resetButton1: UIButton!
    
    
    var timer1 = Timer()
    var isRunning1 = false
    var resumeTapped1 = false
    var sec1 = 0
    let systemSoundID1: SystemSoundID = 1016
    var tappedOk1 = false
    
    //second timer
    @IBOutlet var countdownLabel2: UILabel!
    
    @IBOutlet var hours2: UITextField!
    
    @IBOutlet var minutes2: UITextField!
    
    @IBOutlet var seconds2: UITextField!
    
    @IBOutlet var goButton2: UIButton!
    
    @IBOutlet var pauseButton2: UIButton!
    
    @IBOutlet var resetButton2: UIButton!
    
    var timer2 = Timer()
    var isRunning2 = false
    var resumeTapped2 = false
    var sec2 = 0
    let systemSoundID2: SystemSoundID = 1050
    var tappedOk2 = false
    
    //third timer
    
    @IBOutlet var countdownTimer3: UILabel!
    
    @IBOutlet var hours3: UITextField!
    
    @IBOutlet var minutes3: UITextField!
    
    @IBOutlet var seconds3: UITextField!
    
    @IBOutlet var goButton3: UIButton!
    
    @IBOutlet var pauseButton3: UIButton!
    
    @IBOutlet var resetButton3: UIButton!
    
    var timer3 = Timer()
    var isRunning3 = false
    var resumeTapped3 = false
    var sec3 = 0
    let systemSoundID3: SystemSoundID = 1074
    var tappedOk3 = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pauseButton1.isEnabled = false
        hours1.keyboardType = .numberPad
        minutes1.keyboardType = .numberPad
        seconds1.keyboardType = .numberPad

        pauseButton2.isEnabled = false
        hours2.keyboardType = .numberPad
        minutes2.keyboardType = .numberPad
        seconds2.keyboardType = .numberPad
        
        pauseButton3.isEnabled = false
        hours3.keyboardType = .numberPad
        minutes3.keyboardType = .numberPad
        seconds3.keyboardType = .numberPad
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clickGo1(_ sender: Any) {
        if isRunning1 == false{
        sec1 = CalculateSeconds(hoursT: hours1,minutesT: minutes1,secondsT: seconds1)
        runTimer1()
        goButton1.isEnabled = false
        setNotif1()
        }
    }
    
    @IBAction func clickGo2(_ sender: Any) {
        if isRunning2 == false{
            sec2 = CalculateSeconds(hoursT: hours2,minutesT: minutes2,secondsT: seconds2)
            runTimer2()
            goButton2.isEnabled = false
        }

        
    }
    @IBAction func clickGo3(_ sender: Any) {
        if isRunning3 == false{
            sec3 = CalculateSeconds(hoursT: hours3,minutesT: minutes3,secondsT: seconds3)
            runTimer3()
            goButton3.isEnabled = false
        }

        
    }
    
    func CalculateSeconds(hoursT: UITextField, minutesT: UITextField, secondsT: UITextField)->Int{
        var seconds = 0
        if(hoursT.text != "0" &&  hoursT.text != ""){
            var hours = Int(hoursT.text!)
            hours = hours! * 3600
            seconds += hours!
        }
        if(minutesT.text != "0" && minutesT.text != ""){
            var minutes = Int(minutesT.text!)
            minutes = minutes! * 60
            seconds += minutes!
        }
        if(secondsT.text != "0" && secondsT.text != ""){
            let second = Int(secondsT.text!)
            seconds += second!
        }
        return seconds
    }
    
    func setNotif1(){
        let currentTime = Date()
        let someTime = Date(timeInterval: TimeInterval(sec1), since: currentTime)
        
        print(currentTime)
        print(someTime)
        
        let notification = UILocalNotification()
        notification.fireDate = someTime
        notification.alertBody = "Alarm 1 Finished!" // text that will be displayed in the notification
        notification.soundName = "mountainAlarm.wav"
        UIApplication.shared.scheduleLocalNotification(notification)
    }
    
    
    
    func runTimer1(){
        timer1 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer1)), userInfo: nil, repeats: true)
        isRunning1 = true
        pauseButton1.isEnabled = true
    }
    func runTimer2(){
        timer2 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer2)), userInfo: nil, repeats: true)
        isRunning2 = true
        pauseButton2.isEnabled = true
    }
    func runTimer3(){
        timer3 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer3)), userInfo: nil, repeats: true)
        isRunning3 = true
        pauseButton3.isEnabled = true
    }
    
    
    @IBAction func clickPause1(_ sender: Any) {
        if self.resumeTapped1 == false {
            timer1.invalidate()
            isRunning1 = false
            self.resumeTapped1 = true
            self.pauseButton1.setTitle("Resume",for: .normal)
        } else {
            runTimer1()
            self.resumeTapped1 = false
            isRunning1 = true
            self.pauseButton1.setTitle("Pause",for: .normal)
        }
    }
    
    @IBAction func clickPause2(_ sender: Any) {
        if self.resumeTapped2 == false {
            timer2.invalidate()
            isRunning2 = false
            self.resumeTapped2 = true
            self.pauseButton2.setTitle("Resume",for: .normal)
        } else {
            runTimer2()
            self.resumeTapped2 = false
            isRunning2 = true
            self.pauseButton2.setTitle("Pause",for: .normal)
        }

    }
    
    @IBAction func clickPause3(_ sender: Any) {
        if self.resumeTapped3 == false {
            timer3.invalidate()
            isRunning3 = false
            self.resumeTapped3 = true
            self.pauseButton3.setTitle("Resume",for: .normal)
        } else {
            runTimer3()
            self.resumeTapped3 = false
            isRunning3 = true
            self.pauseButton3.setTitle("Pause",for: .normal)
        }

    }
    
    @IBAction func clickReset1(_ sender: Any) {
        timer1.invalidate()
        sec1 = 0
        countdownLabel1.text = timeString(time: TimeInterval(sec1))
        isRunning1 = false
        pauseButton1.isEnabled = false
        goButton1.isEnabled = true
        
    }
    
    @IBAction func clickReset2(_ sender: Any) {
        timer2.invalidate()
        sec2 = 0
        countdownLabel2.text = timeString(time: TimeInterval(sec2))
        isRunning2 = false
        pauseButton2.isEnabled = false
        goButton2.isEnabled = true

        
    }
    @IBAction func clickReset3(_ sender: Any) {
        timer3.invalidate()
        sec3 = 0
        countdownTimer3.text = timeString(time: TimeInterval(sec3))
        isRunning3 = false
        pauseButton3.isEnabled = false
        goButton3.isEnabled = true

    }
    
    
    func updateTimer1() {
        if sec1 < 1 {
            timer1.invalidate()
            self.tappedOk1 = false
            var presenting = false
            
            DispatchQueue.global(qos: .background).async {
                print("Run on background thread")
                for _ in 0 ... 15{
                    if(self.tappedOk1 == false){
                        AudioServicesPlaySystemSound(self.systemSoundID1)
                        sleep(1)
                    }
                    else{
                        break
                    }
                
                DispatchQueue.main.async {
                    if(presenting == false){
                        presenting = true
                    print("We finished that.")
                    //Send alert to indicate time's up.
                    let alert = UIAlertController(title: "Alert!", message: "Timer 1 is done!", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { action in
                        switch action.style{
                        case .default:
                            print("default")
                            self.tappedOk1 = true
                            break
                        case .cancel:
                            print("cancel")
                            
                        case .destructive:
                            print("destructive")
                        }
                    }))
                    self.present(alert, animated: true, completion: nil)
                    }
                }
            }
            
            
            }
            
            
        } else {
            sec1 -= 1
            countdownLabel1.text = timeString(time: TimeInterval(sec1))
        }
    }
    
    func updateTimer2() {
        if sec2 < 1 {
            timer2.invalidate()
            self.tappedOk2 = false
            var presenting = false

            
            
            DispatchQueue.global(qos: .background).async {
                print("Run on background thread")
                for _ in 0 ... 15{
                    if(self.tappedOk2 == false){
                        AudioServicesPlaySystemSound(self.systemSoundID2)
                        sleep(1)
                    }
                    else{
                        break
                    }
                    
                    DispatchQueue.main.async {
                        if(presenting == false){
                            presenting = true
                        print("We finished that.")
                        //Send alert to indicate time's up.
                        let alert = UIAlertController(title: "Alert!", message: "Timer 2 is done!", preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { action in
                            switch action.style{
                            case .default:
                                print("default")
                                self.tappedOk2 = true
                                break
                            case .cancel:
                                print("cancel")
                                
                            case .destructive:
                                print("destructive")
                            }
                        }))
                        self.present(alert, animated: true, completion: nil)
                    }
                }
                }
                
                
            }
            
            
        } else {
            sec2 -= 1
            countdownLabel2.text = timeString(time: TimeInterval(sec2))
        }
    }
    
    func updateTimer3() {
        if sec3 < 1 {
            timer3.invalidate()
            self.tappedOk3 = false
            var presenting = false

            
            
            DispatchQueue.global(qos: .background).async {
                print("Run on background thread")
                for _ in 0 ... 15{
                    if(self.tappedOk3 == false){
                        AudioServicesPlaySystemSound(self.systemSoundID3)
                        sleep(1)
                    }
                    else{
                        break
                    }
                    
                    DispatchQueue.main.async {
                        if(presenting == false){
                            presenting = true
                        print("We finished that.")
                        //Send alert to indicate time's up.
                        let alert = UIAlertController(title: "Alert!", message: "Timer 3 is done!", preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { action in
                            switch action.style{
                            case .default:
                                print("default")
                                self.tappedOk3 = true
                                break
                            case .cancel:
                                print("cancel")
                                
                            case .destructive:
                                print("destructive")
                            }
                        }))
                        self.present(alert, animated: true, completion: nil)
                    }
                }
                }
                
            }
            
            
        } else {
            sec3 -= 1
            countdownTimer3.text = timeString(time: TimeInterval(sec3))
        }
    }
    
    
    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }

}

